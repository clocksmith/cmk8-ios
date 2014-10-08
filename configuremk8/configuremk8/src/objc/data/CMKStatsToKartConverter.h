//
//  CMKStatsToKartConverter.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/28/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMKStatsModel.h"
#import "CMKKartConfigurationModel.h"

@interface CMKStatsToKartConverter : NSObject

+ (CMKKartConfigurationModel *)optimalKartConfiguration:(CMKStatsModel *)stats;

@end
