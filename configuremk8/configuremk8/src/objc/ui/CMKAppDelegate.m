//
//  CMKAppDelegate.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/5/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKAppDelegate.h"
#import "CMKParts.h"
#import "CMKCourses.h"
#import "GAI.h"

#define _TAG (NSStringFromClass([CMKAppDelegate class]))

@implementation CMKAppDelegate

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  NSLog(@"%@ application:didFinishLaunchingWithOptions", _TAG);

  // Initialize the parts.
  [CMKParts initialize];

  // Initialize the courses.
  [CMKCourses initialize];

  // Initialize analytics.
  // Optional: automatically send uncaught exceptions to Google Analytics.
  [GAI sharedInstance].trackUncaughtExceptions = YES;

  // Optional: set Google Analytics dispatch interval to e.g. 20 seconds.
  [GAI sharedInstance].dispatchInterval = 20;

  // Initialize tracker. Replace with your tracking ID.
  [[GAI sharedInstance] trackerWithTrackingId:@"UA-53388714-1"];
  [[GAI sharedInstance] defaultTracker].allowIDFACollection = NO;

  // Optional: Set Google Analytics Logger level to WARNING.
  [[GAI sharedInstance].logger setLogLevel:kGAILogLevelWarning];

  // Initialize the window.
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

  // Initialize the tab bar controller.
  self.mainTabBarController = [[CMKMainTabBarController alloc] init];

  // Add the tab bar controller view to the window.
  [self.window setRootViewController:self.mainTabBarController];

  // Set the window background color and make it visible.
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];

  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
