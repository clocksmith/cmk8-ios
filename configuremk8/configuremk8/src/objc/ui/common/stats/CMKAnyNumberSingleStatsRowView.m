//
//  CMKMaybeNegativeRowView.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/20/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKAnyNumberSingleStatsRowView.h"
#import "CMKColors.h"
#import "CMKConstants.h"

#define _TAG (NSStringFromClass([CMKAnyNumberSingleStatsRowView class]))

@interface CMKAnyNumberSingleStatsRowView ()

@property (nonatomic, weak) IBOutlet UILabel *zeroLabel;
@property (nonatomic, weak) IBOutlet UIView *negativeBar;
@property (nonatomic, weak) IBOutlet UILabel *negativeValueLabel;
@property (nonatomic, weak) IBOutlet UIView *positiveBar;
@property (nonatomic, weak) IBOutlet UILabel *positiveValueLabel;

@end

@implementation CMKAnyNumberSingleStatsRowView {
  float _maxBarWidth;
}

static const float _PADDING = 4;

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
//  NSLog(@"%@ internalInit", _TAG);
  self.negativeBar.backgroundColor = [CMKColors redColor];
  self.negativeBar.layer.cornerRadius = self.negativeBar.frame.size.height / 2;
  self.negativeBar.layer.masksToBounds = YES;

  self.positiveBar.backgroundColor = [CMKColors blueColor];
  self.positiveBar.layer.cornerRadius = self.negativeBar.frame.size.height / 2;
  self.positiveBar.layer.masksToBounds = YES;

  self.negativeValueLabel.hidden = YES;
  self.positiveValueLabel.hidden = YES;
}

- (void)layoutSubviews {
  [super layoutSubviews];

  if (self.attributeValue) {
    [self updateAttributeValue:self.attributeValue isAnimated:YES];
  }
}

- (void)updateAttributeValue:(float)attributeValue isAnimated:(BOOL)animated {
  // subtract 3 paddings:
  // <superview edge> [padding 1] <attributeLabel> [padding 2] <bar1> <bar2> [padding 3] <superview edge>
  _maxBarWidth = (self.frame.size.width - self.attributeLabel.frame.size.width - 3 * _PADDING) / 2;
  self.attributeValue = attributeValue;

  self.zeroLabel.hidden = attributeValue != 0;
  self.negativeValueLabel.hidden = attributeValue >= 0;
  self.positiveValueLabel.hidden = attributeValue <= 0;

  float width = self.attributeValue / MAX_SMALL_PART_STATS_VALUE * _maxBarWidth;
  CGRect newNegativeFrame = CGRectMake(self.negativeBar.frame.origin.x,
                                       self.negativeBar.frame.origin.y,
                                       attributeValue < 0 ? width : 0,
                                       self.negativeBar.frame.size.height);
  CGRect newPositiveFrame = CGRectMake(self.positiveBar.frame.origin.x,
                                       self.positiveBar.frame.origin.y,
                                       attributeValue > 0 ? width : 0,
                                       self.positiveBar.frame.size.height);

  if (attributeValue < 0) {
    self.negativeValueLabel.text = [NSString stringWithFormat:@"%.02f", attributeValue];
    self.positiveBar.frame = newPositiveFrame;
    [UIView animateWithDuration:STATS_BAR_CHANGE_DURATION_S
                     animations: ^{
                       self.negativeBar.frame = newNegativeFrame;
                     }];
  } else if (attributeValue > 0) {
    self.positiveValueLabel.text = [NSString stringWithFormat:@"+%.02f", attributeValue];
    self.negativeBar.frame = newNegativeFrame;
    [UIView animateWithDuration:STATS_BAR_CHANGE_DURATION_S
                     animations: ^{
                       self.positiveBar.frame = newPositiveFrame;
                     }];
  }
}

@end
