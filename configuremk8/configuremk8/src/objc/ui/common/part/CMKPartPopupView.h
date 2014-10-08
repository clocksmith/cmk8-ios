//
//  CMKPartPopup.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/20/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMKPartModel.h"

@interface CMKPartPopupView : UIView

- (void)updatePart:(CMKPartModel *)part withAnchorImageView:(UIImageView *)imageView;

@end
