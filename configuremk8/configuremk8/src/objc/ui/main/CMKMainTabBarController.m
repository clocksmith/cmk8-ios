//
//  CMKMainTabBarController.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/6/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKColors.h"
#import "CMKConstants.h"
#import "CMKMainTabBarController.h"
#import "CMKConfigureViewController.h"
#import "CMKCompareViewController.h"
#import "CMKMapsViewController.h"
#import "CMKFaqViewController.h"

#define _TAG (NSStringFromClass([CMKMainTabBarController class]))

@implementation CMKMainTabBarController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil {
//  NSLog(@"%@ initWithNibName:bundle:", _TAG);
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

  if (self) {
    // Initalize the view controllers that the tabs will map to.
    self.configureViewController = [[CMKConfigureViewController alloc] init];
    self.compareViewController = [[CMKCompareViewController alloc] init];
    self.mapsViewController = [[CMKMapsViewController alloc] init];
    self.faqViewController = [[CMKFaqViewController alloc] init];

    // Set the view controllers for the tab bar controller
    [self setViewControllers:@[self.configureViewController,
                               self.compareViewController,
                               self.mapsViewController,
                               self.faqViewController]];
  }

  return self;
}

- (void)viewDidLoad {
//  NSLog(@"%@ viewDidLoad", _TAG);
  [super viewDidLoad];

  // Fix the view to be under the status bar. TODO(clocksmith): this is not working.
  self.edgesForExtendedLayout = UIRectEdgeNone;
  self.navigationController.navigationBar.translucent = NO;

  // Set the style for the main tab bar.
  [[UITabBar appearance] setBackgroundColor:[CMKColors whiteColor]];
  [[UITabBar appearance] setBarTintColor:[CMKColors whiteColor]];
  [[UITabBar appearance] setTintColor:[CMKColors blueColor]];

  // Set the tab bar title appearance for normal state.
  [[UITabBarItem appearance] setTitleTextAttributes:@{
     NSFontAttributeName: [UIFont       fontWithName:HELVETICA_NEUE_LIGHT_FONT
                                                size:DEFAULT_TITLE_FONT_SIZE_IPHONE],
     NSForegroundColorAttributeName: [CMKColors grayColor]
   }
                                           forState:UIControlStateNormal];

  // Set the tab bar title appearance for selected state.
  [[UITabBarItem appearance] setTitleTextAttributes:@{
     NSFontAttributeName: [UIFont       fontWithName:HELVETICA_NEUE_MEDIUM_FONT
                                                size:DEFAULT_TITLE_FONT_SIZE_IPHONE],
     NSForegroundColorAttributeName: [CMKColors blueColor]
   }
                                           forState:UIControlStateSelected];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
