//
//  CMKCourseModel.m
//  configuremk8
//
//  Created by Anthony Robledo on 9/9/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKCourseModel.h"

@implementation CMKCourseModel

- (instancetype)initWithName:(NSString *)name withCourseIndex:(int)courseIndex {
  self = [super init];

  if (self) {
    self.name = name;
    self.displayName = NSLocalizedString(name, nil);
    self.iconImageName = [NSString stringWithFormat:@"wiiu_map_icon_%@", [name lowercaseString]];
    // I dont remember why you need .jpg here, but I am pretty sure you do if its not a .png.
    self.mapImageName = [NSString stringWithFormat:@"prima_map_%@.jpg", [name lowercaseString]];
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

- (UIImage *)map {
  UIImage *map = [UIImage imageNamed:self.mapImageName];
  if (!map) {
    map = [UIImage imageNamed:@"default_map"];
  }

  return map;
}

@end
