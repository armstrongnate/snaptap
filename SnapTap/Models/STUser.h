//
//  STUser.h
//  SnapTap
//
//  Created by Nate Armstrong on 5/29/14.
//  Copyright (c) 2014 Nate Armstrong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STUser : NSObject

@property (nonatomic, strong) NSString *username;

+ (STUser *)authenticatedUser;
- (STUser *)initWithUsername:(NSString *)username;

@end
