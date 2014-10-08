//
//  CMKComparePlaceholderView.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/27/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKComparePlaceholderView.h"

@interface CMKComparePlaceholderView ()

@property (nonatomic, weak) IBOutlet UILabel *message;

@end

@implementation CMKComparePlaceholderView

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];

  if (self) {
    [self internalInit];
  }

  return self;
}

- (void)awakeFromNib {
  [self internalInit];
}

- (void)internalInit {
  self.message.text = NSLocalizedString(@"ComparePlaceholderMessage", nil);
}

@end
