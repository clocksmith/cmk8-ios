//
//  CMKAdjustConfigurations.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/29/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKAdjustConfigurations.h"
#import "CMKStatsModel.h"

@implementation CMKAdjustConfigurations

static NSDictionary *_localizedNames;
static NSDictionary *_analyticsNames;
static NSDictionary *_stats;

+ (void)initialize {
  // Need to do if we call initialize directly.
  static BOOL initialized = NO;

  if (!initialized) {
    initialized = YES;

    _localizedNames = @{ [NSNumber numberWithInt:Custom]: NSLocalizedString(@"Custom", nil),
                         [NSNumber numberWithInt:NeverPlayedBefore]:
                         NSLocalizedString(@"Never Played Before", nil),
                         [NSNumber numberWithInt:Novice]: NSLocalizedString(@"Novice", nil),
                         [NSNumber numberWithInt:Tractor]: NSLocalizedString(@"Tractor", nil),
                         [NSNumber numberWithInt:Flash]: NSLocalizedString(@"Flash", nil),
                         [NSNumber numberWithInt:Expert]: NSLocalizedString(@"Expert", nil) };

    _analyticsNames = @{ [NSNumber numberWithInt:Custom]: @"CUSTOM",
                         [NSNumber numberWithInt:NeverPlayedBefore]: @"NEVER_PLAYED_BEFORE",
                         [NSNumber numberWithInt:Novice]: @"NOVICE",
                         [NSNumber numberWithInt:Tractor]: @"TRACTOR",
                         [NSNumber numberWithInt:Flash]: @"FLASH",
                         [NSNumber numberWithInt:Expert]: @"EXPERT" };

    _stats = @{ [NSNumber numberWithInt:Custom]: [[CMKStatsModel alloc]
                                                  initWithAcceleration:-1
                                                      withAverageSpeed:-1
                                                   withAverageHandling:-1
                                                         withMiniturbo:-1
                                                          withTraction:-1
                                                            withWeight:-1],
                [NSNumber numberWithInt:NeverPlayedBefore]: [[CMKStatsModel alloc]
                                                             initWithAcceleration:100
                                                                 withAverageSpeed:0
                                                              withAverageHandling:100
                                                                    withMiniturbo:0
                                                                     withTraction:0
                                                                       withWeight:0],
                [NSNumber numberWithInt:Novice]: [[CMKStatsModel alloc]
                                                  initWithAcceleration:0
                                                      withAverageSpeed:20
                                                   withAverageHandling:100
                                                         withMiniturbo:0
                                                          withTraction:20
                                                            withWeight:0],
                [NSNumber numberWithInt:Tractor]: [[CMKStatsModel alloc]
                                                   initWithAcceleration:25
                                                       withAverageSpeed:50
                                                    withAverageHandling:75
                                                          withMiniturbo:25
                                                           withTraction:100
                                                             withWeight:100],
                [NSNumber numberWithInt:Flash]: [[CMKStatsModel alloc]
                                                 initWithAcceleration:100
                                                     withAverageSpeed:60
                                                  withAverageHandling:0
                                                        withMiniturbo:0
                                                         withTraction:0
                                                           withWeight:0],
                [NSNumber numberWithInt:Expert]: [[CMKStatsModel alloc]
                                                  initWithAcceleration:0
                                                      withAverageSpeed:100
                                                   withAverageHandling:0
                                                         withMiniturbo:0
                                                          withTraction:0
                                                            withWeight:0] };
  }
}

+ (NSString *)localizedNameForIndex:(NSNumber *)index {
  return _localizedNames[index];
}

+ (NSString *)analyticsNameForIndex:(NSNumber *)index {
  return _analyticsNames[index];
}

+ (CMKStatsModel *)statsForIndex:(NSNumber *)index {
  return _stats[index];
}

+ (NSArray *)allAdjustConfigurations {
  NSMutableArray *allAdjustConfigurations = [[NSMutableArray alloc] init];

  for (int index = 0; index <= LastAdjustConfiguration(); index++) {
    [allAdjustConfigurations addObject:[NSNumber numberWithInt:index]];
  }

  return (NSArray *)[allAdjustConfigurations copy];
}

@end
