//
//  CMKPartGroupView.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/14/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKConstants.h"
#import "CMKColors.h"
#import "CMKPartModel.h"
#import "CMKPartGroupModel.h"
#import "CMKPartGroupView.h"
#import "CMKPartImageView.h"
#import "CMKUiUtils.h"

#define _TAG (NSStringFromClass([CMKPartGroupView class]))

@interface CMKPartGroupView ()

@property(nonatomic, weak) id<CMKPartImageViewDelegate> delegate;

- (void)fillRow:(UIView *)row withParts:(NSArray *)parts;

@end

@implementation CMKPartGroupView

static const int _MIN_PARTS_FOR_DOUBLE_ROW = 4;
static const int _MAX_PARTS_PER_ROW = 4;

- (instancetype)initWithFrame:(CGRect)frame
                    withGroup:(CMKPartGroupModel *)partGroup
    withPartImageViewDelegate:(id<CMKPartImageViewDelegate>)delegate {
  self = [super initWithFrame:frame];

  if (self) {
    self.delegate = delegate;
    long partCount = [partGroup parts].count;

    int frameWidth = self.frame.size.width;
    int frameHeight = self.frame.size.height;
    int bothRowsHeight = frameHeight - PART_GROUP_VIEW_TITLE_HEIGHT;

    CGRect titleFrame = CGRectMake(0, 0, frameWidth, PART_GROUP_VIEW_TITLE_HEIGHT);
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:titleFrame];
    NSLog(@"%@ %@", _TAG, partGroup);
    NSLog(@"LOLOLOLOLLOOLLOLOLOLOLO");
    if ([partGroup isMemberOfClass:[CMKPartGroupModel class]]) {
      NSLog(@"%@ YES IT IS THE CORRECT CLASS!", _TAG);
    }
    titleLabel.text = partGroup.displayName;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont fontWithName:HELVETICA_NEUE_LIGHT_FONT size:DEFAULT_FONT_SIZE_IPHONE];
    [self addSubview:titleLabel];

    CGRect topRowFrame =
        CGRectMake(0, PART_GROUP_VIEW_TITLE_HEIGHT + (partCount < _MIN_PARTS_FOR_DOUBLE_ROW ? bothRowsHeight / 4 : 0),
                   frameWidth, bothRowsHeight / 2);
    UIView *topRow = [[UIView alloc] initWithFrame:topRowFrame];
    [self addSubview:topRow];

    if (partCount < _MIN_PARTS_FOR_DOUBLE_ROW) {
      [self fillRow:topRow withParts:partGroup.parts];
    } else {
      int topRowCount = (int)ceil((float)partCount / 2);
      int bottomRowCount = partCount - topRowCount;

      NSArray *topRowParts = [partGroup.parts subarrayWithRange:NSMakeRange(0, topRowCount)];
      NSArray *bottomRowParts = [partGroup.parts subarrayWithRange:NSMakeRange(topRowCount, bottomRowCount)];

      [self fillRow:topRow withParts:topRowParts];

      CGRect bottomRowFrame =
          CGRectMake(0, PART_GROUP_VIEW_TITLE_HEIGHT + bothRowsHeight / 2, frameWidth, bothRowsHeight / 2);
      UIView *bottomRow = [[UIView alloc] initWithFrame:bottomRowFrame];
      [self fillRow:bottomRow withParts:bottomRowParts];
      [self addSubview:bottomRow];
    }
  }

  return self;
}

- (void)fillRow:(UIView *)row withParts:(NSArray *)parts {
  int partImageFrameWidth = row.frame.size.width / _MAX_PARTS_PER_ROW;
  int partImageFrameHeight = row.frame.size.height;

  int partIndex = 0;

  for (CMKPartModel *part in parts) {
    long partsCount = [parts count];
    int deltaX = row.frame.size.width / partsCount;
    CGRect partImageFrame =
        CGRectMake(partIndex * deltaX + (partsCount == _MAX_PARTS_PER_ROW ? 0 : (deltaX / [parts count] / 2)), 0,
                   partImageFrameWidth, partImageFrameHeight);
    CMKPartImageView *partImageView = [[CMKPartImageView alloc] initWithFrame:partImageFrame withPart:part];
    partImageView.delegate = self.delegate;
    [row addSubview:partImageView];
    partIndex++;
  }
}

@end
