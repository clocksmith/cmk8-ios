//
//  CMKPartPopup.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/20/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKAppDelegate.h"
#import "CMKPartModel.h"
#import "CMKPartGroupModel.h"
#import "CMKPartPopupView.h"
#import "CMKSingleStatsScrollView.h"
#import "CMKConstants.h"

#import "GAI.h"
#import "GAITracker.h"
#import "GAIDictionaryBuilder.h"
#import "GAIFields.h"

#define _TAG (NSStringFromClass([CMKPartPopupView class]))

@interface CMKPartPopupView ()

@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet CMKSingleStatsScrollView *statsView;

@end

@implementation CMKPartPopupView {
  id <GAITracker> _tracker;
  BOOL _layoutSubviewsCalled;
  CMKPartModel *_part;
  UIImageView *_anchorImageView;
  UIImageView *_transitionImageView;
  CGPoint _initialOrigin;
  CGSize _initialSize;
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
  UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                  initWithTarget:self
                                                          action:@selector(close)];
  [self addGestureRecognizer:tapGestureRecognizer];

  [_tracker set:kGAIScreenName value:PART_POPUP_SCREEN];
  [_tracker send:[[GAIDictionaryBuilder createAppView]  build]];
}

- (void)layoutSubviews {
//  NSLog(@" % @ layoutSubviews ", _TAG);
  _layoutSubviewsCalled = YES;

  // Call super once here so that we can get the coordinates of the target image view.
  [super layoutSubviews];

  if (_part && _anchorImageView) {
    [self transitionIn];
  }

  // Call super again here after the transition.
  [super layoutSubviews];
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
  [self.statsView
         drawWithMode:_part.partGroup.type == Character ?
             CMKStatModeOnlyPositive:CMKStatModeMaybeNegative];
  [self.statsView updateStats:_part.partGroup.stats isAnimated:YES];
  self.statsView.scrollEnabled = NO;

  _initialOrigin = [_anchorImageView.superview convertPoint:_anchorImageView.frame.origin toView:nil];
  _initialSize = _anchorImageView.frame.size;
  CGPoint finalOrigin = [self.imageView.superview convertPoint:self.imageView.frame.origin toView:nil];
  CGSize finalSize = self.imageView.frame.size;

  _transitionImageView = [[UIImageView alloc] initWithImage:_anchorImageView.image];
  _transitionImageView.frame = CGRectMake(_initialOrigin.x,
                                          _initialOrigin.y,
                                          _initialSize.width,
                                          _initialSize.height);
  _transitionImageView.contentMode = UIViewContentModeScaleAspectFit;
  [self addSubview:_transitionImageView];

  [UIView animateWithDuration:POPUP_TRANSITION_DURAION_S
                   animations: ^{
                     self.backgroundView.alpha = POPUP_SHADE_ALPHA;
                     self.contentView.alpha = 1.0f;
                     _transitionImageView.frame = CGRectMake(finalOrigin.x,
                                            finalOrigin.y,
                                            finalSize.width,
                                            finalSize.height);
                   }

                   completion: ^(BOOL finished) {
                   }];
}

- (void)close {
  [UIView animateWithDuration:POPUP_TRANSITION_DURAION_S
                   animations: ^{
                     self.backgroundView.alpha = 0.0f;
                     self.contentView.alpha = 0.0f;
                     _transitionImageView.frame = CGRectMake(_initialOrigin.x,
                                            _initialOrigin.y,
                                            _initialSize.width,
                                            _initialSize.height);
                   }

                   completion: ^(BOOL finished) {
                     [self removeFromSuperview];
                   }];
}

@end
