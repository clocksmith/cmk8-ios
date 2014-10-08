//
//  CMKLastUsedModelUtils.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/26/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKConstants.h"
#import "CMKUserDefaultslUtils.h"
#import "CMKCompareModel.h"
#import "CMKConfigureModel.h"
#import "CMKStarredKartConfigurationUtils.h"

#define _TAG (NSStringFromClass([CMKLastUsedModelUtils class]))

@implementation CMKUserDefaultslUtils

static NSString *const _ADJUST_NAMESPACE = @"adjust";
static NSString *const _ADJUST_CONFIGURATION_INDEX = @"adjustConfigurationIndex";
static NSString *const _ADJUST_ACCELERATION_VALUE = @"adjustAccelerationValue";
static NSString *const _ADJUST_SPEED_VALUE = @"adjustSpeedValue";
static NSString *const _ADJUST_HANDLING_VALUE = @"adjustHandlingValue";
static NSString *const _ADJUST_MINITURBO_VALUE = @"adjustMiniturboValue";
static NSString *const _ADJUST_TRACTION_VALUE = @"adjustTractionValue";
static NSString *const _ADJUST_WEIGHT_VALUE = @"adjustWeightValue";

static NSString *const _CONFIGURE_NAMESPACE = @"configure";
static NSString *const _CONFIGURE_KART_CONFIGURATION = @"kartConfiguration";

static NSString *const _COMPARE_NAMEPSACE = @"compare";
static NSString *const _COMPARE_LEFT_KART_CONFIGURATION = @"leftKartConfiguration";
static NSString *const _COMPARE_RIGHT_KART_CONFIGURATION = @"rightKartConfiguration";

static NSString *const _MAPS_NAMESPACE = @"maps";
static NSString *const _MAPS_COURSE_INDEX = @"courseIndex";

static NSString *const _HELP_WIZARD_NAMESPACE = @"helpWizard";
static NSString *const _HAS_CONFIGURE_HELP_WIZARD_LOADED = @"hasConfigureHelpWizardLoaded";

+ (void)saveAdjustModel:(CMKAdjustModel *)adjustModel {
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

  [userDefaults setObject:[NSNumber numberWithInt:adjustModel.adjustConfiguration]
                   forKey:[CMKUserDefaultslUtils
           makeGlobalKeyWithNamespace:_ADJUST_NAMESPACE
                              withKey:_ADJUST_CONFIGURATION_INDEX]];

  if (adjustModel.adjustConfiguration == Custom) {
    [userDefaults setObject:[NSNumber numberWithFloat:adjustModel.customStats.acceleration]
                     forKey:[CMKUserDefaultslUtils
             makeGlobalKeyWithNamespace:_ADJUST_NAMESPACE
                                withKey:_ADJUST_ACCELERATION_VALUE]];
    [userDefaults setObject:[NSNumber numberWithFloat:adjustModel.customStats.averageSpeed]
                     forKey:[CMKUserDefaultslUtils
             makeGlobalKeyWithNamespace:_ADJUST_NAMESPACE
                                withKey:_ADJUST_SPEED_VALUE]];
    [userDefaults setObject:[NSNumber numberWithFloat:adjustModel.customStats.averageHandling]
                     forKey:[CMKUserDefaultslUtils
             makeGlobalKeyWithNamespace:_ADJUST_NAMESPACE
                                withKey:_ADJUST_HANDLING_VALUE]];
    [userDefaults setObject:[NSNumber numberWithFloat:adjustModel.customStats.miniturbo]
                     forKey:[CMKUserDefaultslUtils
             makeGlobalKeyWithNamespace:_ADJUST_NAMESPACE
                                withKey:_ADJUST_MINITURBO_VALUE]];
    [userDefaults setObject:[NSNumber numberWithFloat:adjustModel.customStats.traction]
                     forKey:[CMKUserDefaultslUtils
             makeGlobalKeyWithNamespace:_ADJUST_NAMESPACE
                                withKey:_ADJUST_TRACTION_VALUE]];
    [userDefaults setObject:[NSNumber numberWithFloat:adjustModel.customStats.weight]
                     forKey:[CMKUserDefaultslUtils
             makeGlobalKeyWithNamespace:_ADJUST_NAMESPACE
                                withKey:_ADJUST_WEIGHT_VALUE]];
  }

  [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (CMKAdjustModel *)loadAdjustModel {
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  CMKAdjustModel *adjustModel = [[CMKAdjustModel alloc] init];
  NSInteger index = [userDefaults integerForKey:
                     [CMKUserDefaultslUtils makeGlobalKeyWithNamespace:_ADJUST_NAMESPACE
                                                               withKey:_ADJUST_CONFIGURATION_INDEX]];

  adjustModel.adjustConfiguration = (CMKAdjustConfiguration)(index ? index : 0);

  if (adjustModel.adjustConfiguration == Custom) {
    adjustModel.customStats = [[CMKStatsModel alloc]
                               initWithAcceleration:[userDefaults floatForKey:
                                                     [CMKUserDefaultslUtils
                                                      makeGlobalKeyWithNamespace:
                                                      _ADJUST_NAMESPACE
                                                                         withKey:
                                                      _ADJUST_ACCELERATION_VALUE]]
                                   withAverageSpeed:[userDefaults floatForKey:
                                                     [CMKUserDefaultslUtils
                                                      makeGlobalKeyWithNamespace:
                                                  _ADJUST_NAMESPACE
                                                                         withKey:
                                                  _ADJUST_SPEED_VALUE]]
                                withAverageHandling:[userDefaults floatForKey:
                                                     [CMKUserDefaultslUtils
                                                      makeGlobalKeyWithNamespace:
                                                     _ADJUST_NAMESPACE
                                                                         withKey:
                                                     _ADJUST_HANDLING_VALUE]]
                                      withMiniturbo:[userDefaults floatForKey:
                                                     [CMKUserDefaultslUtils
                                                      makeGlobalKeyWithNamespace:
                                               _ADJUST_NAMESPACE
                                                                         withKey:
                                               _ADJUST_MINITURBO_VALUE]]
                                       withTraction:[userDefaults floatForKey:
                                                     [CMKUserDefaultslUtils
                                                      makeGlobalKeyWithNamespace:
                                              _ADJUST_NAMESPACE
                                                                         withKey:
                                              _ADJUST_TRACTION_VALUE]]
                                         withWeight:[userDefaults floatForKey:
                                                     [CMKUserDefaultslUtils
                                                      makeGlobalKeyWithNamespace:
                                            _ADJUST_NAMESPACE
                                                                         withKey:
                                            _ADJUST_WEIGHT_VALUE]]];
  }

  return adjustModel;
}

+ (void)saveConfigureModel:(CMKConfigureModel *)configureModel {
  [[NSUserDefaults standardUserDefaults] setObject:
   configureModel.kartConfiguration.keyForUserDefaults
                                            forKey:
   [CMKUserDefaultslUtils makeGlobalKeyWithNamespace:_CONFIGURE_NAMESPACE
                                             withKey:_CONFIGURE_KART_CONFIGURATION]];
  [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (CMKConfigureModel *)loadConfigureModel {
  return [[CMKConfigureModel alloc] initWithKartConfiguration:
          [[CMKKartConfigurationModel alloc] initWithUserDefaultsKey:
           [[NSUserDefaults standardUserDefaults] stringForKey:
            [CMKUserDefaultslUtils makeGlobalKeyWithNamespace:_CONFIGURE_NAMESPACE
                                                      withKey:_CONFIGURE_KART_CONFIGURATION]]]];
}

+ (void)saveCompareModel:(CMKCompareModel *)compareModel {
  [[NSUserDefaults standardUserDefaults] setObject:
   compareModel.leftKartConfiguration.keyForUserDefaults
                                            forKey:
   [CMKUserDefaultslUtils makeGlobalKeyWithNamespace:_COMPARE_NAMEPSACE
                                             withKey:_COMPARE_LEFT_KART_CONFIGURATION]];
  [[NSUserDefaults standardUserDefaults] setObject:
   compareModel.rightKartConfiguration.keyForUserDefaults
                                            forKey:
   [CMKUserDefaultslUtils makeGlobalKeyWithNamespace:_COMPARE_NAMEPSACE
                                             withKey:_COMPARE_RIGHT_KART_CONFIGURATION]];
  [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (CMKCompareModel *)loadCompareModel {
  return [[CMKCompareModel alloc] initWithLeftKartConfiguration:
          [[CMKKartConfigurationModel alloc] initWithUserDefaultsKey:
           [[NSUserDefaults standardUserDefaults] stringForKey:
            [CMKUserDefaultslUtils makeGlobalKeyWithNamespace:_COMPARE_NAMEPSACE
                                                      withKey:_COMPARE_LEFT_KART_CONFIGURATION]]]
                                 initWithRightKartConfiguration:
          [[CMKKartConfigurationModel alloc] initWithUserDefaultsKey:
           [[NSUserDefaults standardUserDefaults] stringForKey:
            [CMKUserDefaultslUtils makeGlobalKeyWithNamespace:_COMPARE_NAMEPSACE
                                                      withKey:_COMPARE_RIGHT_KART_CONFIGURATION]]]];
}

+ (void)saveMapsModel:(CMKMapsModel *)mapsModel {
  [[NSUserDefaults standardUserDefaults] setInteger:mapsModel.courseIndex
                                             forKey:
   [CMKUserDefaultslUtils makeGlobalKeyWithNamespace:_MAPS_NAMESPACE
                                             withKey:_MAPS_COURSE_INDEX]];

  [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (CMKMapsModel *)loadMapsModel {
  return [[CMKMapsModel alloc] initWithCourseIndex:
          [[NSUserDefaults standardUserDefaults] integerForKey:
           [CMKUserDefaultslUtils makeGlobalKeyWithNamespace:_MAPS_NAMESPACE
                                                     withKey:_MAPS_COURSE_INDEX]]];
}

+ (BOOL)hasConfigureHelpWizardLoaded {
  return [[NSUserDefaults standardUserDefaults] boolForKey:
          [CMKUserDefaultslUtils makeGlobalKeyWithNamespace:_HELP_WIZARD_NAMESPACE
                                                    withKey:_HAS_CONFIGURE_HELP_WIZARD_LOADED]];
}

+ (void)configureHelpWizardDidLoad {
  [[NSUserDefaults standardUserDefaults] setBool:YES
                                          forKey:
   [CMKUserDefaultslUtils makeGlobalKeyWithNamespace:_HELP_WIZARD_NAMESPACE
                                             withKey:_HAS_CONFIGURE_HELP_WIZARD_LOADED]];
  [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)makeGlobalKeyWithNamespace:(NSString *)namespace withKey:(NSString *)key {
  return [NSString stringWithFormat:@"%@%@%@", namespace, NAMESPACE_SEPERATOR, key];
}

@end
