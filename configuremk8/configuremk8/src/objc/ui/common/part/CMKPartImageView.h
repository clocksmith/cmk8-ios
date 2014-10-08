//
//  CMKPartImageView.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/25/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMKPartModel.h"

@class CMKPartImageView;

@protocol CMKPartImageViewDelegate <NSObject>

@required

- (void)partImageView:(CMKPartImageView *)partImageView didTapPart:(CMKPartModel *)part;

@end

@interface CMKPartImageView : UIImageView

@property (nonatomic, weak) id <CMKPartImageViewDelegate> delegate;

- (id)initWithFrame:(CGRect)frame withPart:(CMKPartModel *)part;

@end
