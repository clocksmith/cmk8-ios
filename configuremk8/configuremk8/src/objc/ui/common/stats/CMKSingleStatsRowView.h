//
//  CMKSingleStatsRowView.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/20/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMKSingleStatsRowView : UIView

@property (nonatomic, weak) IBOutlet UILabel *attributeLabel;
@property (nonatomic) float attributeValue;

- (void)updateAttributeValue:(float)attributeValue isAnimated:(BOOL)animated;

@end
