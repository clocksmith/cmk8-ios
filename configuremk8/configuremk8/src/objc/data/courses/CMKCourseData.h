//
//  CMKCourses.h
//  configuremk8
//
//  Created by Anthony Robledo on 9/9/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMKCupModel.h"
#import "CMKCourseModel.h"

@interface CMKCourseData : NSObject

+ (NSArray *)cups;
+ (CMKCourseModel *)courseForIndex:(int)index;

@end
