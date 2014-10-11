//
//  STViewController.m
//  SnapTap
//
//  Created by Nate Armstrong on 5/25/14.
//  Copyright (c) 2014 Nate Armstrong. All rights reserved.
//

#import "STViewController.h"
#import "STGame.h"
#import "STTarget.h"
#import "SnapTap.h"
#import <Firebase/Firebase.h>

@interface STViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *targetButtons;
@property (nonatomic, strong) STGame *game;
@property (nonatomic, strong) Firebase *firebase;
@end

@implementation STViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self.firebase observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
    if ([snapshot.value isKindOfClass:[NSNumber class]]) {
      NSNumber *index = snapshot.value;
      [self.game pressTargetAtIndex:[index integerValue]];
      [self updateUI];
    }
  }];
  [self.firebase removeValue];
//  [self restartTimer];
}

- (STGame *)game {
  if (!_game) _game = [[STGame alloc] initWithTargetsCount:[self.targetButtons count] firebase:self.firebase];
  return _game;
}

- (Firebase *)firebase {
  if (!_firebase) _firebase = [[Firebase alloc] initWithUrl:kFireBaseRootURL];
  return _firebase;
}

- (IBAction)targetPressed:(UIButton *)sender {
  NSUInteger index = [self.targetButtons indexOfObject:sender];
  [self.game pressTargetAtIndex:index];
  [self updateUI];
}

- (void)updateUI {
  for (UIButton *targetButton in self.targetButtons) {
    NSUInteger index = [self.targetButtons indexOfObject:targetButton];
    STTarget *target = [[self.game targets] objectAtIndex:index];
    if (target.isSelected) targetButton.backgroundColor = [UIColor redColor];
//    targetButton.hidden = target.isHidden;
  }
}

- (void)restartTimer {
  NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(showTarget:) userInfo:nil repeats:NO];
  NSRunLoop *runner = [NSRunLoop currentRunLoop];
  [runner addTimer:timer forMode: NSDefaultRunLoopMode];
}

- (void)showTarget:(NSTimer *)timer {
  int randomIndex = (arc4random() % [self.targetButtons count]);
  [self.game showTargetAtIndex:randomIndex];
  [self updateUI];
  [self restartTimer];
}

@end
