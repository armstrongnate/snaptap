//
//  SnapTap.m
//  SnapTap
//
//  Created by Nate Armstrong on 5/29/14.
//  Copyright (c) 2014 Nate Armstrong. All rights reserved.
//

#import "SnapTap.h"
#import "STUser.h"
#import "STGame.h"

#import <Firebase/Firebase.h>

NSString * const kFireBaseRootURL = @"https://incandescent-fire-8743.firebaseio.com/";
NSString * const kUserDefaultsKeyUsername = @"username";

@interface SnapTap ()

@property (nonatomic, strong) Firebase *root;

@end

@implementation SnapTap

- (instancetype)initWithUrl:(NSString *)rootUrl
{
  self = [super init];
  if (self) {
    self.root = [[Firebase alloc] initWithUrl:rootUrl];
  }

  return self;
}

- (void)loginWithUserId:(NSString *)userId
{
  if (userId.length > 0) {
    Firebase *userRef = [[self.root childByAppendingPath:@"users"] childByAppendingPath:userId];
    NSDictionary *user = @{@"username" : userId};
    __weak SnapTap *weakSelf = self;
    [userRef setValue:user withCompletionBlock:^(NSError *error, Firebase *ref) {
      if (error) {
        NSLog(@"Error setting user");
      }
      else if (weakSelf) {
        [weakSelf.delegate loginStateDidChange:[[STUser alloc] initWithUsername:ref.name]];
      }
    }];
  }
}

- (void)observeGamesForUser:(NSString *)userId
{
  Firebase *ref = [[[self.root childByAppendingPath:@"users"] childByAppendingPath:userId] childByAppendingPath:@"games"];
  [ref observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
    STGame *game = [[STGame alloc] init];
    [self.delegate gameWasAdded:game];
  }];
}

@end
