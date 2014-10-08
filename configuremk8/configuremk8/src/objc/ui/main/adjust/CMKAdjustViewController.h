//
//  CMKAdjustViewController.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/27/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMKKartConfigurationModel.h"
#import "CMKAdjustAttributeView.h"
#import "GAITrackedViewController.h"

@protocol CMKAdjustViewControllerDelegate <NSObject>

@required

- (void)didEndWithKartConfiguration:(CMKKartConfigurationModel *)kartConfiguration;

@end

@interface CMKAdjustViewController : GAITrackedViewController <CMKSpinnerViewDelegate,
                                                               CMKAdjustAttributeViewDelegate>

@end
