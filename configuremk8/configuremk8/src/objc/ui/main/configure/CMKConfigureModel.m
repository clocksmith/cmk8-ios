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
    CMKPartData *sharedInstance = [CMKPartData sharedPartModelDataStore];
    
  return [self initWithKartConfiguration:[[CMKKartConfigurationModel alloc]
                                             initWithCharacterGroup:sharedInstance.characterGroups[0]
                                                   withVehicleGroup:sharedInstance.vehicleGroups[0]
                                                      withTireGroup:sharedInstance.tireGroups[0]
                                                    withGliderGroup:sharedInstance.gliderGroups[0]]];
}

- (instancetype)initWithKartConfiguration:(CMKKartConfigurationModel *)kartConfiguration {
  self.kartConfiguration = kartConfiguration;

  return self;
}

@end
