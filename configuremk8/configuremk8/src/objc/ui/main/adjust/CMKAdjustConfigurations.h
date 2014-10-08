//
//  CMKAdjustConfigurations.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/29/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMKStatsModel.h"

// If adding new enum vlaues, remember to update the lastAdjustConfiguration().
typedef NS_ENUM (NSInteger, CMKAdjustConfiguration) {
  Custom,
  NeverPlayedBefore,
  Novice,
  Tractor,
  Flash,
  Expert
};


// Must update this function when adding new enum values.
static inline CMKAdjustConfiguration LastAdjustConfiguration() {
  return Expert;
}

@interface CMKAdjustConfigurations : NSObject

+ (NSString *)localizedNameForIndex:(NSNumber *)index;

+ (NSString *)analyticsNameForIndex:(NSNumber *)index;

+ (CMKStatsModel *)statsForIndex:(NSNumber *)index;

+ (NSArray *)      allAdjustConfigurations;

@end
