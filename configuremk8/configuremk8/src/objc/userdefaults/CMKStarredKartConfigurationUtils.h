//
//  CMKStarredConfigureUtils.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/18/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CMKConfigureModel;
@class CMKKartConfigurationModel;

@interface CMKStarredKartConfigurationUtils : NSObject

+ (void)starKartConfiguration:(CMKKartConfigurationModel *)kartConfiguration;

+ (void)unstarKartConfiguration:(CMKKartConfigurationModel *)kartConfiguration;

+ (BOOL)isKartConfigurationStarred:(CMKKartConfigurationModel *)kartConfiguration;

+ (NSArray *)allStarredKartConfigurations;

@end
