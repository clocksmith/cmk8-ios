//
//  CMKKartConfigurationView.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/25/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKKartConfigurationModel.h"
#import "CMKKartConfigurationView.h"
#import "CMKPartGroupModel.h"
#import "CMKVerticalPartGroupView.h"

#define _TAG (NSStringFromClass([CMKKartConfigurationView class]))

@implementation CMKKartConfigurationView {
}

static const float _TRANSFORMATION_SCALE = 0.8f;
static const float _FADE_IN_DURATION_S = 0.175f;
static const float _FADE_OUT_DURATION_S = 0.175f;

- (void)update:(CMKKartConfigurationModel *)kartConfiguration isAnimated:(BOOL)animated {
  self.transform = CGAffineTransformIdentity;

  if (animated && [[self subviews] count] > 0) {
    // Fade old view out.
    [UIView animateWithDuration:_FADE_OUT_DURATION_S
                     animations: ^{
                       self.alpha = 0.0;
                     }

                     completion: ^(BOOL finished) {
                       [[self subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
                       self.transform = CGAffineTransformIdentity;
                       [self  addVerticalPartGroupViews:kartConfiguration
                            isAnimated:animated];
                     }];
  } else {
    [self addVerticalPartGroupViews:kartConfiguration isAnimated:animated];
  }
}

- (void)addVerticalPartGroupViews:(CMKKartConfigurationModel *)kartConfiguration
                       isAnimated:(BOOL)animated {
  float verticalPartGroupViewWidth = self.frame.size.width / 4;
  float height = self.frame.size.height;
  int partGroupIndex = 0;

  for (CMKPartGroupModel *partGroup in kartConfiguration.partGroups) {
    CGRect verticalPartGroupFrame = CGRectMake(partGroupIndex * verticalPartGroupViewWidth,
                                               0,
                                               verticalPartGroupViewWidth,
                                               height);
    CMKVerticalPartGroupView *verticalPartGroupView =
      [[CMKVerticalPartGroupView alloc] initWithFrame:verticalPartGroupFrame
                                            withGroup:partGroup
                            withPartImageViewDelegate:self.delegate];


    [self addSubview:verticalPartGroupView];
    partGroupIndex++;
  }

  if (animated) {
    // Fade in new.
    self.transform = CGAffineTransformMake(_TRANSFORMATION_SCALE,
                                           0,
                                           0,
                                           _TRANSFORMATION_SCALE,
                                           0,
                                           0);
    self.alpha = 0.0;

    [UIView animateWithDuration:_FADE_IN_DURATION_S
                     animations: ^{
                       self.transform = CGAffineTransformIdentity;
                       self.alpha = 1.0;
                     }

                     completion: ^(BOOL finished) {
                       self.transform = CGAffineTransformIdentity;
                     }];
  } else {
    self.alpha = 1.0;
  }
}

@end
