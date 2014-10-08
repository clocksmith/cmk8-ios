//
//  CMKAdjustButtonView.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/27/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMKCircleWithTextView : UIControl

- (void)updateBackgroundColor:(UIColor *)backgroundColor;

- (void)updateTextColor:(UIColor *)textColor;

- (void)updateText:(NSString *)text;

- (void)updateFont:(UIFont *)font;

- (void)updateSubtractFromRadius:(float)subtractFromRadius;

- (void)updateShadow:(BOOL)hasShadow;

@end
