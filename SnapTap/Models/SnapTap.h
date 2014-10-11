//
//  SnapTap.h
//  SnapTap
//
//  Created by Nate Armstrong on 5/29/14.
//  Copyright (c) 2014 Nate Armstrong. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const kFireBaseRootURL;
extern NSString * const kUserDefaultsKeyUsername;

@class STUser, STGame;
@protocol SnapTapDelegate;

@interface SnapTap : NSObject

@property (weak, nonatomic) id <SnapTapDelegate> delegate;

- (instancetype)initWithUrl:(NSString *)rootUrl;
- (void)observeGamesForUser:(NSString *)userId;
- (void)loginWithUserId:(NSString *)userId;

@end

@protocol SnapTapDelegate <NSObject>

- (void)loginStateDidChange:(STUser *)user;
- (void)gameWasAdded:(STGame *)game;

@end
