//
//  CMKCompareStatsRowView.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/25/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMKCompareStatsRowView : UIView

@property (nonatomic, weak) IBOutlet UILabel *attributeLabel;

- (void)updateWithLeftAttributeValue:(float)leftAttributeValue
             withRightAttributeValue:(float)rightAttributeValue
                          isAnimated:(BOOL)animated;

@end
