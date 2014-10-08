//
//  CMKHelpWizardBackground.m
//  configuremk8
//
//  Created by Anthony Robledo on 9/1/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKHelpWizardBackground.h"

#define _TAG (NSStringFromClass([CMKHelpWizardBackground class]))

@implementation CMKHelpWizardBackground {
  CADisplayLink *_displayLink;
  CGRect _oldFrameHighlighted;
  CGRect _newFrameToHighlight;
  int _frameCount;
  BOOL _updateFrameToHighlightCalled;
}

static const float _BACKGROUND_ALPHA = 0.5;
static const float _HIGHLIGHT_TRANSITION_DURATION_S = 0.350;
static const float _HIGHLIGHT_PADDING = 0;
static const float _FPS = 30;
- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];

  if (self) {
    // Initialization code
    self.backgroundColor = [UIColor clearColor];
    _oldFrameHighlighted = CGRectZero;
    _newFrameToHighlight = CGRectZero;
  }

  return self;
}

- (void)updateFrameToHighlight:(CGRect)frameToHighlight {
  if (_updateFrameToHighlightCalled) {
    _oldFrameHighlighted = _newFrameToHighlight;
  }

  _newFrameToHighlight = CGRectMake(frameToHighlight.origin.x - _HIGHLIGHT_PADDING,
                                    frameToHighlight.origin.y - _HIGHLIGHT_PADDING,
                                    frameToHighlight.size.width + 2 * _HIGHLIGHT_PADDING,
                                    frameToHighlight.size.height + 2 * _HIGHLIGHT_PADDING);

  if (!_updateFrameToHighlightCalled) {
    _oldFrameHighlighted = _newFrameToHighlight;
  }

  _frameCount = 0;
  _displayLink = [CADisplayLink displayLinkWithTarget:self
                                             selector:@selector(setNeedsDisplay)];
  [_displayLink addToRunLoop:[NSRunLoop currentRunLoop]
                     forMode:NSDefaultRunLoopMode];
  _updateFrameToHighlightCalled = YES;
}

- (void)drawRect:(CGRect)rect {
  NSLog(@"%@ drawRect", _TAG);
  int numFramesToAnimate = ceil(_HIGHLIGHT_TRANSITION_DURATION_S * _FPS);
  float fractionOfDuration = (float)_frameCount / numFramesToAnimate;
  CGRect currentFrame =
    CGRectMake(_oldFrameHighlighted.origin.x +
               fractionOfDuration * (_newFrameToHighlight.origin.x - _oldFrameHighlighted.origin.x),
               _oldFrameHighlighted.origin.y +
               fractionOfDuration * (_newFrameToHighlight.origin.y - _oldFrameHighlighted.origin.y),
               _oldFrameHighlighted.size.width +
               fractionOfDuration * (_newFrameToHighlight.size.width - _oldFrameHighlighted.size.width),
               _oldFrameHighlighted.size.height +
               fractionOfDuration * (_newFrameToHighlight.size.height - _oldFrameHighlighted.size.height));
  CGContextRef context = UIGraphicsGetCurrentContext();

  CGContextClearRect(context, rect);
  CGContextSetRGBFillColor(context, 0, 0, 0, _BACKGROUND_ALPHA);
  CGContextFillRect(context, rect);

  CGContextSaveGState(context);
  CGContextSetBlendMode(context, kCGBlendModeDestinationOut);
  CGContextSetRGBFillColor(context, 0, 0, 0, 1);
  CGContextSetShadowWithColor(context, CGSizeMake(0, 0), 10, [UIColor whiteColor].CGColor);
  CGContextFillRect(context, currentFrame);
  CGContextRestoreGState(context);

  if (_frameCount == numFramesToAnimate) {
    [_displayLink invalidate];
  } else {
    _frameCount++;
  }
}

@end
