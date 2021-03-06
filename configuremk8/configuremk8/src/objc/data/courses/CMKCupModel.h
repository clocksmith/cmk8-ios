//
//  CMKCup.h
//  configuremk8
//
//  Created by Anthony Robledo on 9/9/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMKSpinnerView.h"

@interface CMKCupModel : NSObject<CMKSpinnerItem>

@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *displayName;
@property(nonatomic, copy) NSString *iconImageName;
@property(nonatomic, strong) NSArray *courses;

- (instancetype)initWithName:(NSString *)theName withCourses:(NSArray *)courses;

@end
