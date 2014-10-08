//
//  CMKNewCustomConfigurationSpinnerItem.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/27/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMKSpinnerView.h"

@interface CMKCustomSpinnerItem : NSObject <CMKSpinnerItem>

- (instancetype)initWithDisplayText:(NSString *)displayText;

@end
