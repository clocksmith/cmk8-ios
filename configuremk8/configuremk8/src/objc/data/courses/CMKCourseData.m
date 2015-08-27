//
//  CMKCourses.m
//  configuremk8
//
//  Created by Anthony Robledo on 9/9/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKCourseData.h"
#import "CMKConstants.h"
#import "CMKCupModel.h"
#import "CMKCourseModel.h"

#define _TAG (NSStringFromClass([CMKCourseData class]))

// Note: For some reason, we need to use .jpg for the maps.
@implementation CMKCourseData

static NSMutableArray *_cups;

+ (void)initialize {
  // Need to do if we call initialize directly.
  static BOOL initialized = NO;

  if (!initialized) {
    initialized = YES;

    // Just in case...
    _cups = [NSMutableArray array];

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"courses" ofType:@"json"];
    NSData *content = [[NSData alloc] initWithContentsOfFile:filePath];
    NSDictionary *coursesJsonObj = [NSJSONSerialization JSONObjectWithData:content options:kNilOptions error:nil];

    NSArray *cupsJsonObj = [coursesJsonObj valueForKey:@"cups"];

    for (int i = 0; i < [cupsJsonObj count]; i++) {
      NSDictionary *cupJsonObj = cupsJsonObj[i];
      NSArray *coursesJsonObj = [cupJsonObj valueForKey:@"courses"];

      NSMutableArray *courses = [NSMutableArray array];
      for (int j = 0; j < [coursesJsonObj count]; j++) {
        NSDictionary *courseString = coursesJsonObj[j];
        [courses
            addObject:[[CMKCourseModel alloc] initWithName:courseString withCourseIndex:i * NUM_COURSES_PER_CUP + j]];
      }

      [_cups addObject:[[CMKCupModel alloc] initWithName:[cupJsonObj valueForKey:@"name"] withCourses:courses]];
    }
  }
}

+ (NSArray *)cups {
  return _cups;
}

+ (CMKCourseModel *)courseForIndex:(int)index {
  return _cups[index / NUM_COURSES_PER_CUP][index % NUM_COURSES_PER_CUP];
}

@end
