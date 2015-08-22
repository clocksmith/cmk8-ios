//
//  CMKPartGroup.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/13/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMKPartType.h"

@class CMKStatsModel;

@interface CMKPartGroupModel : NSObject

@property(nonatomic, assign) CMKPartType type;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, strong) CMKStatsModel *stats;
@property(nonatomic, strong) NSArray *parts;
@property(nonatomic, assign) int index;
@property(nonatomic, readonly, copy) NSString *displayName;

// TODO(clocksmith): How come the parameters need to be prefixed with "the" here and not in CMKStats
- (CMKPartGroupModel *)initWithType:(CMKPartType)theType
                           withName:(NSString *)theName
                          withStats:(CMKStatsModel *)theStats
                          withParts:(NSArray *)theParts
                          withIndex:(int)index;

- (NSString *)displayName;

- (NSComparisonResult)compare:(CMKPartGroupModel *)otherObject;

@end
