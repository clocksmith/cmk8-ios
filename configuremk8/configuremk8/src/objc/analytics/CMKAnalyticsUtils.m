//
//  CMKAnalyticsUtils.m
//  configuremk8
//
//  Created by Anthony Robledo on 9/2/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKAnalyticsUtils.h"
#import "CMKStatsModel.h"
#import "CMKKartConfigurationModel.h"
#import "CMKPartGroupModel.h"

#import "GAIDictionaryBuilder.h"
#import "GAIFields.h"

// TODO(clocksmith): A lot of repeated code in this class. Refactor it.
@implementation CMKAnalyticsUtils

static NSString *const _ADJUST_CONFIGURATION_CATEGORY_CUSTOM = @"Adjust Configuration Custom";
static NSString *const _ADJUST_BUILD_RESULT_CATEGORY_CUSTOM = @"Adjust Build Result Custom";
static NSString *const _ADJUST_BUILD_RESULT_CATEGORY_SIMPLE = @"Adjust Build Result Simple";
static NSString *const _PART_VIEW_CATEGORY = @"Part View";
static NSString *const _STAR_VIEW_CATEGORY_CUSTOM = @"Star View Custom";
static NSString *const _STAR_VIEW_CATEGORY_SIMPLE = @"Star View Simple";
static NSString *const _COMPARE_VIEW_CATEGORY_CUSTOM = @"Compare View Custom";
static NSString *const _COMPARE_VIEW_CATEGORY_SIMPLE = @"Compare View Simple";
static NSString *const _BUTTON_CATEGORY = @"Button";
static NSString *const _DONATION_CATEGORY = @"Donation";
static NSString *const _ERROR_CATEGORY = @"Error";

static NSString *const _OK_ACTION = @"OK";
static NSString *const _CANCEL_ACTION = @"Cancel";
static NSString *const _CLICK_ACTION = @"Click";
static NSString *const _STAR_ACTION = @"Star";
static NSString *const _UNSTAR_ACTION = @"Unstar";
static NSString *const _SELECT_ACTION = @"Select";
static NSString *const _DONATE_ACTION = @"Donate";

static NSString *const _RATE_BUTTON_LABEL = @"Rate Button";
static NSString *const _DONATE_BUTTON_LABEL = @"Donate Button";

static const int _CUSTOM_METRIC_ATTRIBUTE_ACCELERATION_INDEX = 1;
static const int _CUSTOM_METRIC_ATTRIBUTE_AVERAGE_SPEED_INDEX = 2;
static const int _CUSTOM_METRIC_ATTRIBUTE_AVERAGE_HANDLING_INDEX = 3;
static const int _CUSTOM_METRIC_ATTRIBUTE_MINITURBO_INDEX = 4;
static const int _CUSTOM_METRIC_ATTRIBUTE_TRACTION_INDEX = 5;
static const int _CUSTOM_METRIC_ATTRIBUTE_WEIGHT_INDEX = 6;

static const int _CUSTOM_DIMENSION_CHARACTER_GROUP = 1;
static const int _CUSTOM_DIMENSION_VEHICLE_GROUP = 2;
static const int _CUSTOM_DIMENSION_TIRE_GROUP = 3;
static const int _CUSTOM_DIMENSION_GLIDER_GROUP = 4;
static const int _CUSTOM_DIMENSION_PARENT_FRAGMENT = 5;

+ (void)sendAdjustConfigurationCancelEvent:(id<GAITracker>)tracker
                   withAdjustConfiguration:(CMKAdjustConfiguration)adjustConfiguration
                        withPreferredStats:(CMKStatsModel *)preferredStats {
  [CMKAnalyticsUtils sendAdjustConfigurationEvent:tracker
                                       withAction:_CANCEL_ACTION
                          withAdjustConfiguration:adjustConfiguration
                               withPreferredStats:preferredStats];
}

+ (void)sendAdjustConfigurationOKEvent:(id<GAITracker>)tracker
               withAdjustConfiguration:(CMKAdjustConfiguration)adjustConfiguration
                    withPreferredStats:(CMKStatsModel *)preferredStats {
  [CMKAnalyticsUtils sendAdjustConfigurationEvent:tracker
                                       withAction:_OK_ACTION
                          withAdjustConfiguration:adjustConfiguration
                               withPreferredStats:preferredStats];
}

+ (void)sendAdjustConfigurationEvent:(id<GAITracker>)tracker
                          withAction:(NSString *)action
             withAdjustConfiguration:(CMKAdjustConfiguration)adjustConfiguration
                  withPreferredStats:(CMKStatsModel *)preferredStats {
  GAIDictionaryBuilder *builder = [GAIDictionaryBuilder
      createEventWithCategory:_ADJUST_CONFIGURATION_CATEGORY_CUSTOM
                       action:action
                        label:[CMKAdjustConfigurations
                                  analyticsNameForIndex:[NSNumber numberWithInt:adjustConfiguration]]
                        value:nil];

  [builder set:[[NSNumber numberWithFloat:[preferredStats
                                              statValueForIndex:[NSNumber numberWithInt:Acceleration]]] stringValue]
        forKey:[GAIFields customMetricForIndex:_CUSTOM_METRIC_ATTRIBUTE_ACCELERATION_INDEX]];
  [builder set:[[NSNumber numberWithFloat:[preferredStats
                                              statValueForIndex:[NSNumber numberWithInt:AverageSpeed]]] stringValue]
        forKey:[GAIFields customMetricForIndex:_CUSTOM_METRIC_ATTRIBUTE_AVERAGE_SPEED_INDEX]];
  [builder set:[[NSNumber numberWithFloat:[preferredStats
                                              statValueForIndex:[NSNumber numberWithInt:AverageHandling]]] stringValue]
        forKey:[GAIFields customMetricForIndex:_CUSTOM_METRIC_ATTRIBUTE_AVERAGE_HANDLING_INDEX]];
  [builder set:[[NSNumber
                   numberWithFloat:[preferredStats statValueForIndex:[NSNumber numberWithInt:Miniturbo]]] stringValue]
        forKey:[GAIFields customMetricForIndex:_CUSTOM_METRIC_ATTRIBUTE_MINITURBO_INDEX]];
  [builder set:[[NSNumber
                   numberWithFloat:[preferredStats statValueForIndex:[NSNumber numberWithInt:Traction]]] stringValue]
        forKey:[GAIFields customMetricForIndex:_CUSTOM_METRIC_ATTRIBUTE_TRACTION_INDEX]];
  [builder
         set:[[NSNumber numberWithFloat:[preferredStats statValueForIndex:[NSNumber numberWithInt:Weight]]] stringValue]
      forKey:[GAIFields customMetricForIndex:_CUSTOM_METRIC_ATTRIBUTE_WEIGHT_INDEX]];

  [tracker send:[builder build]];
}

+ (void)sendBuildConfigurationEvent:(id<GAITracker>)tracker
            withAdjustConfiguration:(CMKAdjustConfiguration)adjustConfiguration
              withKartConfiguration:(CMKKartConfigurationModel *)kartConfiguration {
  // Custom.
  GAIDictionaryBuilder *builder = [GAIDictionaryBuilder
      createEventWithCategory:_ADJUST_BUILD_RESULT_CATEGORY_CUSTOM
                       action:nil
                        label:[CMKAdjustConfigurations
                                  analyticsNameForIndex:[NSNumber numberWithInt:adjustConfiguration]]
                        value:nil];

  [builder set:kartConfiguration.characterGroup.name
        forKey:[GAIFields customDimensionForIndex:_CUSTOM_DIMENSION_CHARACTER_GROUP]];
  [builder set:kartConfiguration.vehicleGroup.name
        forKey:[GAIFields customDimensionForIndex:_CUSTOM_DIMENSION_VEHICLE_GROUP]];
  [builder set:kartConfiguration.tireGroup.name
        forKey:[GAIFields customDimensionForIndex:_CUSTOM_DIMENSION_TIRE_GROUP]];
  [builder set:kartConfiguration.gliderGroup.name
        forKey:[GAIFields customDimensionForIndex:_CUSTOM_DIMENSION_GLIDER_GROUP]];

  [tracker send:[builder build]];

  // Simple.
  [tracker send:[[GAIDictionaryBuilder createEventWithCategory:_ADJUST_BUILD_RESULT_CATEGORY_SIMPLE
                                                        action:nil
                                                         label:kartConfiguration.keyForUserDefaults
                                                         value:nil] build]];
}

+ (void)sendPartViewClickedEvent:(id<GAITracker>)tracker
                  withScreenName:(NSString *)screenName
                        withPart:(CMKPartModel *)partModel {
  GAIDictionaryBuilder *builder = [GAIDictionaryBuilder createEventWithCategory:_PART_VIEW_CATEGORY
                                                                         action:_CLICK_ACTION
                                                                          label:partModel.name
                                                                          value:nil];

  [builder set:screenName forKey:[GAIFields customDimensionForIndex:_CUSTOM_DIMENSION_PARENT_FRAGMENT]];

  [tracker send:[builder build]];
}

+ (void)sendStarViewStarredEvent:(id<GAITracker>)tracker
           withKartConfiguration:(CMKKartConfigurationModel *)kartConfiguration
                       isStarred:(BOOL)isStarred {
  // Custom.
  GAIDictionaryBuilder *builder =
      [GAIDictionaryBuilder createEventWithCategory:_STAR_VIEW_CATEGORY_CUSTOM
                                             action:isStarred ? _STAR_ACTION : _UNSTAR_ACTION
                                              label:nil
                                              value:nil];

  [builder set:kartConfiguration.characterGroup.name
        forKey:[GAIFields customDimensionForIndex:_CUSTOM_DIMENSION_CHARACTER_GROUP]];
  [builder set:kartConfiguration.vehicleGroup.name
        forKey:[GAIFields customDimensionForIndex:_CUSTOM_DIMENSION_VEHICLE_GROUP]];
  [builder set:kartConfiguration.tireGroup.name
        forKey:[GAIFields customDimensionForIndex:_CUSTOM_DIMENSION_TIRE_GROUP]];
  [builder set:kartConfiguration.gliderGroup.name
        forKey:[GAIFields customDimensionForIndex:_CUSTOM_DIMENSION_GLIDER_GROUP]];

  [tracker send:[builder build]];

  // Simple.
  [tracker send:[[GAIDictionaryBuilder createEventWithCategory:_STAR_VIEW_CATEGORY_SIMPLE
                                                        action:isStarred ? _STAR_ACTION : _UNSTAR_ACTION
                                                         label:kartConfiguration.keyForUserDefaults
                                                         value:nil] build]];
}

+ (void)sendCompareViewSelectedEvent:(id<GAITracker>)tracker
               withKartConfiguration:(CMKKartConfigurationModel *)kartConfiguration {
  // Custom.
  GAIDictionaryBuilder *builder = [GAIDictionaryBuilder createEventWithCategory:_COMPARE_VIEW_CATEGORY_CUSTOM
                                                                         action:_SELECT_ACTION
                                                                          label:nil
                                                                          value:nil];

  [builder set:kartConfiguration.characterGroup.name
        forKey:[GAIFields customDimensionForIndex:_CUSTOM_DIMENSION_CHARACTER_GROUP]];
  [builder set:kartConfiguration.vehicleGroup.name
        forKey:[GAIFields customDimensionForIndex:_CUSTOM_DIMENSION_VEHICLE_GROUP]];
  [builder set:kartConfiguration.tireGroup.name
        forKey:[GAIFields customDimensionForIndex:_CUSTOM_DIMENSION_TIRE_GROUP]];
  [builder set:kartConfiguration.gliderGroup.name
        forKey:[GAIFields customDimensionForIndex:_CUSTOM_DIMENSION_GLIDER_GROUP]];

  [tracker send:[builder build]];

  // Simple.
  [tracker send:[[GAIDictionaryBuilder createEventWithCategory:_COMPARE_VIEW_CATEGORY_SIMPLE
                                                        action:_SELECT_ACTION
                                                         label:kartConfiguration.keyForUserDefaults
                                                         value:nil] build]];
}

+ (void)sendRateButtonClicked:(id<GAITracker>)tracker {
  [tracker send:[[GAIDictionaryBuilder createEventWithCategory:_BUTTON_CATEGORY
                                                        action:_CLICK_ACTION
                                                         label:_RATE_BUTTON_LABEL
                                                         value:nil] build]];
}

+ (void)sendDonateButtonClicked:(id<GAITracker>)tracker {
  [tracker send:[[GAIDictionaryBuilder createEventWithCategory:_BUTTON_CATEGORY
                                                        action:_CLICK_ACTION
                                                         label:_DONATE_ACTION
                                                         value:nil] build]];
}

+ (void)sendDonationComplete:(id<GAITracker>)tracker withProductId:(NSString *)productId {
  [tracker send:[[GAIDictionaryBuilder createEventWithCategory:_DONATION_CATEGORY
                                                        action:_DONATE_ACTION
                                                         label:productId
                                                         value:nil] build]];
}

+ (void)sendErrorLogEvent:(id<GAITracker>)tracker withErrorMessage:(NSString *)errorMessage {
  [tracker send:[[GAIDictionaryBuilder createEventWithCategory:_ERROR_CATEGORY
                                                        action:nil
                                                         label:errorMessage
                                                         value:nil] build]];
}

@end
