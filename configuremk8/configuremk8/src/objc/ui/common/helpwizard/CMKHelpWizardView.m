//
//  CMKHelpWizardView.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/31/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKHelpWizardView.h"
#import "CMKHelpWizardItemModel.h"
#import "CMKHelpWizardBackground.h"
#import "CMKColors.h"

#define _TAG (NSStringFromClass([CMKHelpWizardView class]))

@implementation CMKHelpWizardView {
  NSArray *_helpItems;
  int _currentIndex;

  CMKHelpWizardBackground *_backgroundView;
  UIView *_helpMessageContainer;
  UILabel *_helpMessageLabel;
  UIView *_nextOrDoneButton;
  UILabel *_nextOrDoneButtonLabel;
  UIImageView *_nextOrDoneButtonTriangle;
}

static const float _FADE_IN_DURATION_S = 0.350;
static const float _FADE_OUT_DURATION_S = 0.350;
static const float _TRIANGLE_SPIN_DURATION_S = 0.175;

static const float _CORNER_RADIUS = 3;

static const float _HELP_MESSAGE_CONTAINER_ALPHA = 0.42;
static const float _HELP_MESSAGE_MARGIN = 16;
static const float _HELP_MESSAGE_PADDING = 16;
static const float _HELP_MESSAGE_HEIGHT = 144;
static const float _BUTTON_BOTTOM_MARGIN = 16;
static const float _BUTTON_HEIGHT = 48;
static const float _TRIANGLE_LEFT_MARGIN = 8;

- (instancetype)initWithFrame:(CGRect)frame withHelpItems:(NSArray *)helpItems {
  self = [super initWithFrame:frame];

  if (self) {
    _helpItems = helpItems;
    self.backgroundColor = [UIColor clearColor];
    _backgroundView = [[CMKHelpWizardBackground alloc] initWithFrame:frame];
    _backgroundView.alpha = 0;
    [self addSubview:_backgroundView];

    _helpMessageContainer  = [[UIView alloc] initWithFrame:CGRectMake(_HELP_MESSAGE_MARGIN,
                                                                      frame.size.height -
                                                                      _BUTTON_BOTTOM_MARGIN -
                                                                      _BUTTON_HEIGHT -
                                                                      _HELP_MESSAGE_MARGIN -
                                                                      _HELP_MESSAGE_HEIGHT,
                                                                      frame.size.width -
                                                                      2 * _HELP_MESSAGE_MARGIN,
                                                                      _HELP_MESSAGE_HEIGHT
                                                                      )];
    _helpMessageContainer.backgroundColor = [UIColor colorWithWhite:0
                                                              alpha:_HELP_MESSAGE_CONTAINER_ALPHA];
    _helpMessageContainer.layer.cornerRadius = _CORNER_RADIUS;
    _helpMessageContainer.layer.shadowColor = [UIColor blackColor].CGColor;
    _helpMessageContainer.layer.shadowOpacity = 0.5;
    _helpMessageContainer.layer.shadowRadius = 3;
    _helpMessageContainer.layer.shadowOffset = CGSizeZero;
    _helpMessageLabel = [[UILabel alloc]
                         initWithFrame:CGRectMake(_HELP_MESSAGE_PADDING,
                                                  _HELP_MESSAGE_PADDING,
                                                  _helpMessageContainer.frame.size.width -
                                                  2 * _HELP_MESSAGE_PADDING,
                                                  _helpMessageContainer.frame.size.height -
                                                  2 * _HELP_MESSAGE_PADDING)];
    _helpMessageLabel.textColor = [CMKColors whiteColor];
    _helpMessageLabel.numberOfLines = 0;
    _helpMessageLabel.textAlignment = NSTextAlignmentCenter;
    [_helpMessageContainer addSubview:_helpMessageLabel];
    [self insertSubview:_helpMessageContainer aboveSubview:_backgroundView];

    _nextOrDoneButton =
      [[UIButton alloc]
       initWithFrame:CGRectMake(frame.size.width / 4,
                                frame.size.height - _BUTTON_BOTTOM_MARGIN - _BUTTON_HEIGHT,
                                frame.size.width / 2,
                                _BUTTON_HEIGHT)];
    _nextOrDoneButton.backgroundColor = [CMKColors blueColor];
    _nextOrDoneButton.layer.shadowColor = [UIColor blackColor].CGColor;
    _nextOrDoneButton.layer.shadowOpacity = 0.5;
    _nextOrDoneButton.layer.shadowRadius = 3;
    _nextOrDoneButton.layer.shadowOffset = CGSizeZero;
    _nextOrDoneButton.layer.cornerRadius = _CORNER_RADIUS;
    _nextOrDoneButton.userInteractionEnabled = YES;
    [_nextOrDoneButton addGestureRecognizer:
     [[UITapGestureRecognizer alloc] initWithTarget:self
                                             action:@selector(handleNextOrDoneTapped)]];

    NSString *nextText = NSLocalizedString(@"Next", nil);
    _nextOrDoneButtonLabel = [[UILabel alloc] init];

    CGSize expectedLabelSize = [nextText sizeWithAttributes:
                                @{ NSFontAttributeName:
                                   [UIFont systemFontOfSize:17.0] }];
    float triangleDimen = expectedLabelSize.height;
    _nextOrDoneButtonLabel.frame = CGRectMake(
        (_nextOrDoneButton.frame.size.width -
         (expectedLabelSize.width + _TRIANGLE_LEFT_MARGIN + triangleDimen)) / 2,
        0,
        expectedLabelSize.width,
        _nextOrDoneButton.frame.size.height);
    _nextOrDoneButtonLabel.textColor = [CMKColors whiteColor];
    _nextOrDoneButtonLabel.text = nextText;
    [_nextOrDoneButton addSubview:_nextOrDoneButtonLabel];

    _nextOrDoneButtonTriangle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:
                                                                    @"right_pointing_triangle_white"]];
    _nextOrDoneButtonTriangle.frame = CGRectMake(
        _nextOrDoneButtonLabel.frame.origin.x +
        _nextOrDoneButtonLabel.frame.size.width +
        _TRIANGLE_LEFT_MARGIN,
        (_nextOrDoneButtonLabel.frame.size.height - triangleDimen) / 2,
        triangleDimen,
        triangleDimen);
    _nextOrDoneButton.contentMode = UIViewContentModeScaleAspectFit;
    [_nextOrDoneButton addSubview:_nextOrDoneButtonTriangle];

    [self insertSubview:_nextOrDoneButton aboveSubview:_backgroundView];
  }

  return self;
}

- (void)start {
  _currentIndex = 0;
  [UIView animateWithDuration:_FADE_IN_DURATION_S
                   animations: ^{
                     _backgroundView.alpha = 1.0;
                   }];
  [self dislplayNextItem];
}

- (void)dislplayNextItem {
  CMKHelpWizardItemModel *helpWizardItem = _helpItems[_currentIndex];

  _helpMessageLabel.text = helpWizardItem.helpMessage;

  [_backgroundView updateFrameToHighlight:helpWizardItem.viewToHighlight.frame];

  // TODO(clocksmith): Display message and update next or done button

  _currentIndex++;
}

- (void)handleNextOrDoneTapped {
  NSLog(@"%@ handleNextOrDoneTapped", _TAG);
  int count = [_helpItems count];

  if (_currentIndex < count) {
    if (_currentIndex == count - 1) {
      NSString *doneText = NSLocalizedString(@"Done", nil);
      CGSize expectedLabelSize = [doneText sizeWithAttributes:
                                  @{ NSFontAttributeName:
                                     [UIFont systemFontOfSize:17.0] }];
      float triangleDimen = expectedLabelSize.height;
      _nextOrDoneButtonLabel.frame = CGRectMake(
          (_nextOrDoneButton.frame.size.width -
           (expectedLabelSize.width + triangleDimen)) / 2,
          0,
          expectedLabelSize.width,
          _nextOrDoneButton.frame.size.height);
      _nextOrDoneButtonLabel.textColor = [CMKColors whiteColor];
      _nextOrDoneButtonLabel.text = doneText;
      _nextOrDoneButtonTriangle.frame = CGRectMake(
          _nextOrDoneButtonLabel.frame.origin.x +
          _nextOrDoneButtonLabel.frame.size.width +
          _TRIANGLE_LEFT_MARGIN,
          (_nextOrDoneButtonLabel.frame.size.height - triangleDimen) / 2,
          triangleDimen,
          triangleDimen);
      _nextOrDoneButtonLabel.text = doneText;

      CGAffineTransform transform = CGAffineTransformRotate(CGAffineTransformIdentity, M_PI_2);
      [UIView animateWithDuration:_TRIANGLE_SPIN_DURATION_S
                       animations: ^{
                         _nextOrDoneButtonTriangle.transform = transform;
                       }];
    }

    [self dislplayNextItem];
  } else {
    [self close];
  }
}

- (void)close {
  [UIView animateWithDuration:_FADE_OUT_DURATION_S
                   animations: ^{
                     self.alpha = 0;
                     _helpMessageContainer.frame = CGRectMake(_helpMessageContainer.frame.origin.x,
                                             self.frame.size.height,
                                             _helpMessageContainer.frame.size.width,
                                             _helpMessageContainer.frame.size.height);
                     _nextOrDoneButton.frame = CGRectMake(_nextOrDoneButton.frame.origin.x,
                                         self.frame.size.height,
                                         _nextOrDoneButton.frame.size.width,
                                         _nextOrDoneButton.frame.size.height);
                   }

                   completion:^(BOOL finished) {
                     [self removeFromSuperview];
                   }];
}

@end
