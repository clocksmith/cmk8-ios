//
//  CMKAdjustButtonView.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/27/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKColors.h"
#import "CMKConstants.h"
#import "CMKCircleWithTextView.h"

@implementation CMKCircleWithTextView {
  float _subtractFromRadius;
  UIColor *_backgroundColor;
  UIColor *_textColor;
  NSString *_text;
  UIFont *_font;
  BOOL _hasShadow;
}

static float const defaultSubtractFromRadius = 4;
static NSString *const defaultText = @"DEFAULT";

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
  // Defaults
  [self setBackgroundColor:[UIColor clearColor]];
  _subtractFromRadius = defaultSubtractFromRadius;
  _backgroundColor = [CMKColors grayColor];
  _textColor = [UIColor whiteColor];
  _text = defaultText;
  _font = [UIFont boldSystemFontOfSize:ADJUST_BUTTON_FONT_SIZE_IPHONE];
}

- (void)updateBackgroundColor:(UIColor *)backgroundColor {
  _backgroundColor = backgroundColor;
}

- (void)updateTextColor:(UIColor *)textColor {
  _textColor = textColor;
}

- (void)updateText:(NSString *)text {
  _text = text;
}

- (void)updateFont:(UIFont *)font {
  _font = font;
}

- (void)updateSubtractFromRadius:(float)subtractFromRadius {
  _subtractFromRadius = subtractFromRadius;
}

- (void)updateShadow:(BOOL)hasShadow {
  _hasShadow = hasShadow;
}

- (void)drawRect:(CGRect)rect {
  CGContextRef context = UIGraphicsGetCurrentContext();

  CGContextClearRect(context, rect);

  CGContextAddArc(context,
                  CGRectGetMidX(rect),
                  CGRectGetMidY(rect),
                  CGRectGetWidth(rect) / 2 - _subtractFromRadius,
                  0,
                  2 * M_PI,
                  YES);


  CGContextSetFillColorWithColor(context, _backgroundColor.CGColor);

  if (_hasShadow) {
    CGContextSetShadowWithColor(context, CGSizeMake(0, 0), 4, [UIColor blackColor].CGColor);
  }

  CGContextFillPath(context);

  if (_hasShadow) {
    CGContextSetShadowWithColor(context, CGSizeMake(0, 0), 0, [UIColor clearColor].CGColor);
  }

  [self drawTextInRect:rect inContext:context];
}

- (void)drawTextInRect:(CGRect)rect inContext:(CGContextRef)context {
  CGContextSaveGState(context);

  // Fix center point for - or + buttons.
  float verticalTextShift = 0;

  if ([_text isEqualToString:@"+"]) {
    verticalTextShift = -1.5;
  } else if ([_text isEqualToString:@"-"]) {
    verticalTextShift = -0.5;
  }

  CGContextTranslateCTM(context, 0, verticalTextShift + (CGRectGetMidY(rect) - (_font.lineHeight / 2)));

  CGRect frame = CGRectMake(0, 0, CGRectGetWidth(rect), _font.lineHeight);
  UILabel *label = [[UILabel alloc] initWithFrame:frame];
  label.text = _text;
  label.textColor = _textColor;
  label.font = _font;
  label.textAlignment = NSTextAlignmentCenter;
  label.backgroundColor = [UIColor clearColor];
  [label.layer drawInContext:context];

  CGContextRestoreGState(context);
}

@end
