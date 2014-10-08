//
//  CMKCompareModel.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/19/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMKKartConfigurationModel.h"

@interface CMKCompareModel : NSObject

@property (nonatomic, strong) CMKKartConfigurationModel *leftKartConfiguration;
@property (nonatomic, strong) CMKKartConfigurationModel *rightKartConfiguration;

- (instancetype)initWithLeftKartConfiguration:(CMKKartConfigurationModel *)leftKartConfiguration
               initWithRightKartConfiguration:(CMKKartConfigurationModel *)rightKartConfiguration;

@end
