//
//  CMKConfigureModel.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/18/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CMKKartConfigurationModel;

@interface CMKConfigureModel : NSObject

@property (nonatomic, strong) CMKKartConfigurationModel *kartConfiguration;

- (instancetype)init;

- (instancetype)initWithKartConfiguration:(CMKKartConfigurationModel *)kartConfiguration;

@end
