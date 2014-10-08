//
//  CMKStarredConfigureUtils.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/18/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKStarredKartConfigurationUtils.h"
#import "CMKConfigureModel.h"
#import "CMKKartConfigurationModel.h"
#import "CMKPartGroupModel.h"
#import "CMKParts.h"
#import "CMKConstants.h"

#define _TAG (NSStringFromClass([CMKStarredKartConfigurationUtils class]))

@interface CMKStarredKartConfigurationUtils ()

+ (NSString *)starredKartConfigurationKey:(CMKKartConfigurationModel *)kartConfiguration;

@end

@implementation CMKStarredKartConfigurationUtils

static NSString *const _STARRED_KART_CONFIGURATION_NAMESPACE = @"starredKartConfiguration";

+ (void)starKartConfiguration:(CMKKartConfigurationModel *)kartConfiguration {
  [[NSUserDefaults standardUserDefaults] setObject:[kartConfiguration name]
                                            forKey:
   [CMKStarredKartConfigurationUtils starredKartConfigurationKey:kartConfiguration]];
  [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)unstarKartConfiguration:(CMKKartConfigurationModel *)kartConfiguration {
  [[NSUserDefaults standardUserDefaults] removeObjectForKey:
   [CMKStarredKartConfigurationUtils starredKartConfigurationKey:kartConfiguration]];
  [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)isKartConfigurationStarred:(CMKKartConfigurationModel *)kartConfiguration {
  return [[NSUserDefaults standardUserDefaults] stringForKey:
          [CMKStarredKartConfigurationUtils starredKartConfigurationKey:kartConfiguration]] != nil;
}

+ (NSArray *)allStarredKartConfigurations {
  NSArray *unfilteredKeys = [NSUserDefaults standardUserDefaults].dictionaryRepresentation.allKeys;
  NSMutableArray *unsortedKartConfigurations = [[NSMutableArray alloc] init];

  for (NSString *key in unfilteredKeys) {
    if ([key hasPrefix:_STARRED_KART_CONFIGURATION_NAMESPACE]) {
      [unsortedKartConfigurations addObject:
       [[CMKKartConfigurationModel alloc] initWithUserDefaultsKey:
        [key componentsSeparatedByString:NAMESPACE_SEPERATOR][1]]];
    }
  }

  return [unsortedKartConfigurations sortedArrayUsingSelector:@selector(compare:)];
}

+ (NSString *)starredKartConfigurationKey:(CMKKartConfigurationModel *)kartConfiguration {
  return [NSString stringWithFormat:@"%@%@%@",
          _STARRED_KART_CONFIGURATION_NAMESPACE,
          NAMESPACE_SEPERATOR,
          [kartConfiguration keyForUserDefaults]];
}

@end
