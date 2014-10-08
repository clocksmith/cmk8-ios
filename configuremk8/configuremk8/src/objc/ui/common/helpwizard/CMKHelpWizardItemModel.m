//
//  CMKHelpWizardItemView.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/31/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKHelpWizardItemModel.h"

@implementation CMKHelpWizardItemModel

- (instancetype)initWithView:(UIView *)viewToHighlight withHelpMessage:(NSString *)helpMessage {
  self = [super init];
  self.viewToHighlight = viewToHighlight;
  self.helpMessage = helpMessage;
  return self;
}

@end
