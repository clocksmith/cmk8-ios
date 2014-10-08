//
//  CMKVerticalPartGroupView.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/25/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMKPartImageView.h"

@interface CMKVerticalPartGroupView : UIView

- (instancetype)initWithFrame:(CGRect)frame
                    withGroup:(CMKPartGroupModel *)partGroup
    withPartImageViewDelegate:(id <CMKPartImageViewDelegate> )delegate;

@end
