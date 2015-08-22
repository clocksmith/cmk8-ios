//
//  CMKMainPageViewController.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/11/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMKTrackedViewController.h"

@interface CMKMainPageViewController : CMKTrackedViewController

- (instancetype)initWithTitle:(NSString *)titleString
                withImageName:(NSString *)imageName
               withScreenName:(NSString *)screenName;

@end
