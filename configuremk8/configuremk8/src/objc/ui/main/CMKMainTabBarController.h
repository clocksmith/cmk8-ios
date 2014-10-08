//
//  MainTabBarController.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/6/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CMKConfigureViewController;
@class CMKCompareViewController;
@class CMKMapsViewController;
@class CMKFaqViewController;

typedef NS_ENUM (NSInteger, MainTab) {
  CONFIGURE_TAB,
  COMPARE_TAB,
  FAQ_TAB
};

NSDictionary *mainTabTitles;

@interface CMKMainTabBarController : UITabBarController {
  IBOutlet UITabBar *mainTabBar;
}

@property (strong, nonatomic) CMKConfigureViewController *configureViewController;
@property (strong, nonatomic) CMKCompareViewController *compareViewController;
@property (strong, nonatomic) CMKMapsViewController *mapsViewController;
@property (strong, nonatomic) CMKFaqViewController *faqViewController;

@end
