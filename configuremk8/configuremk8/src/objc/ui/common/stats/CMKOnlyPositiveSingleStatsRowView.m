//
//  CMKPositiveStatsViewRow.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/20/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKColors.h"
#import "CMKConstants.h"
#import "CMKOnlyPositiveSingleStatsRowView.h"
#import "CMKUiUtils.h"

#define _TAG (NSStringFromClass([CMKOnlyPositiveSingleStatsRowView class]))

@interface CMKOnlyPositiveSingleStatsRowView ()

@property (nonatomic, weak) IBOutlet UILabel *valueLabel;
@property (nonatomic, weak) IBOutlet UIView *bar;

@end

@implementation CMKOnlyPositiveSingleStatsRowView {
  float _maxBarWidth;
}

static const float _PADDING = 8;

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];

  if (self) {
    [self internalInit];
  }

  return self;
}

- (void)awakeFromNib {
  [self internalInit];
}

- (void)internalInit {
  self.bar.backgroundColor = [CMKColors blueColor];
  CGFloat radius = self.bar.frame.size.height / 2;
  self.bar.layer.cornerRadius = radius;
}

- (void)layoutSubviews {
  [super layoutSubviews];

  if (self.attributeValue) {
    [self updateAttributeValue:self.attributeValue isAnimated:NO];
  }
}

- (void)updateAttributeValue:(float)attributeValue isAnimated:(BOOL)animated {
  self.attributeValue = attributeValue;

  // subtract 3 paddings:
  // <superview edge> [padding 1] <attributeLabel> [padding 2] <bar> [padding 3] <superview edge>
  _maxBarWidth = self.frame.size.width - self.attributeLabel.frame.size.width - 3 * _PADDING;
  float width = attributeValue / MAX_TOTAL_STATS_VALUE * _maxBarWidth;

  CGRect newFrame = CGRectMake(self.bar.frame.origin.x,
                               self.bar.frame.origin.y,
                               width,
                               self.bar.frame.size.height);

  if (animated) {
    [UIView animateWithDuration:STATS_BAR_CHANGE_DURATION_S
                     animations: ^{
                       self.bar.frame = newFrame;
                     }

                     completion: ^(BOOL completed) {
                     }];
  } else {
    self.bar.frame = newFrame;
  }

  self.valueLabel.text = [NSString stringWithFormat:@"%.02f", attributeValue];
}

@end
