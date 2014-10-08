//
//  CMKPartGroup.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/13/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CMKStatsModel;

typedef NS_ENUM (NSInteger, CMKPartGroupType) {
  Character,
  Vehicle,
  Tire,
  Glider,
};

@interface CMKPartGroupModel : NSObject

@property (nonatomic, assign) CMKPartGroupType type;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) CMKStatsModel *stats;
@property (nonatomic, strong) NSArray *parts;
@property (nonatomic, readonly, copy) NSString *displayName;

// TODO(clocksmith): How come the parameters need to be prefixed with "the" here and not in
// CMKStats?
- (CMKPartGroupModel *)initWithType:(CMKPartGroupType)theType
                           withName:(NSString *)theName
                          withStats:(CMKStatsModel *)theStats
                          withParts:(NSArray *)theParts;

- (NSString *)         displayName;

- (NSComparisonResult)compare:(CMKPartGroupModel *)otherObject;

@end
