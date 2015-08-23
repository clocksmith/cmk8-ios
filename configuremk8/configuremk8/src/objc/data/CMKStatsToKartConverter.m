//
//  CMKStatsToKartConverter.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/28/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKStatsToKartConverter.h"
#import "CMKKartConfigurationModel.h"
#import "CMKPartData.h"

@implementation CMKStatsToKartConverter

+ (CMKKartConfigurationModel *)optimalKartConfiguration:(CMKStatsModel *)preferredStats {
  double maxScore = 0;

  CMKKartConfigurationModel *optimalKartConfiguration;

  for (CMKKartConfigurationModel *kartConfiguration in [CMKPartData sharedPartModelDataStore].allKartConfigurations) {
    double score = [CMKStatsToKartConverter calculateScoreWithPreferredStats:preferredStats
                                                       withKartConfiguration:kartConfiguration];

    if (score > maxScore) {
      maxScore = score;
      optimalKartConfiguration = kartConfiguration;
    }
  }

  return optimalKartConfiguration;
}

+ (double)calculateScoreWithPreferredStats:(CMKStatsModel *)preferredStats
                     withKartConfiguration:(CMKKartConfigurationModel *)kartConfiguration {
  CMKStatsModel *kartStats = kartConfiguration.kartStats;
  double score = 0;

  for (NSNumber *attributeIndex in [CMKStatsModel simpleAttributes]) {
    score += [CMKStatsToKartConverter weightedValueForAttributeIndex:attributeIndex
                                                  withPreferredStats:preferredStats
                                                       withKartStats:kartStats];
  }

  return score;
}

+ (double)weightedValueForAttributeIndex:(NSNumber *)attributeIndex
                      withPreferredStats:(CMKStatsModel *)preferredStats
                           withKartStats:(CMKStatsModel *)kartStats {
  double preferredValue = [preferredStats statValueForIndex:attributeIndex];
  double kartStatValue = [kartStats statValueForIndex:attributeIndex];

  // Floor the acceleration to reflect actual game mechanics.
  if ([attributeIndex intValue] == Acceleration) {
    kartStatValue = floorf(kartStatValue);
  }

  return preferredValue * kartStatValue;
}

@end
