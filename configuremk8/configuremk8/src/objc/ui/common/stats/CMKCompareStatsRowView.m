//
//  CMKCompareStatsRowView.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/25/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKColors.h"
#import "CMKConstants.h"
#import "CMKCompareStatsRowView.h"

#define _TAG (NSStringFromClass([CMKCompareStatsRowView class]))

@interface CMKCompareStatsRowView ()

@property (nonatomic, weak) IBOutlet UIView *leftBar;
@property (nonatomic, weak) IBOutlet UILabel *leftValueLabel;
@property (nonatomic, weak) IBOutlet UILabel *leftDifferenceLabel;
@property (nonatomic, weak) IBOutlet UILabel *equalLabel;
@property (nonatomic, weak) IBOutlet UIView *rightBar;
@property (nonatomic, weak) IBOutlet UILabel *rightValueLabel;
@property (nonatomic, weak) IBOutlet UILabel *rightDifferenceLabel;


@end

@implementation CMKCompareStatsRowView

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
  self.leftBar.backgroundColor = [CMKColors blueColor];
  self.leftBar.layer.cornerRadius = self.leftBar.frame.size.height / 2;
  self.leftBar.layer.masksToBounds = YES;

  self.rightBar.backgroundColor = [CMKColors blueColor];
  self.rightBar.layer.cornerRadius = self.rightBar.frame.size.height / 2;
  self.rightBar.layer.masksToBounds = YES;
}

- (void)updateWithLeftAttributeValue:(float)leftAttributeValue
             withRightAttributeValue:(float)rightAttributeValue
                          isAnimated:(BOOL)animated {
  float differenceValue = rightAttributeValue - leftAttributeValue;
  float widthOfStatsBarArea = self.rightValueLabel.frame.origin.x -
    (self.leftValueLabel.frame.origin.x + self.leftValueLabel.frame.size.width);
  float maxBarWidth = (widthOfStatsBarArea -
                       self.leftDifferenceLabel.frame.size.width -
                       self.rightDifferenceLabel.frame.size.width -
                       4 * _PADDING) / 2;

  self.leftValueLabel.text = [NSString stringWithFormat:@"%.02f", leftAttributeValue];
  self.rightValueLabel.text = [NSString stringWithFormat:@"%.02f", rightAttributeValue];

  if (differenceValue < 0) {
    [self showDifferenceLabel:self.leftDifferenceLabel withValue:differenceValue];
  } else if (differenceValue > 0) {
    [self showDifferenceLabel:self.rightDifferenceLabel withValue:differenceValue];
  } else {
    [self showDifferenceLabel:self.equalLabel withValue:differenceValue];
  }

  float width = fabsf(differenceValue) / MAX_TOTAL_STATS_VALUE * maxBarWidth;
  float middleX = self.frame.size.width / 2;
  CGRect newLeftBarFrame = CGRectMake(differenceValue < 0 ? middleX - width - _PADDING : middleX - _PADDING,
                                      self.leftBar.frame.origin.y,
                                      differenceValue < 0 ? width : 0,
                                      self.leftBar.frame.size.height);
  CGRect newRightBarFrame = CGRectMake(middleX + _PADDING,
                                       self.rightBar.frame.origin.y,
                                       differenceValue > 0 ? width : 0,
                                       self.rightBar.frame.size.height);
  CGRect newLeftDifferenceLabelFrame = CGRectMake(differenceValue < 0 ?
                                                  middleX - width - self.leftDifferenceLabel.frame.size.width - _PADDING * 2 :
                                                  middleX - self.leftDifferenceLabel.frame.size.width - _PADDING * 2,
                                                  self.leftDifferenceLabel.frame.origin.y,
                                                  self.leftDifferenceLabel.frame.size.width,
                                                  self.leftDifferenceLabel.frame.size.height);
  CGRect newRightDifferenceLabelFrame = CGRectMake(differenceValue > 0 ?
                                                   middleX + width + _PADDING * 2 :
                                                   middleX + _PADDING * 2,
                                                   self.leftDifferenceLabel.frame.origin.y,
                                                   self.leftDifferenceLabel.frame.size.width,
                                                   self.leftDifferenceLabel.frame.size.height);

  if (animated) {
    [UIView animateWithDuration:STATS_BAR_CHANGE_DURATION_S
                     animations: ^{
                       self.leftBar.frame = newLeftBarFrame;
                       self.rightBar.frame = newRightBarFrame;
                       self.leftDifferenceLabel.frame = newLeftDifferenceLabelFrame;
                       self.rightDifferenceLabel.frame = newRightDifferenceLabelFrame;
                     }];
  } else {
    self.leftBar.frame = newLeftBarFrame;
    self.rightBar.frame = newRightBarFrame;
    self.leftDifferenceLabel.frame = newLeftDifferenceLabelFrame;
    self.rightDifferenceLabel.frame = newRightDifferenceLabelFrame;
  }
}

- (void)showDifferenceLabel:(UILabel *)differenceLabel withValue:(float)value {
  self.leftDifferenceLabel.hidden = differenceLabel != self.leftDifferenceLabel;
  self.equalLabel.hidden = differenceLabel != self.equalLabel;
  self.rightDifferenceLabel.hidden = differenceLabel != self.rightDifferenceLabel;

  if (value != 0) {
    differenceLabel.text = [NSString stringWithFormat:@"+%.02f", fabsf(value)];
  }
}

@end
