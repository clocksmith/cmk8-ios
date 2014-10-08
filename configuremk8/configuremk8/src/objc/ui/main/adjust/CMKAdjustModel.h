//
//  CMKAdjustModel.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/28/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMKAdjustConfigurations.h"
#import "CMKStatsModel.h"

@interface CMKAdjustModel : NSObject

@property (nonatomic) CMKAdjustConfiguration adjustConfiguration;
@property (nonatomic, strong) CMKStatsModel *customStats;

- initWithAdjustConfiguration:(CMKAdjustConfiguration)adjustConfiguration
  withCustomStats            :(CMKStatsModel *)customStats;

@end
