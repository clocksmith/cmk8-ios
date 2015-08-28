//
//  CMKKartConfiguration.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/17/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKConstants.h"
#import "CMKKartConfigurationModel.h"
#import "CMKPartGroupModel.h"
#import "CMKStatsModel.h"
#import "CMKPartData.h"
#import "CMKPartType.h"
#import "CMKStarredKartConfigurationUtils.h"

#define _TAG (NSStringFromClass([CMKKartConfigurationModel class]))

@interface CMKKartConfigurationModel ()

- (float)attributeSum:(NSString *)key;

@end

@implementation CMKKartConfigurationModel

- (instancetype)initWithCharacterGroup:(CMKPartGroupModel *)characterGroup
                      withVehicleGroup:(CMKPartGroupModel *)vehicleGroup
                         withTireGroup:(CMKPartGroupModel *)tireGroup
                       withGliderGroup:(CMKPartGroupModel *)gliderGroup {
  self.characterGroup = characterGroup;
  self.vehicleGroup = vehicleGroup;
  self.tireGroup = tireGroup;
  self.gliderGroup = gliderGroup;

  return self;
}

- (instancetype)initWithUserDefaultsKey:(NSString *)key {
  if (key) {
    NSArray *keyComponents = [key componentsSeparatedByString:KEY_SEPERATOR];

    self.characterGroup = [CMKPartData partGroupsForType:Character][keyComponents[0]];
    self.vehicleGroup = [CMKPartData partGroupsForType:Vehicle][keyComponents[1]];
    self.tireGroup = [CMKPartData partGroupsForType:Tire][keyComponents[2]];
    self.gliderGroup = [CMKPartData partGroupsForType:Glider][keyComponents[3]];
    return self;
  } else {
    return nil;
  }
}

- (CMKStatsModel *)kartStats {
  CMKStatsModel *kartStats = [CMKStatsModel alloc];

  for (NSString *key in [CMKStatsModel attributeKeys]) {
    [kartStats setValue:[NSNumber numberWithFloat:[self attributeSum:key]] forKey:key];
  }

  return kartStats;
}

- (NSArray *)partGroups {
  return @[ self.characterGroup, self.vehicleGroup, self.tireGroup, self.gliderGroup ];
}

- (float)attributeSum:(NSString *)key {
  return [[self.characterGroup.stats valueForKey:key] floatValue] +
         [[self.vehicleGroup.stats valueForKey:key] floatValue] + [[self.tireGroup.stats valueForKey:key] floatValue] +
         [[self.gliderGroup.stats valueForKey:key] floatValue];
}

- (NSComparisonResult)compare:(CMKKartConfigurationModel *)otherObject {
  NSComparisonResult characterResult = [self.characterGroup compare:otherObject.characterGroup];

  if (characterResult == NSOrderedSame) {
    NSComparisonResult vehicleResult = [self.vehicleGroup compare:otherObject.vehicleGroup];

    if (vehicleResult == NSOrderedSame) {
      NSComparisonResult tireResult = [self.tireGroup compare:otherObject.tireGroup];

      if (tireResult == NSOrderedSame) {
        return [self.gliderGroup compare:otherObject.gliderGroup];
      }

      return tireResult;
    }

    return vehicleResult;
  }

  return characterResult;
}

- (NSString *)keyForUserDefaults {
  return [@[ self.characterGroup.name, self.vehicleGroup.name, self.tireGroup.name, self.gliderGroup.name ]
      componentsJoinedByString:KEY_SEPERATOR];
}

- (NSString *)displayName {
  return [@[ self.characterGroup.displayName, self.vehicleGroup.name, self.tireGroup.name, self.gliderGroup.name ]
      componentsJoinedByString:NAME_SEPERATOR];
}

#pragma mark - CMKSpinneritem

- (NSString *)displayText {
  return [self displayName];
}

@end
