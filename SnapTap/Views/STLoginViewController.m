//
//  STLoginViewController.m
//  SnapTap
//
//  Created by Nate Armstrong on 5/29/14.
//  Copyright (c) 2014 Nate Armstrong. All rights reserved.
//

#import "STLoginViewController.h"
#import "STUser.h"
#import "STAppDelegate.h"

@interface STLoginViewController ()
@property (nonatomic, strong) SnapTap *snapTap;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@end

@implementation STLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    self.snapTap = [[SnapTap alloc] initWithUrl:kFireBaseRootURL];
    self.snapTap.delegate = self;
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.snapTap = [[SnapTap alloc] initWithUrl:kFireBaseRootURL];
  self.snapTap.delegate = self;
}

- (IBAction)submitButtonPressed:(UIButton *)sender {
  [self.snapTap loginWithUserId:self.usernameTextField.text];
}

- (void)loginStateDidChange:(STUser *)user
{
  if (user) {
    STAppDelegate *appDelegateTemp = [[UIApplication sharedApplication]delegate];
    appDelegateTemp.window.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateInitialViewController];
  }
}

- (void)gameWasAdded:(STGame *)game
{
  // noop
}

@end
