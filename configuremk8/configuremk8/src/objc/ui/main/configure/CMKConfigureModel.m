//
//  CMKConfigureModel.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/18/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKConfigureModel.h"
#import "CMKKartConfigurationModel.h"
#import "CMKPartData.h"
#import "CMKStarredKartConfigurationUtils.h"

@implementation CMKConfigureModel

- (instancetype)init {
  return [self initWithKartConfiguration:[[CMKKartConfigurationModel alloc]
                                             initWithCharacterGroup:[CMKPartData characterGroups][0]
                                                   withVehicleGroup:[CMKPartData vehicleGroups][0]
                                                      withTireGroup:[CMKPartData tireGroups][0]
                                                    withGliderGroup:[CMKPartData gliderGroups][0]]];
}

- (instancetype)initWithKartConfiguration:(CMKKartConfigurationModel *)kartConfiguration {
  self.kartConfiguration = kartConfiguration;

  return self;
}

@end
