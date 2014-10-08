//
//  CMKKartConfiguration.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/17/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMKSpinnerView.h"

@class CMKPartGroupModel;
@class CMKStatsModel;

@interface CMKKartConfigurationModel : NSObject <CMKSpinnerItem>

@property (nonatomic, strong) CMKPartGroupModel *characterGroup;
@property (nonatomic, strong) CMKPartGroupModel *vehicleGroup;
@property (nonatomic, strong) CMKPartGroupModel *tireGroup;
@property (nonatomic, strong) CMKPartGroupModel *gliderGroup;

- (instancetype)initWithCharacterGroup:(CMKPartGroupModel *)characterGroup
                      withVehicleGroup:(CMKPartGroupModel *)vehicleGroup
                         withTireGroup:(CMKPartGroupModel *)tireGroup
                       withGliderGroup:(CMKPartGroupModel *)gliderGroup;

- (instancetype)initWithUserDefaultsKey:(NSString *)key;

- (CMKStatsModel *)   kartStats;

- (NSArray *)         partGroups;

- (NSComparisonResult)compare:(CMKKartConfigurationModel *)otherObject;

- (NSString *)        keyForUserDefaults;

- (NSString *)        name;

@end
