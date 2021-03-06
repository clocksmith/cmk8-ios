//
//  CMKCup.m
//  configuremk8
//
//  Created by Anthony Robledo on 9/9/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKCupModel.h"

@implementation CMKCupModel

- (instancetype)initWithName:(NSString *)theName withCourses:(NSArray *)courses {
  self = [super init];

  if (self) {
    self.name = theName;
    self.displayName = NSLocalizedString(theName, nil);
    self.iconImageName = [NSString stringWithFormat:@"wiiu_cup_%@", [theName lowercaseString]];
    self.courses = courses;
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
