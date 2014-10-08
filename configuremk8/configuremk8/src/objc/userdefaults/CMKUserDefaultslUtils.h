//
//  CMKLastUsedModelUtils.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/26/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMKAdjustModel.h"
#import "CMKCompareModel.h"
#import "CMKConfigureModel.h"
#import "CMKMapsModel.h"

@interface CMKUserDefaultslUtils : NSObject

+ (void)saveAdjustModel:(CMKAdjustModel *)adjustModel;

+ (CMKAdjustModel *)   loadAdjustModel;

+ (void)saveConfigureModel:(CMKConfigureModel *)configureModel;

+ (CMKConfigureModel *)loadConfigureModel;

+ (void)saveCompareModel:(CMKCompareModel *)compareModel;

+ (CMKCompareModel *)  loadCompareModel;

+ (void)saveMapsModel:(CMKMapsModel *)mapsModel;

+ (CMKMapsModel *)     loadMapsModel;


+ (BOOL)               hasConfigureHelpWizardLoaded;

+ (void)               configureHelpWizardDidLoad;

@end
