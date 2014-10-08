//
//  CMKAnalyticsUtils.h
//  configuremk8
//
//  Created by Anthony Robledo on 9/2/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CMKAdjustConfigurations.h"
#import "CMKPartModel.h"
#import "CMKKartConfigurationModel.h"

#import "GAITracker.h"

@interface CMKAnalyticsUtils : NSObject

+ (void)sendAdjustConfigurationCancelEvent:(id <GAITracker> )tracker
                   withAdjustConfiguration:(CMKAdjustConfiguration)adjustConfiguration
                        withPreferredStats:(CMKStatsModel *)preferredStats;

+ (void)sendAdjustConfigurationOKEvent:(id <GAITracker> )tracker
               withAdjustConfiguration:(CMKAdjustConfiguration)adjustConfiguration
                    withPreferredStats:(CMKStatsModel *)preferredStats;

+ (void)sendAdjustConfigurationEvent:(id <GAITracker> )tracker
                          withAction:(NSString *)action
             withAdjustConfiguration:(CMKAdjustConfiguration)adjustConfiguration
                  withPreferredStats:(CMKStatsModel *)preferredStats;

+ (void)sendBuildConfigurationEvent:(id <GAITracker> )tracker
            withAdjustConfiguration:(CMKAdjustConfiguration)adjustConfiguration
              withKartConfiguration:(CMKKartConfigurationModel *)kartConfiguration;

+ (void)sendPartViewClickedEvent:(id <GAITracker> )tracker
                  withScreenName:(NSString *)screenName
                        withPart:(CMKPartModel *)partModel;

+ (void)sendStarViewStarredEvent:(id <GAITracker> )tracker
           withKartConfiguration:(CMKKartConfigurationModel *)kartConfiguration
                       isStarred:(BOOL)isStarred;

+ (void)sendCompareViewSelectedEvent:(id <GAITracker> )tracker
               withKartConfiguration:(CMKKartConfigurationModel *)kartConfiguration;

+ (void)sendRateButtonClicked:(id <GAITracker> )tracker;

+ (void)sendDonateButtonClicked:(id <GAITracker> )tracker;

+ (void)sendDonationComplete:(id <GAITracker> )tracker withProductId:(NSString *)productId;

+ (void)sendErrorLogEvent:(id <GAITracker> )tracker withErrorMessage:(NSString *)errorMessage;

@end
