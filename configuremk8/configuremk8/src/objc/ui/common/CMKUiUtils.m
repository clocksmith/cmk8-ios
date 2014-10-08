//
//  CMKUiUtils.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/10/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "CMKUiUtils.h"

@implementation CMKUiUtils

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
  UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
  [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
  UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return newImage;
}

+ (void)addRoundedCornersToView:(UIView *)view withCorners:(UIRectCorner)corners withRadius:(float)radius {
  CALayer *maskLayer = [CMKUiUtils maskForRoundedCorners:view
                                             withCorners:corners
                                              withRadius:radius];

  view.layer.mask = maskLayer;
}

+ (CALayer *)maskForRoundedCorners:(UIView *)view
                       withCorners:(UIRectCorner)corners
                        withRadius:(float)radius {
  CAShapeLayer *maskLayer = [CAShapeLayer layer];

  maskLayer.frame = view.bounds;

  UIBezierPath *roundedPath = [UIBezierPath bezierPathWithRoundedRect:maskLayer.bounds
                                                    byRoundingCorners:corners
                                                          cornerRadii:CGSizeMake(radius, radius)];
  maskLayer.fillColor = [[UIColor whiteColor] CGColor];
  maskLayer.backgroundColor = [[UIColor clearColor] CGColor];
  maskLayer.path = [roundedPath CGPath];

  return maskLayer;
}

+ (UIImage *)imageWithView:(UIView *)view {
  UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0.0);
  [view.layer renderInContext:UIGraphicsGetCurrentContext()];
  UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return img;
}

@end
