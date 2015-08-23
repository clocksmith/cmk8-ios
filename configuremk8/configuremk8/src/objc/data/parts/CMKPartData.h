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

@class CMKPartModel;

@interface CMKPartData : NSObject

@property (strong, nonatomic) NSDictionary *partTypeNames;
@property (strong, nonatomic) NSMutableArray *characterGroups;
@property (strong, nonatomic) NSMutableArray *vehicleGroups;
@property (strong, nonatomic) NSMutableArray *tireGroups;
@property (strong, nonatomic) NSMutableArray *gliderGroups;
@property (strong, nonatomic) NSMutableArray *allKartConfigurations;

+ (instancetype)sharedPartModelDataStore;

- (NSString *)partNameAt:(NSNumber *)index;

+ (NSMutableArray *)partGroupForType:(CMKPartType)partType;

+ (CMKPartGroupModel *)partGroupForPart:(CMKPartModel *)part;

- (void)initPartGroupsFor:(NSMutableArray *)partGroups
            withJsonArray:(NSMutableArray *)partGroupsJsonArray
             withPartType:(CMKPartType)partType;

@end
