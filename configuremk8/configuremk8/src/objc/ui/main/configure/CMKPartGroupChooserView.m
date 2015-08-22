//
//  CMKPartGroupChooserView.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/14/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKPartData.h"
#import "CMKPartGroupView.h"
#import "CMKPartGroupChooserView.h"

#define _TAG (NSStringFromClass([CMKPartGroupChooserView class]))

@interface CMKPartGroupChooserView ()

- (void)internalInit;

@end

@implementation CMKPartGroupChooserView {
  NSArray *_partGroups;

  UIImageView *_upwardTriangle;
  UIScrollView *_scrollView;
  UIImageView *_downwardTriangle;
}

static const int _PAGER_ARROW_PADDING = 2;
static const int _PAGER_ARROW_HEIGHT = 10;

- (instancetype)initWithFrame:(CGRect)frame {
  //  NSLog(@"%@ initWithFrame:", _TAG);
  self = [super initWithFrame:frame];

  if (self) {
    [self internalInit];
  }

  return self;
}

- (void)awakeFromNib {
  //  NSLog(@"%@ awakeFromNib: %p", _TAG, self);
  [self internalInit];
}

- (void)internalInit {
}

- (void)drawPartGroups:(NSArray *)partGroups {
  _partGroups = partGroups;

  int frameWidth = self.frame.size.width;
  int frameHeight = self.frame.size.height;

  if (!_upwardTriangle) {
    _upwardTriangle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"upward_triangle_dark_gray"]];

    _upwardTriangle.frame = CGRectMake(0, 0, frameWidth, _PAGER_ARROW_HEIGHT);
    _upwardTriangle.bounds = CGRectInset(_upwardTriangle.frame, _PAGER_ARROW_PADDING, _PAGER_ARROW_PADDING);
    _upwardTriangle.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_upwardTriangle];
  }

  if (!_scrollView) {
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.delegate = self;
    _scrollView.frame = CGRectMake(0, _PAGER_ARROW_HEIGHT, frameWidth, frameHeight - 2 * _PAGER_ARROW_HEIGHT);
    _scrollView.pagingEnabled = YES;
    _scrollView.clipsToBounds = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    [self addSubview:_scrollView];
  }

  if (!_downwardTriangle) {
    UIImageView *downwardTriangle =
        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"downward_triangle_dark_gray"]];
    downwardTriangle.frame = CGRectMake(0, frameHeight - _PAGER_ARROW_HEIGHT, frameWidth, _PAGER_ARROW_HEIGHT);
    downwardTriangle.bounds = CGRectInset(downwardTriangle.frame, _PAGER_ARROW_PADDING, _PAGER_ARROW_PADDING);
    downwardTriangle.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:downwardTriangle];
  }

  for (UIView *subview in [_scrollView subviews]) {
    [subview removeFromSuperview];
  }

  int scrollViewWidth = _scrollView.frame.size.width;
  int scrollViewHeight = _scrollView.frame.size.height;

  _scrollView.contentSize = CGSizeMake(scrollViewWidth, scrollViewHeight * [partGroups count]);
  int partGroupIndex = 0;

  id<CMKPartImageViewDelegate> strongDelegate = (id<CMKPartImageViewDelegate>)self.delegate;

  for (CMKPartGroupModel *partGroup in _partGroups) {
    CGRect partGroupFrame = CGRectMake(0, partGroupIndex * scrollViewHeight, scrollViewWidth, scrollViewHeight);
    CMKPartGroupView *partGroupView = [[CMKPartGroupView alloc] initWithFrame:partGroupFrame
                                                                    withGroup:partGroup
                                                    withPartImageViewDelegate:strongDelegate];

    [_scrollView addSubview:partGroupView];
    partGroupIndex++;
  }

  int pageIndex = (int)_scrollView.contentOffset.y / _scrollView.frame.size.height;
  _upwardTriangle.hidden = pageIndex == 0;
  _downwardTriangle.hidden = pageIndex == ([_partGroups count] - 1);
}

- (void)selectPartGroup:(CMKPartGroupModel *)partGroup isAnimated:(BOOL)animated {
  int pageIndex = 0;

  for (CMKPartGroupModel *partGroupFromModel in _partGroups) {
    if ([partGroup.name isEqualToString:partGroupFromModel.name]) {
      break;
    } else {
      pageIndex++;
    }
  }

  [_scrollView setContentOffset:CGPointMake(0, pageIndex * _scrollView.frame.size.height) animated:YES];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
  int pageIndex = (int)scrollView.contentOffset.y / scrollView.frame.size.height;

  _upwardTriangle.hidden = pageIndex == 0;
  _downwardTriangle.hidden = pageIndex == ([_partGroups count] - 1);

  id<CMKPartGroupChooserViewDelegate> strongDelegate = self.delegate;

  if (strongDelegate && [strongDelegate respondsToSelector:@selector(partGroupChooserView:didSelectPartGroup:)]) {
    [strongDelegate partGroupChooserView:self didSelectPartGroup:_partGroups[pageIndex]];
  }
}

@end
