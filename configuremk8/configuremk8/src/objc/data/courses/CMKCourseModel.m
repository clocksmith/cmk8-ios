//
//  CMKCourseModel.m
//  configuremk8
//
//  Created by Anthony Robledo on 9/9/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKCourseModel.h"

@implementation CMKCourseModel

- (instancetype)initWithName:(NSString *)name
             withDisplayName:displayName
           withIconImageName:iconImageName
            withMapImageName:mapImageName
             withCourseIndex:(int)courseIndex {
  self = [super init];

  if (self) {
    self.name = name;
    self.displayName = displayName;
    self.iconImageName = iconImageName;
    self.mapImageName = mapImageName;
    self.courseIndex = courseIndex;
  }

  return self;
}

#pragma mark - CMKSpinneritem

- (NSString *)displayText {
  return self.displayName;
}

- (UIImage *)icon {
  return [UIImage imageNamed:self.iconImageName];
}

@end
