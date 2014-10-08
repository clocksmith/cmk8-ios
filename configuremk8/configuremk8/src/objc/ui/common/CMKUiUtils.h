//
//  CMKUiUtils.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/10/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMKUiUtils : NSObject

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;

+ (void)addRoundedCornersToView:(UIView *)view
                    withCorners:(UIRectCorner)corners
                     withRadius:(float)radius;

+ (CALayer *)maskForRoundedCorners:(UIView *)view
                       withCorners:(UIRectCorner)corners
                        withRadius:(float)radius;

+ (UIImage *)imageWithView:(UIView *)view;

@end
