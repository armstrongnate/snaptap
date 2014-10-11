//
//  STGame.m
//  SnapTap
//
//  Created by Nate Armstrong on 5/25/14.
//  Copyright (c) 2014 Nate Armstrong. All rights reserved.
//

#import "STGame.h"
#import "STTarget.h"

@interface STGame ()
@property (nonatomic, strong) Firebase *firebase;
@end

@implementation STGame

- (instancetype)initWithTargetsCount:(NSUInteger)count firebase:(Firebase *)firebase {
  self = [super init];
  self.firebase = firebase;
  self.targets = [[NSMutableArray alloc] init];
  for (int i = 0; i < count; i++) {
    STTarget *target = [[STTarget alloc] init];
    [self.targets addObject:target];
  }

  return self;
}

- (STTarget *)targetAtIndex:(NSUInteger)index {
  return [self.targets objectAtIndex:index];
}

- (void)pressTargetAtIndex:(NSUInteger)index {
  STTarget *target = [self targetAtIndex:index];
  if (!target.isSelected) [self.firebase setValue:[NSNumber numberWithInteger:index]];
  target.selected = YES;
}

- (void)showTargetAtIndex:(NSUInteger)index {
  STTarget *target = [self targetAtIndex:index];
  target.hidden = NO;
}

@end
