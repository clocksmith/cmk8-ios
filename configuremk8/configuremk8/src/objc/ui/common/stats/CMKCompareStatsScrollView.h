//
//  CMKCompareStatsScrollView.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/25/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMKStatsModel.h"

@interface CMKCompareStatsScrollView : UIScrollView

- (void)setup;

- (void)updateWithLeftStats:(CMKStatsModel *)leftStats
             withRightStats:(CMKStatsModel *)rightStats
                 isAnimated:(BOOL)animated;

@end
