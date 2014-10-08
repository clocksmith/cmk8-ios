//
//  CMKAppDelegate.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/5/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMKMainTabBarController.h"


@interface CMKAppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;

@property (nonatomic, strong) CMKMainTabBarController *mainTabBarController;

@end
