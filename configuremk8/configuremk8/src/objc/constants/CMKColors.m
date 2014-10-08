//
//  CMKColors.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/7/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKColors.h"

@implementation CMKColors

static NSString *const _BLUE_HEX_STRING = @"#33b5e5";
static NSString *const _BLUE_HALF_TRANSPARENT_HEX_STRING = @"#8033b5e5";
static NSString *const _RED_HEX_STRING = @"#e60012";
static NSString *const _DARK_RED_HEX_STRING = @"#b3101d";
static NSString *const _WHITE_HEX_STRING = @"#ffffff";
static NSString *const _LIGHT_GRAY_HEX_STRING = @"#d0d0d0";
static NSString *const _GRAY_HEX_STRING = @"#808080";
static NSString *const _DARK_GRAY_HEX_STRING = @"#505050";

static UIColor *_blueColor;
static UIColor *_blueHalfTransparentColor;
static UIColor *_redColor;
static UIColor *_darkRedColor;
static UIColor *_whiteColor;
static UIColor *_lightGrayColor;
static UIColor *_grayColor;
static UIColor *_darkGrayColor;

+ (void)initialize {
  // Initialized is here for a precaution in case someone calls initialize directly.
  static BOOL initialized = NO;

  if (!initialized) {
    initialized = YES;
    _blueColor = [self colorWithHexString:_BLUE_HEX_STRING];
    _blueHalfTransparentColor = [self colorWithHexString:_BLUE_HALF_TRANSPARENT_HEX_STRING];
    _redColor = [self colorWithHexString:_RED_HEX_STRING];
    _darkRedColor = [self colorWithHexString:_DARK_RED_HEX_STRING];
    _whiteColor = [self colorWithHexString:_WHITE_HEX_STRING];
    _lightGrayColor = [self colorWithHexString:_LIGHT_GRAY_HEX_STRING];
    _grayColor = [self colorWithHexString:_GRAY_HEX_STRING];
    _darkGrayColor = [self colorWithHexString:_DARK_GRAY_HEX_STRING];
  }
}

+ (UIColor *)blueColor {
  return _blueColor;
}

+ (UIColor *)blueHalfTransparentColor {
  return _blueHalfTransparentColor;
}

+ (UIColor *)redColor {
  return _redColor;
}

+ (UIColor *)darkRedColor {
  return _darkRedColor;
}

+ (UIColor *)whiteColor {
  return _whiteColor;
}

+ (UIColor *)lightGrayColor {
  return _lightGrayColor;
}

+ (UIColor *)grayColor {
  return _grayColor;
}

+ (UIColor *)darkGrayColor {
  return _darkGrayColor;
}

+ (UIColor *)tabBarBackgroundColor {
  return _blueHalfTransparentColor;
}

+ (UIColor *)tabBarTextColor {
  return [UIColor whiteColor];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString {
  NSString *colorString = [[hexString stringByReplacingOccurrencesOfString:@"#"
                                                                withString:@""] uppercaseString];
  CGFloat alpha;
  CGFloat red;
  CGFloat green;
  CGFloat blue;

  switch ([colorString length]) {
    case 3:             // #RGB
      alpha = 1.0f;
      red   = [self colorValueFrom:colorString start:0 length:1];
      green = [self colorValueFrom:colorString start:1 length:1];
      blue  = [self colorValueFrom:colorString start:2 length:1];
      break;

    case 4:             // #ARGB
      alpha = [self colorValueFrom:colorString start:0 length:1];
      red   = [self colorValueFrom:colorString start:1 length:1];
      green = [self colorValueFrom:colorString start:2 length:1];
      blue  = [self colorValueFrom:colorString start:3 length:1];
      break;

    case 6:             // #RRGGBB
      alpha = 1.0f;
      red   = [self colorValueFrom:colorString start:0 length:2];
      green = [self colorValueFrom:colorString start:2 length:2];
      blue  = [self colorValueFrom:colorString start:4 length:2];
      break;

    case 8:             // #AARRGGBB
      alpha = [self colorValueFrom:colorString start:0 length:2];
      red   = [self colorValueFrom:colorString start:2 length:2];
      green = [self colorValueFrom:colorString start:4 length:2];
      blue  = [self colorValueFrom:colorString start:6 length:2];
      break;

    default:
      [NSException raise:@"Invalid color value."
                  format:@"Color value %@ is invalid.", hexString];
      break;
  }
  return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (CGFloat)colorValueFrom:(NSString *)string
                    start:(NSUInteger)start
                   length:(NSUInteger)length {
  NSString *substring = [string substringWithRange:NSMakeRange(start, length)];
  NSString *fullHexString = length == 2 ? substring : [NSString stringWithFormat:@"%@%@",
                                                       substring,
                                                       substring];
  unsigned hexValue;

  [[NSScanner scannerWithString:fullHexString] scanHexInt:&hexValue];
  return hexValue / 255.0;
}

@end
