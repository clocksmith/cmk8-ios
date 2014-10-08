//
//  CMKMapsModel.m
//  configuremk8
//
//  Created by Anthony Robledo on 9/9/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKMapsModel.h"

@implementation CMKMapsModel

- (instancetype)init {
  return [self initWithCourseIndex:0];
}

- (instancetype)initWithCourseIndex:(int)courseIndex {
  self.courseIndex = courseIndex;

  return self;
}

@end
