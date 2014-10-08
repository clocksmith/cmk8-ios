//
//  CMKStatsToKartConverter.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/28/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKStatsToKartConverter.h"
#import "CMKKartConfigurationModel.h"
#import "CMKParts.h"

@implementation CMKStatsToKartConverter

+ (CMKKartConfigurationModel *)optimalKartConfiguration:(CMKStatsModel *)preferredStats {
  float maxScore = 0;

  CMKKartConfigurationModel *optimalKartConfiguration;

  for (CMKKartConfigurationModel *kartConfiguration in[CMKParts allKartConfigurations]) {
    float score = [CMKStatsToKartConverter calculateScoreWithPreferredStats:preferredStats
                                                      withKartConfiguration:kartConfiguration];

    if (score > maxScore) {
      maxScore = score;
      optimalKartConfiguration = kartConfiguration;
    }
  }

  return optimalKartConfiguration;
}

+ (float)calculateScoreWithPreferredStats:(CMKStatsModel *)preferredStats
                    withKartConfiguration:(CMKKartConfigurationModel *)kartConfiguration {
  CMKStatsModel *kartStats = kartConfiguration.kartStats;
  float score = 0;

  for (NSNumber *attributeIndex in[CMKStatsModel simpleAttributes]) {
    score += [CMKStatsToKartConverter weightedValueForAttributeIndex:attributeIndex
                                                  withPreferredStats:preferredStats
                                                       withKartStats:kartStats];
  }

  return score;
}

+ (float)weightedValueForAttributeIndex:(NSNumber *)attributeIndex
                     withPreferredStats:(CMKStatsModel *)preferredStats
                          withKartStats:(CMKStatsModel *)kartStats {
  float preferredValue = [preferredStats statValueForIndex:attributeIndex];
  float kartStatValue = [kartStats statValueForIndex:attributeIndex];

  // Floor the acceleration to reflect actual game mechanics.
  if ([attributeIndex intValue] == Acceleration) {
    kartStatValue = floorf(kartStatValue);
  }

  return preferredValue * kartStatValue;
}

@end
