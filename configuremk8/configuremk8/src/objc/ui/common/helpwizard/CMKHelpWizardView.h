//
//  CMKHelpWizardView.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/31/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMKHelpWizardView : UIView

- (instancetype)initWithFrame:(CGRect)frame withHelpItems:(NSArray *)helpItems;

- (void)        start;

@end
