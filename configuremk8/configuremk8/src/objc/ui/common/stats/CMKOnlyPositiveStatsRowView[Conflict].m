//
//  CMKPositiveStatsViewRow.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/20/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKColors.h"
#import "CMKConstants.h"
#import "CMKOnlyPositiveStatsRowView.h"

#define _TAG (NSStringFromClass([CMKOnlyPositiveStatsRowView class]))

@interface CMKOnlyPositiveStatsRowView ()

@property (nonatomic, weak) IBOutlet UILabel *valueLabel;
@property (nonatomic, weak) IBOutlet UIView *bar;

@end

@implementation CMKOnlyPositiveStatsRowView {
  float _originalBarWidth;
}

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
  _originalBarWidth = self.bar.frame.size.width;
  self.bar.backgroundColor = [CMKColors blueColor];
  self.bar.layer.cornerRadius = self.bar.frame.size.height / 2;
  self.bar.layer.masksToBounds = YES;
  self.attributeValue = 0.0f;
  self.bar.frame = CGRectMake(self.bar.frame.origin.x,
                              self.bar.frame.origin.y,
                              0,
                              self.bar.frame.size.height);
}

- (void)updateAttributeValue:(float)attributeValue {
//  NSLog(@"%@ attributeValue = %f", _TAG, attributeValue);
  self.attributeValue = attributeValue;
  float width = self.attributeValue / MAX_TOTAL_STATS_VALUE * _originalBarWidth;
  CGRect newFrame = CGRectMake(self.bar.frame.origin.x,
                               self.bar.frame.origin.y,
                               width,
                               self.bar.frame.size.height);

  [UIView animateWithDuration:STATS_BAR_CHANGE_DURATION_S
                   animations: ^{
                     self.bar.frame = newFrame;
                   }

                   completion: ^(BOOL finished) {
//                     NSLog(@"%@ animation completion", _TAG);
                   }];

  self.valueLabel.text = [NSString stringWithFormat:@"%.02f", attributeValue];
}

@end
