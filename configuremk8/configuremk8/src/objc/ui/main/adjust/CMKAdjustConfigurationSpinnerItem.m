//
//  CMKAdjustConfigurationSpinnerItem.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/29/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKAdjustConfigurationSpinnerItem.h"
#import "CMKAdjustConfigurations.h"

#define _TAG (NSStringFromClass([CMKAdjustConfigurationSpinnerItem class]))

@interface CMKAdjustConfigurationSpinnerItem ()

@end

@implementation CMKAdjustConfigurationSpinnerItem

- (instancetype)initWithAdjustConfiguration:(CMKAdjustConfiguration)adjustConfiguration {
  self = [super init];

  if (self) {
    self.adjustConfiguration = adjustConfiguration;
  }

  return self;
}

- (NSString *)displayText {
  return [CMKAdjustConfigurations localizedNameForIndex:
          [NSNumber numberWithInt:_adjustConfiguration]];
}

@end
