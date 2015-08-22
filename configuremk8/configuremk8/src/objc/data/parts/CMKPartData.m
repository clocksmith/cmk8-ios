//
//  CMKParts.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/13/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKConstants.h"
#import "CMKKartConfigurationModel.h"
#import "CMKPartData.h"
#import "CMKPartGroupModel.h"
#import "CMKStatsModel.h"

#define _TAG (NSStringFromClass([CMKPartData class]))

@implementation CMKPartData

static NSDictionary *_partTypeNames;

// Groups.
static NSMutableArray *_characterGroups;
static NSMutableArray *_vehicleGroups;
static NSMutableArray *_tireGroups;
static NSMutableArray *_gliderGroups;

// All kart configurations.
static NSMutableArray *_allKartConfigurations;

+ (void)initialize {
  // Need to do if we call initialize directly.
  static BOOL initialized = NO;

  if (!initialized) {
    NSLog(@"initializing parts", _TAG);
    initialized = YES;

    _partTypeNames = @{
      [NSNumber numberWithInt:Character] : @"character",
      [NSNumber numberWithInt:Vehicle] : @"vehicle",
      [NSNumber numberWithInt:Tire] : @"tire",
      [NSNumber numberWithInt:Glider] : @"glider"
    };

    // Groups.
    _characterGroups = [NSMutableArray array];
    _vehicleGroups = [NSMutableArray array];
    _tireGroups = [NSMutableArray array];
    _gliderGroups = [NSMutableArray array];

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"parts" ofType:@"json"];
    NSData *content = [[NSData alloc] initWithContentsOfFile:filePath];
    NSDictionary *partsJsonObj = [NSJSONSerialization JSONObjectWithData:content options:kNilOptions error:nil];

    [CMKPartData initPartGroupsFor:_characterGroups
                     withJsonArray:[partsJsonObj valueForKey:@"character_groups"]
                      withPartType:Character];
    [CMKPartData initPartGroupsFor:_vehicleGroups
                     withJsonArray:[partsJsonObj valueForKey:@"vehicle_groups"]
                      withPartType:Vehicle];
    [CMKPartData initPartGroupsFor:_tireGroups
                     withJsonArray:[partsJsonObj valueForKey:@"tire_groups"]
                      withPartType:Tire];
    [CMKPartData initPartGroupsFor:_gliderGroups
                     withJsonArray:[partsJsonObj valueForKey:@"glider_groups"]
                      withPartType:Glider];

    // All kart configurations.
    _allKartConfigurations = [NSMutableArray array];

    for (CMKPartGroupModel *characterGroup in _characterGroups) {
      for (CMKPartGroupModel *vehicleGroup in _vehicleGroups) {
        for (CMKPartGroupModel *tireGroup in _tireGroups) {
          for (CMKPartGroupModel *gliderGroup in _gliderGroups) {
            [_allKartConfigurations addObject:[[CMKKartConfigurationModel alloc] initWithCharacterGroup:characterGroup
                                                                                       withVehicleGroup:vehicleGroup
                                                                                          withTireGroup:tireGroup
                                                                                        withGliderGroup:gliderGroup]];
          }
        }
      }
    }

    NSLog(@"%@parts initialized", _TAG);
    NSLog(@"%@_characterGroups count: %lu", _TAG, [_characterGroups count]);
  }
}

// Groups.
+ (NSArray *)characterGroups {
  return _characterGroups;
}

+ (NSArray *)vehicleGroups {
  return _vehicleGroups;
}

+ (NSArray *)tireGroups {
  return _tireGroups;
}

+ (NSArray *)gliderGroups {
  return _gliderGroups;
}

// All kart configurations.
+ (NSArray *)allKartConfigurations {
  return _allKartConfigurations;
}

+ (NSString *)partNameAt:(NSNumber *)index {
  return _partTypeNames[index];
}

+ (NSMutableArray *)partGroupForType:(CMKPartType)partType {
  switch (partType) {
    case Character:
      return [CMKPartData characterGroups];
    case Vehicle:
      return [CMKPartData vehicleGroups];
    case Tire:
      return [CMKPartData tireGroups];
    case Glider:
      return [CMKPartData gliderGroups];

    default:
      break;
  }
}

+ (CMKPartGroupModel *)partGroupForPart:(CMKPartModel *)part {
  return [CMKPartData partGroupForType:part.partType][part.partGroupIndex];
}

+ (void)initPartGroupsFor:(NSMutableArray *)partGroups
            withJsonArray:(NSMutableArray *)partGroupsJsonArray
             withPartType:(CMKPartType)partType {
  NSLog(@"%@ initPartGroupsFor:%@", _TAG, [CMKPartData partNameAt:@(partType)]);

  for (int i = 0; i < [partGroupsJsonArray count]; i++) {
    NSLog(@"%@ adding part group %d", _TAG, i);
    NSDictionary *partGroupJsonObj = [partGroupsJsonArray objectAtIndex:i];

    NSMutableArray *parts = [NSMutableArray array];
    NSArray *partsJsonArray =
        [partGroupJsonObj valueForKey:[NSString stringWithFormat:@"%@s", [_partTypeNames objectForKey:@(partType)]]];
    for (int j = 0; j < [partsJsonArray count]; j++) {
      NSLog(@"%@ adding part %d", _TAG, j);
      [parts addObject:[[CMKPartModel alloc] initWithName:[partsJsonArray objectAtIndex:j]
                                             withPartType:partType
                                       withPartGroupIndex:i]];
    }

    NSDictionary *statsJsonObj = [partGroupJsonObj objectForKey:@"stats"];
    CMKStatsModel *stats =
        [[CMKStatsModel alloc] initWithAcceleration:[[statsJsonObj objectForKey:@"acceleration"] doubleValue]
                                    withGroundSpeed:[[statsJsonObj objectForKey:@"ground_speed"] doubleValue]
                               withAntigravitySpeed:[[statsJsonObj objectForKey:@"antigravity_speed"] doubleValue]
                                       withAirSpeed:[[statsJsonObj objectForKey:@"air_speed"] doubleValue]
                                     withWaterSpeed:[[statsJsonObj objectForKey:@"water_speed"] doubleValue]
                                      withMiniturbo:[[statsJsonObj objectForKey:@"miniturbo"] doubleValue]
                                 withGroundHandling:[[statsJsonObj objectForKey:@"ground_handling"] doubleValue]
                            withAntigravityHandling:[[statsJsonObj objectForKey:@"antigravity_handling"] doubleValue]
                                    withAirHandling:[[statsJsonObj objectForKey:@"air_handling"] doubleValue]
                                  withWaterHandling:[[statsJsonObj objectForKey:@"water_handling"] doubleValue]
                                       withTraction:[[statsJsonObj objectForKey:@"traction"] doubleValue]
                                         withWeight:[[statsJsonObj objectForKey:@"weight"] doubleValue]];

    [partGroups addObject:[[CMKPartGroupModel alloc] initWithType:partType
                                                         withName:[partGroupJsonObj objectForKey:@"name"]
                                                        withStats:stats
                                                        withParts:parts
                                                        withIndex:i]];
  }
}

@end
