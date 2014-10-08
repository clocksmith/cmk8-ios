//
//  CMKVerticalPartGroupView.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/25/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKConstants.h"
#import "CMKPartGroupModel.h"
#import "CMKPartImageView.h"
#import "CMKVerticalPartGroupView.h"

#define _TAG (NSStringFromClass([CMKVerticalPartGroupView class]))

@interface CMKVerticalPartGroupView ()

@property (nonatomic, weak) id <CMKPartImageViewDelegate> delegate;

@end

@implementation CMKVerticalPartGroupView

- (instancetype)initWithFrame:(CGRect)frame
                    withGroup:(CMKPartGroupModel *)partGroup
    withPartImageViewDelegate:(id <CMKPartImageViewDelegate> )delegate {
  self = [super initWithFrame:frame];

  if (self) {
    self.delegate = delegate;
    float width = self.frame.size.width;
    float partImageViewDimen = MIN(width, self.frame.size.height / MAX_NUM_PARTS_PER_GROUP);
    int x = width >= partImageViewDimen ? (width - partImageViewDimen) / 2 : 0;

    int partIndex = 0;

    for (CMKPartModel *part in partGroup.parts) {
      CGRect partImageFrame =
        CGRectMake(x,
                   partIndex * partImageViewDimen,
                   partImageViewDimen,
                   partImageViewDimen);
      CMKPartImageView *partImageView = [[CMKPartImageView alloc] initWithFrame:partImageFrame
                                                                       withPart:part];
      partImageView.delegate = self.delegate;
      [self addSubview:partImageView];
      partIndex++;
    }
  }

  return self;
}

@end
