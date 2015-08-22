//
//  CMKMainPageViewController.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/10/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKAppDelegate.h"
#import "CMKConstants.h"
#import "CMKMainPageViewController.h"
#import "CMKUiUtils.h"

#define _TAG (NSStringFromClass([CMKMainPageViewController class]))

@implementation CMKMainPageViewController

- (instancetype)initWithTitle:(NSString *)titleString
                withImageName:(NSString *)imageName
               withScreenName:(NSString *)screenName {
  self = [self initWithNibName:nil bundle:nil withScreenName:screenName];

  if (self) {
    self.tabBarItem.title = NSLocalizedString(titleString, nil);
    self.tabBarItem.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
    self.tabBarItem.image = [CMKUiUtils imageWithImage:[UIImage imageNamed:imageName]
                                          scaledToSize:CGSizeMake(MAIN_TAB_ICON_SIZE, MAIN_TAB_ICON_SIZE)];
  }

  return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (UIRectEdge)edgesForExtendedLayout {
  return [super edgesForExtendedLayout] ^ UIRectEdgeBottom;
}

@end
