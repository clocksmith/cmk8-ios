//
//  CMKKartConfigurationView.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/25/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMKPartImageView.h"
#import "CMKKartConfigurationModel.h"

@interface CMKKartConfigurationView : UIView

@property (nonatomic, weak) id<CMKPartImageViewDelegate> delegate;

- (void)update:(CMKKartConfigurationModel *)kartConfiguration isAnimated:(BOOL)animated;

@end
