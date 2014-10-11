//
//  STGame.h
//  SnapTap
//
//  Created by Nate Armstrong on 5/25/14.
//  Copyright (c) 2014 Nate Armstrong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Firebase/Firebase.h>

@class STTarget;

@interface STGame : NSObject

@property (nonatomic, strong) NSMutableArray *targets;

- (instancetype)initWithTargetsCount:(NSUInteger)count firebase:(Firebase *)firebase;
- (STTarget *)targetAtIndex:(NSUInteger)index;
- (void)pressTargetAtIndex:(NSUInteger)index;
- (void)showTargetAtIndex:(NSUInteger)index;

@end
