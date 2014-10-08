//
//  CMKNewCustomConfigurationSpinnerItem.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/27/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKColors.h"
#import "CMKCustomSpinnerItem.h"

@implementation CMKCustomSpinnerItem {
  NSString *_displayText;
}

- (instancetype)initWithDisplayText:(NSString *)displayText {
  self = [super init];

  if (self) {
    _displayText = displayText;
  }

  return self;
}

- (NSString *)displayText {
  return _displayText;
}

- (UIColor *)displayColor {
  return [CMKColors blueColor];
}

@end
