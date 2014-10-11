//
//  STUser.m
//  SnapTap
//
//  Created by Nate Armstrong on 5/29/14.
//  Copyright (c) 2014 Nate Armstrong. All rights reserved.
//

#import "STUser.h"
#import "SnapTap.h"

@implementation STUser

+ (STUser *)authenticatedUser
{
  NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:kUserDefaultsKeyUsername];
  if (!username) return nil;
  return [[self alloc] initWithUsername:username];
}

- (STUser *)initWithUsername:(NSString *)username
{
  self = [super init];
  if (self) {
    self.username = username;
  }

  return self;
}

@end
