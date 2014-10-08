//
//  CMKStarView.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/18/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKStarView.h"

#define _TAG (NSStringFromClass([CMKStarView class]))

@interface CMKStarView ()

- (void)internalInit;

@end

@implementation CMKStarView {
  UIImageView *_starImageView;
  UIImage *_filledStarImage;
  UIImage *_hollowStarImage;
}

static const int _IMAGE_PADDING = 6;

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
//  NSLog(@"%@ internalInit", _TAG);
  _filledStarImage = [UIImage imageNamed:@"filled_star"];
  _hollowStarImage = [UIImage imageNamed:@"hollow_star_b0b0b0"];

  _starImageView = [[UIImageView alloc] initWithImage:_hollowStarImage];
  _starImageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
  _starImageView.bounds = CGRectInset(_starImageView.frame, _IMAGE_PADDING, _IMAGE_PADDING);
  _starImageView.contentMode = UIViewContentModeScaleAspectFit;
  [self addSubview:_starImageView];
}

- (void)updateFill:(BOOL)filled {
//  NSLog(@"%@ updateFill:filled = %hhd", _TAG, filled);
  _starImageView.image = filled ? _filledStarImage : _hollowStarImage;
}

@end
