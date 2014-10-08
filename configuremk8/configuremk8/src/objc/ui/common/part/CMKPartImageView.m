//
//  CMKPartImageView.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/25/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKPartImageView.h"
#import "CMKPartModel.h"

#define _TAG (NSStringFromClass([CMKPartImageView class]))

@implementation CMKPartImageView {
  CMKPartModel *_part;
}

- (id)initWithFrame:(CGRect)frame withPart:(CMKPartModel *)part {
  self = [super initWithFrame:frame];

  if (self) {
    _part = part;
    self.image = [UIImage imageNamed:[part imageName]];
    self.contentMode = UIViewContentModeScaleAspectFit;
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc]
                                initWithTarget:self
                                        action:@selector(handlePartTapped:)]];
  }

  return self;
}

- (void)handlePartTapped:(UITapGestureRecognizer *)tapGestureRecognizer {
  id <CMKPartImageViewDelegate> strongDelegate = self.delegate;

  if (strongDelegate &&
      [strongDelegate respondsToSelector:@selector(partImageView:didTapPart:)]) {
    [strongDelegate partImageView:self didTapPart:_part];
  }
}

@end
