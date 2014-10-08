//
//  CMKSingleStatsRowView.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/20/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKSingleStatsRowView.h"

@implementation CMKSingleStatsRowView

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];

  if (self) {
    // Initialization code
  }

  return self;
}

- (void)updateAttributeValue:(float)attributeValue isAnimated:(BOOL)animated {
  // Must override.
}

@end
