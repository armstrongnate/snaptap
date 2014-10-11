//
//  STTarget.h
//  SnapTap
//
//  Created by Nate Armstrong on 5/25/14.
//  Copyright (c) 2014 Nate Armstrong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STTarget : NSObject
@property (nonatomic, getter = isSelected) BOOL selected;
@property (nonatomic, getter = isHidden) BOOL hidden;

@end
