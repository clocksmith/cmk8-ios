//
//  CMKAdjustModel.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/28/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKAdjustModel.h"

@implementation CMKAdjustModel

- initWithAdjustConfiguration:(CMKAdjustConfiguration)adjustConfiguration
  withCustomStats            :(CMKStatsModel *)customStats {
  self.adjustConfiguration = adjustConfiguration;
  self.customStats = customStats;
  return self;
}

@end
