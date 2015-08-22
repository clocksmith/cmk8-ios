//
//  CMKTrackedViewController.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/18/15.
//  Copyright (c) 2015 Blunka. All rights reserved.
//

#import <Google/Analytics.h>
#import <UIKit/UIKit.h>

@interface CMKTrackedViewController : UIViewController

@property(nonatomic) id<GAITracker> tracker;
@property(nonatomic, copy) NSString *screenName;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withScreenName:(NSString *)screenName;

@end