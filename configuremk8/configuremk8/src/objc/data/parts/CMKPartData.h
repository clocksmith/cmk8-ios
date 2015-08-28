//
//  CMKParts.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/13/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMKPartGroupModel.h"
#import "CMKPartType.h"
#import "CMKPartModel.h"
#import "CMKOrderedDictionary.h"
#import "CMKMutableOrderedDictionary.h"

@class CMKPartModel;

@interface CMKPartData : NSObject

// Groups.
+ (CMKOrderedDictionary *)characterGroups;
+ (CMKOrderedDictionary *)vehicleGroups;
+ (CMKOrderedDictionary *)tireGroups;
+ (CMKOrderedDictionary *)gliderGroups;

// All kart configurations.
+ (NSMutableArray *)allKartConfigurations;

+ (int)partCount;

+ (NSString *)nameForPartType:(CMKPartType)partType;

+ (CMKOrderedDictionary *)partGroupsForType:(CMKPartType)partType;

+ (CMKPartGroupModel *)partGroupForPart:(CMKPartModel *)part;

+ (void)initPartGroupsFor:(CMKMutableOrderedDictionary *)partGroups
            withJsonArray:(NSMutableArray *)partGroupsJsonArray
             withPartType:(CMKPartType)partType;

@end
