//
//  CMKAdjustConfigurationSpinnerItem.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/29/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMKSpinnerView.h"
#import "CMKAdjustConfigurations.h"

@interface CMKAdjustConfigurationSpinnerItem : NSObject <CMKSpinnerItem>

@property (nonatomic) CMKAdjustConfiguration adjustConfiguration;

- (instancetype)initWithAdjustConfiguration:(CMKAdjustConfiguration)adjustConfiguration;

@end
