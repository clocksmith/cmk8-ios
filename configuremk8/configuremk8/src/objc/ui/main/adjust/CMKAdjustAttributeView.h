//
//  CMKAdjustAttributeView.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/27/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMKStatsModel.h"

@protocol CMKAdjustAttributeViewDelegate <NSObject>

@required

- (void)didChangeSliderValue;

@end

@interface CMKAdjustAttributeView : UIView

@property (nonatomic, weak) id<CMKAdjustAttributeViewDelegate> delegate;

- (void)updateAttribute:(CMKAttribute)attribute;

- (void)updateAttributeValue:(float)value;

- (float)attributeValue;

@end
