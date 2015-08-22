//
//  CMKPositiveStatsScrollView.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/20/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKOnlyPositiveSingleStatsRowView.h"
#import "CMKAnyNumberSingleStatsRowView.h"
#import "CMKSingleStatsScrollView.h"
#import "CMKStatsModel.h"
#import "CMKSingleStatsRowView.h"

#define _TAG (NSStringFromClass([CMKSingleStatsScrollView class]))

@interface CMKSingleStatsScrollView ()

- (void)internalInit;

@end;

@implementation CMKSingleStatsScrollView {
  int _numLayoutSubviewsCalled;
  CMKStatsModel *_currentStats;
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
  _numLayoutSubviewsCalled = 0;
  _rowViews = [[NSMutableDictionary alloc] init];

  self.scrollEnabled = YES;
  self.clipsToBounds = YES;
  self.showsHorizontalScrollIndicator = NO;
}

// This fixes the stats view so that its initial position is correct and animated.
- (void)layoutSubviews {
//  NSLog(@"%@ layoutSubviews", _TAG);
  _numLayoutSubviewsCalled++;

  if (_numLayoutSubviewsCalled == 2 && _currentStats) {
    [self updateStats:_currentStats isAnimated:NO];
  }
}

- (void)drawWithMode:(CMKStatsMode)mode {
  // Reset the view if a mode has already been set.
  [[self subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
  [_rowViews removeAllObjects];

  int contentHeight = 0;

  Class singleStatsRowViewClass;

  switch (mode) {
    case CMKStatModeOnlyPositive:
      singleStatsRowViewClass = [CMKOnlyPositiveSingleStatsRowView class];
      break;

    case CMKStatModeMaybeNegative:
    default:
      singleStatsRowViewClass = [CMKAnyNumberSingleStatsRowView class];
      break;
  }

  NSString *rowViewName = NSStringFromClass(singleStatsRowViewClass);

  for (NSNumber *attributeIndex in[CMKStatsModel allAttributesInOrder]) {
    CMKSingleStatsRowView *rowView = [[[NSBundle mainBundle]
                                       loadNibNamed:rowViewName
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
}

- (void)updateStats:(CMKStatsModel *)stats isAnimated:(BOOL)animated {
  _currentStats = stats;

  if (_numLayoutSubviewsCalled > 0) {
    for (NSNumber *attributeIndex in[CMKStatsModel allAttributesInOrder]) {
      [((CMKOnlyPositiveSingleStatsRowView *)_rowViews[attributeIndex])updateAttributeValue :
       [stats statValueForIndex:attributeIndex]
       isAnimated : animated];
    }
  }
}

@end
