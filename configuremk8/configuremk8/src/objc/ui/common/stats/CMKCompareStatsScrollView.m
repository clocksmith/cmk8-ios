//
//  CMKCompareStatsScrollView.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/25/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKCompareStatsRowView.h"
#import "CMKCompareStatsScrollView.h"

@implementation CMKCompareStatsScrollView {
  NSMutableDictionary *_rowViews;
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
  _rowViews = [[NSMutableDictionary alloc] init];

  self.scrollEnabled = YES;
  self.clipsToBounds = YES;
  self.showsHorizontalScrollIndicator = NO;
}

- (void)setup {
  int contentHeight = 0;

  for (NSNumber *attributeIndex in[CMKStatsModel allAttributesInOrder]) {
    CMKCompareStatsRowView *rowView = [[[NSBundle mainBundle]
                                        loadNibNamed:NSStringFromClass([CMKCompareStatsRowView class])
                                               owner:self
                                             options:nil]
                                       firstObject];
    rowView.frame = CGRectMake(0,
                               contentHeight,
                               self.frame.size.width,
                               rowView.frame.size.height);
    rowView.attributeLabel.text = [CMKStatsModel displayNameForIndex:attributeIndex];
    _rowViews[attributeIndex] = rowView;
    contentHeight += rowView.frame.size.height;
  }

  self.contentSize = CGSizeMake(self.frame.size.width, contentHeight);

  for (id key in _rowViews) {
    [self addSubview:_rowViews[key]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_rowViews[key]
                                                     attribute:NSLayoutAttributeLeading
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeading
                                                    multiplier:1.0
                                                      constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_rowViews[key]
                                                     attribute:NSLayoutAttributeTrailing
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTrailing
                                                    multiplier:1.0
                                                      constant:0.0]];
  }

  [self setNeedsLayout];
  [self layoutIfNeeded];
}

- (void)updateWithLeftStats:(CMKStatsModel *)leftStats
             withRightStats:(CMKStatsModel *)rightStats
                 isAnimated:(BOOL)animated {
  for (NSNumber *attributeIndex in[CMKStatsModel allAttributesInOrder]) {
    CMKCompareStatsRowView *rowView = (CMKCompareStatsRowView *)_rowViews[attributeIndex];
    [rowView updateWithLeftAttributeValue:[leftStats statValueForIndex:attributeIndex]
                  withRightAttributeValue:[rightStats statValueForIndex:attributeIndex]
                               isAnimated:animated];
  }
}

@end
