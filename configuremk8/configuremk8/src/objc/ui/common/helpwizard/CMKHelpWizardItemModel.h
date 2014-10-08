//
//  CMKHelpWizardItemView.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/31/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMKHelpWizardItemModel : NSObject

@property (nonatomic, strong) UIView *viewToHighlight;
@property (nonatomic, copy) NSString *helpMessage;

- (instancetype)initWithView:(UIView *)viewToHighlight withHelpMessage:(NSString *)helpMessage;

@end
