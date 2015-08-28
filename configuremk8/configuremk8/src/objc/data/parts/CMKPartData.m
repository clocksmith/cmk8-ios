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

static NSMutableDictionary *_partTypeToPartGroupsDict;
static NSMutableDictionary *_partNameToPartGroupDict;

// Groups.
static CMKMutableOrderedDictionary *_characterGroups;
static CMKMutableOrderedDictionary *_vehicleGroups;
static CMKMutableOrderedDictionary *_tireGroups;
static CMKMutableOrderedDictionary *_gliderGroups;

// All kart configurations.
static NSMutableArray *_allKartConfigurations;

static int _partCount;

+ (void)initialize {
  // Need to do if we call initialize directly.
  static BOOL initialized = NO;

  if (!initialized) {
    NSLog(@"%@ initializing parts", _TAG);
    initialized = YES;

    _partCount = 0;

    _partTypeNames = @{
      [NSNumber numberWithInt:Character] : @"character",
      [NSNumber numberWithInt:Vehicle] : @"vehicle",
      [NSNumber numberWithInt:Tire] : @"tire",
      [NSNumber numberWithInt:Glider] : @"glider"
    };

    _partTypeToPartGroupsDict = [NSMutableDictionary new];
    _partNameToPartGroupDict = [NSMutableDictionary new];

    // Groups.
    _characterGroups = [[CMKMutableOrderedDictionary alloc] init];
    _vehicleGroups = [[CMKMutableOrderedDictionary alloc] init];
    _tireGroups = [[CMKMutableOrderedDictionary alloc] init];
    _gliderGroups = [[CMKMutableOrderedDictionary alloc] init];

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

    for (CMKPartGroupModel *characterGroup in [_characterGroups allValues]) {
      for (CMKPartGroupModel *vehicleGroup in [_vehicleGroups allValues]) {
        for (CMKPartGroupModel *tireGroup in [_tireGroups allValues]) {
          for (CMKPartGroupModel *gliderGroup in [_gliderGroups allValues]) {
            [_allKartConfigurations addObject:[[CMKKartConfigurationModel alloc] initWithCharacterGroup:characterGroup
                                                                                       withVehicleGroup:vehicleGroup
                                                                                          withTireGroup:tireGroup
                                                                                        withGliderGroup:gliderGroup]];
          }
        }
      }
    }
  }
}

// Groups.
+ (CMKOrderedDictionary *)characterGroups {
  return _characterGroups;
}

+ (CMKOrderedDictionary *)vehicleGroups {
  return _vehicleGroups;
}

+ (CMKOrderedDictionary *)tireGroups {
  return _tireGroups;
}

+ (CMKOrderedDictionary *)gliderGroups {
  return _gliderGroups;
}

// All kart configurations.
+ (NSArray *)allKartConfigurations {
  return _allKartConfigurations;
}

+ (int)partCount {
  return _partCount;
}

+ (NSString *)nameForPartType:(CMKPartType)partType {
  return _partTypeNames[@(partType)];
}

+ (CMKOrderedDictionary *)partGroupsForType:(CMKPartType)partType {
  return _partTypeToPartGroupsDict[[CMKPartData nameForPartType:partType]];
}

+ (CMKPartGroupModel *)partGroupForPart:(CMKPartModel *)part {
  return [CMKPartData partGroupsForType:part.partType][part.partGroupIndex];
}

+ (void)initPartGroupsFor:(CMKMutableOrderedDictionary *)partGroups
            withJsonArray:(NSMutableArray *)partGroupsJsonArray
             withPartType:(CMKPartType)partType {
  for (int i = 0; i < [partGroupsJsonArray count]; i++) {
    NSDictionary *partGroupJsonObj = [partGroupsJsonArray objectAtIndex:i];

    NSMutableArray *parts = [NSMutableArray array];
    NSArray *partsJsonArray =
        [partGroupJsonObj valueForKey:[NSString stringWithFormat:@"%@s", [_partTypeNames objectForKey:@(partType)]]];
    for (int j = 0; j < [partsJsonArray count]; j++) {
      [parts addObject:[[CMKPartModel alloc] initWithName:[partsJsonArray objectAtIndex:j]
                                             withPartType:partType
                                       withPartGroupIndex:i]];
      _partCount++;
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

    NSString *partGroupName = [partGroupJsonObj objectForKey:@"name"];
    CMKPartGroupModel *partGroup = [[CMKPartGroupModel alloc] initWithType:partType
                                                                  withName:partGroupName
                                                                 withStats:stats
                                                                 withParts:parts
                                                                 withIndex:i];

    [partGroups setObject:partGroup forKey:partGroupName];

    for (CMKPartModel *part in [partGroup parts]) {
      _partNameToPartGroupDict[part.name] = partGroup;
    }
  }

  _partTypeToPartGroupsDict[[CMKPartData nameForPartType:partType]] = partGroups;
}

@end
