//
//  CMKCompareModel.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/19/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKCompareModel.h"
#import "CMKKartConfigurationModel.h"

@implementation CMKCompareModel

- (instancetype)init {
  return [self initWithLeftKartConfiguration:nil
              initWithRightKartConfiguration:nil];
}

- (instancetype)initWithLeftKartConfiguration:(CMKKartConfigurationModel *)leftKartConfiguration
               initWithRightKartConfiguration:(CMKKartConfigurationModel *)rightKartConfiguration {
  self.leftKartConfiguration = leftKartConfiguration;
  self.rightKartConfiguration = rightKartConfiguration;
  return self;
}

- (BOOL)isEqual:(CMKCompareModel *)otherObject {
  return [self.leftKartConfiguration compare:otherObject.leftKartConfiguration] == NSOrderedSame &&
         [self.rightKartConfiguration compare:otherObject.rightKartConfiguration] == NSOrderedSame;
}

@end
