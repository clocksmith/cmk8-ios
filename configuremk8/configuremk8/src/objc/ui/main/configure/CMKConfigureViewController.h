//
//  CMKConfigureViewController.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/6/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMKMainPageViewController.h"
#import "CMKKartConfigurationModel.h"

@interface CMKConfigureViewController : CMKMainPageViewController

- (void)updateKartConfiguration:(CMKKartConfigurationModel *)kartConfiguration;

@end