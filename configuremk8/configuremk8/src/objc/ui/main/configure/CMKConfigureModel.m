//
//  CMKConfigureModel.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/18/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKConfigureModel.h"
#import "CMKKartConfigurationModel.h"
#import "CMKParts.h"
#import "CMKStarredKartConfigurationUtils.h"

@implementation CMKConfigureModel

- (instancetype)init {
  return [self initWithKartConfiguration:[[CMKKartConfigurationModel alloc]
                                          initWithCharacterGroup:[CMKParts flyweight]
                                                withVehicleGroup:[CMKParts vehicleA]
                                                   withTireGroup:[CMKParts tireA]
                                                 withGliderGroup:[CMKParts gliderA]]];
}

- (instancetype)initWithKartConfiguration:(CMKKartConfigurationModel *)kartConfiguration {
  self.kartConfiguration = kartConfiguration;

  return self;
}

@end
