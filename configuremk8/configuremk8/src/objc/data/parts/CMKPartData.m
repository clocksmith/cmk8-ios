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

@interface CMKPartData ()

- (void)setupThePartsData;
- (void)initializeTheVariousProperties;

@end


@implementation CMKPartData

#pragma mark - Initializers

+ (instancetype)sharedPartModelDataStore {
    
    NSLog(@"SharedPartModel getting called!");
    
    static CMKPartData *_sharedPartModelDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedPartModelDataStore = [[CMKPartData alloc] init];
    });
    
    return _sharedPartModelDataStore;
}

- (instancetype)init {
    
    NSLog(@"init in CMKPartdata getting called");
    self = [super init];
    if (self) {
        
        NSLog(@"If self passed in CMKPartData");
        [self setupThePartsData];
    }
    return self;
}

- (void)setupThePartsData {
    
    NSLog(@"Inside setupthepartsdata");
    [self initializeTheVariousProperties];
    
    self.partTypeNames = @{
                           [NSNumber numberWithInt:Character] : @"character",
                           [NSNumber numberWithInt:Vehicle] : @"vehicle",
                           [NSNumber numberWithInt:Tire] : @"tire",
                           [NSNumber numberWithInt:Glider] : @"glider"
                           };
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"parts" ofType:@"json"];
    NSData *content = [[NSData alloc] initWithContentsOfFile:filePath];
    NSDictionary *partsJsonObj = [NSJSONSerialization JSONObjectWithData:content options:kNilOptions error:nil];
    
    

    
    [self initPartGroupsFor:self.characterGroups
                     withJsonArray:[partsJsonObj valueForKey:@"character_groups"]
                      withPartType:Character];
    [self initPartGroupsFor:self.vehicleGroups
                     withJsonArray:[partsJsonObj valueForKey:@"vehicle_groups"]
                      withPartType:Vehicle];
    [self initPartGroupsFor:self.tireGroups
                     withJsonArray:[partsJsonObj valueForKey:@"tire_groups"]
                      withPartType:Tire];
    [self initPartGroupsFor:self.gliderGroups
                     withJsonArray:[partsJsonObj valueForKey:@"glider_groups"]
                      withPartType:Glider];
    
    for (CMKPartGroupModel *characterGroup in self.characterGroups) {
        for (CMKPartGroupModel *vehicleGroup in self.vehicleGroups) {
            for (CMKPartGroupModel *tireGroup in self.tireGroups) {
                for (CMKPartGroupModel *gliderGroup in self.gliderGroups) {
                    [self.allKartConfigurations addObject:[[CMKKartConfigurationModel alloc]initWithCharacterGroup:characterGroup withVehicleGroup:vehicleGroup withTireGroup:tireGroup withGliderGroup:gliderGroup]];
                }
            }
        }
    }
    
    NSLog(@"What are we dealing with HEREE!!");
}


#pragma mark - Helper Methods

- (void)initializeTheVariousProperties {
    _partTypeNames = [NSDictionary new];
    _characterGroups = [NSMutableArray new];
    _vehicleGroups = [NSMutableArray new];
    _tireGroups = [NSMutableArray new];
    _gliderGroups = [NSMutableArray new];
    _allKartConfigurations = [NSMutableArray new];
}



- (NSString *)partNameAt:(NSNumber *)index {
    NSString *partName = self.partTypeNames[index];
    return partName;
}

+ (NSMutableArray *)partGroupForType:(CMKPartType)partType {
    CMKPartData *sharedInstance = [CMKPartData sharedPartModelDataStore];
    
    switch (partType) {
        case Character:
            return sharedInstance.characterGroups;
        case Vehicle:
            return sharedInstance.vehicleGroups;
        case Tire:
            return sharedInstance.tireGroups;
        case Glider:
            return sharedInstance.gliderGroups;
    }
}

+ (CMKPartGroupModel *)partGroupForPart:(CMKPartModel *)part {
    return [CMKPartData partGroupForType:part.partType][part.partGroupIndex];
}

- (void)initPartGroupsFor:(NSMutableArray *)partGroups
            withJsonArray:(NSMutableArray *)partGroupsJsonArray
             withPartType:(CMKPartType)partType {
    
    NSLog(@"What's happening here!!!");
    for (int i = 0; i < [partGroupsJsonArray count]; i++) {
        NSDictionary *partGroupJsonObj = [partGroupsJsonArray objectAtIndex:i];
        NSMutableArray *parts = [NSMutableArray new];
        NSArray *partsJsonArray =
        [partGroupJsonObj valueForKey:[NSString stringWithFormat:@"%@s", [self.partTypeNames objectForKey:@(partType)]]];
        
        for (int j = 0; j < [partsJsonArray count]; j++) {
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
