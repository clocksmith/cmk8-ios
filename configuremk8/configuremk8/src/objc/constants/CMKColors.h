//
//  CMKColors.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/7/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMKColors : NSObject


+ (UIColor *)blueColor;
+ (UIColor *)blueHalfTransparentColor;
+ (UIColor *)redColor;
+ (UIColor *)darkRedColor;
+ (UIColor *)whiteColor;
+ (UIColor *)lightGrayColor;
+ (UIColor *)grayColor;
+ (UIColor *)darkGrayColor;

+ (UIColor *)tabBarBackgroundColor;
+ (UIColor *)tabBarTextColor;

+ (UIColor *)colorWithHexString:(NSString *)hexString;

+ (CGFloat)colorValueFrom:(NSString *)string
                    start:(NSUInteger)start
                   length:(NSUInteger)length;

@end
