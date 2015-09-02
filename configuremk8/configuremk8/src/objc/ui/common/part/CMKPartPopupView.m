//
//  CMKPartPopup.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/20/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <Google/Analytics.h>
#import "CMKAppDelegate.h"
#import "CMKPartModel.h"
#import "CMKPartGroupModel.h"
#import "CMKPartPopupView.h"
#import "CMKSingleStatsScrollView.h"
#import "CMKConstants.h"

#define _TAG (NSStringFromClass([CMKPartPopupView class]))

@interface CMKPartPopupView ()

@property(weak, nonatomic) IBOutlet UIView *backgroundView;
@property(weak, nonatomic) IBOutlet UIView *contentView;
@property(weak, nonatomic) IBOutlet UIImageView *imageView;
@property(weak, nonatomic) IBOutlet UILabel *nameLabel;
@property(weak, nonatomic) IBOutlet CMKSingleStatsScrollView *statsView;

@end

@implementation CMKPartPopupView {
  id<GAITracker> _tracker;
  BOOL _layoutSubviewsCalled;
  CMKPartModel *_part;
  UIImageView *_anchorImageView;
  UIImageView *_transitionImageView;
  NSLayoutConstraint *_topTransitionImageConstraint;
  NSLayoutConstraint *_leftTransitionImageConstraint;
  NSLayoutConstraint *_widthTransitionImageConstraint;
  NSLayoutConstraint *_heightTransitionImageConstraint;
  CGPoint _initialOrigin;
  CGSize _initialSize;
  CGPoint _finalOrigin;
  CGSize _finalSize;
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
  _tracker = [[GAI sharedInstance] defaultTracker];
  _layoutSubviewsCalled = NO;
  self.backgroundColor = [UIColor clearColor];
  self.backgroundView.alpha = 0.0f;
  self.backgroundView.backgroundColor = [UIColor blackColor];
  self.contentView.alpha = 0.0f;
  self.contentView.layer.masksToBounds = NO;
  self.contentView.layer.cornerRadius = POPUP_CONTENT_CORNER_RADIUS;
  self.contentView.layer.shadowRadius = POPUP_CONTENT_SHADOW_RADIUS;
  self.contentView.layer.shadowOffset = CGSizeMake(0, 0);
  self.contentView.layer.shadowOpacity = POPUP_SHADOW_OPACITY;

  self.userInteractionEnabled = YES;
  UITapGestureRecognizer *tapGestureRecognizer =
      [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
  [self addGestureRecognizer:tapGestureRecognizer];

  [_tracker set:kGAIScreenName value:PART_POPUP_SCREEN];
  [_tracker send:[[GAIDictionaryBuilder createAppView] build]];

  //  self.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)layoutSubviews {
  NSLog(@" %@ layoutSubviews ", _TAG);
  _layoutSubviewsCalled = YES;

  // Call super once here so that we can get the coordinates of the target image view.

  [super layoutSubviews];

  if (_part && _anchorImageView && !_layoutSubviewsCalled) {
    [self transitionIn];
  }

  // Call super again here after the transition.
  //  [super layoutSubviews];
}

- (void)updatePart:(CMKPartModel *)part withAnchorImageView:(UIImageView *)imageView {
  _part = part;
  _anchorImageView = imageView;

  if (_layoutSubviewsCalled) {
    [self transitionIn];
  }
}

- (void)transitionIn {
  self.nameLabel.text = _part.displayName;
  [self.statsView drawWithMode:_part.partType == Character ? CMKStatModeOnlyPositive : CMKStatModeMaybeNegative];
  [self.statsView updateStats:[CMKPartData partGroupForPart:_part].stats isAnimated:YES];
  self.statsView.scrollEnabled = NO;

  _initialOrigin = [_anchorImageView.superview convertPoint:_anchorImageView.frame.origin toView:nil];
  _initialSize = _anchorImageView.frame.size;
  _finalOrigin = [self.imageView.superview convertPoint:self.imageView.frame.origin toView:nil];
  _finalSize = self.imageView.frame.size;

  _transitionImageView = [[UIImageView alloc] initWithImage:_anchorImageView.image];
  _transitionImageView.contentMode = UIViewContentModeScaleAspectFit;
  _transitionImageView.translatesAutoresizingMaskIntoConstraints = NO;

  [self addSubview:_transitionImageView];

  NSDictionary *views = NSDictionaryOfVariableBindings(_transitionImageView);

  NSDictionary *initialMetrics = @{
    @"left" : @(_initialOrigin.x),
    @"top" : @(_initialOrigin.y),
    @"width" : @(_initialSize.width),
    @"height" : @(_initialSize.height)
  };
  NSMutableArray *initialConstraints = [NSMutableArray new];
  [initialConstraints
      addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-left-[_transitionImageView(width)]|"
                                                                  options:0
                                                                  metrics:initialMetrics
                                                                    views:views]];
  [initialConstraints
      addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-top-[_transitionImageView(height)]|"
                                                                  options:0
                                                                  metrics:initialMetrics
                                                                    views:views]];

  [self addConstraints:initialConstraints];

  [self layoutIfNeeded];

  NSDictionary *finalMetrics = @{
    @"left" : @(_finalOrigin.x),
    @"top" : @(_finalOrigin.y),
    @"width" : @(_finalSize.width),
    @"height" : @(_finalSize.height)
  };
  NSMutableArray *finalConstraints = [NSMutableArray new];
  [finalConstraints
      addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-left-[_transitionImageView(width)]|"
                                                                  options:0
                                                                  metrics:finalMetrics
                                                                    views:views]];
  [finalConstraints
      addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-top-[_transitionImageView(height)]|"
                                                                  options:0
                                                                  metrics:finalMetrics
                                                                    views:views]];

  [self removeConstraints:initialConstraints];
  [self addConstraints:finalConstraints];

  [UIView animateWithDuration:POPUP_TRANSITION_DURAION_S
      animations:^{
        self.backgroundView.alpha = POPUP_SHADE_ALPHA;
        self.contentView.alpha = 1.0f;
        [self layoutIfNeeded];
      }

      completion:^(BOOL finished){
      }];
}

- (void)close {
  [UIView animateWithDuration:POPUP_TRANSITION_DURAION_S
      delay:0
      options:UIViewAnimationOptionBeginFromCurrentState
      animations:^{
        self.backgroundView.alpha = 0.0f;
        self.contentView.alpha = 0.0f;
        // TODO(clocksmith): Should animates constraints instead of frame.
        _transitionImageView.frame =
            CGRectMake(_initialOrigin.x, _initialOrigin.y, _initialSize.width, _initialSize.height);
      }

      completion:^(BOOL finished) {
        [self removeFromSuperview];
      }];
}

@end
