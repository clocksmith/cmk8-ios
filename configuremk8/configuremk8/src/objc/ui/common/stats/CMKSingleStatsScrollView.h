//
//  CMKPositiveStatsScrollView.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/20/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMKStatsModel.h"

typedef NS_ENUM (NSInteger, CMKStatsMode) {
  CMKStatModeOnlyPositive,
  CMKStatModeMaybeNegative
};

@interface CMKSingleStatsScrollView : UIScrollView

- (void)drawWithMode:(CMKStatsMode)mode;

- (void)updateStats:(CMKStatsModel *)stats isAnimated:(BOOL)animated;

@end
