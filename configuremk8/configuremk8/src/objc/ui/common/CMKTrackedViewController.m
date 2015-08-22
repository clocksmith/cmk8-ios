//
//  CMKTrackedViewController.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/18/15.
//  Copyright (c) 2015 Blunka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMKTrackedViewController.h"

@implementation CMKTrackedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withScreenName:(NSString *)screenName {
  self = [self initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

  if (self) {
    self.screenName = screenName;
  }

  return self;
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.tracker = [[GAI sharedInstance] defaultTracker];
  [self.tracker set:kGAIScreenName value:self.screenName];
  [self.tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}

@end