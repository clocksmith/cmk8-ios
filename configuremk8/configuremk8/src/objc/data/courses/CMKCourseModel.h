//
//  CMKCourseModel.h
//  configuremk8
//
//  Created by Anthony Robledo on 9/9/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMKSpinnerView.h"

@interface CMKCourseModel : NSObject <CMKSpinnerItem>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *displayName;
@property (nonatomic, copy) NSString *iconImageName;
@property (nonatomic, copy) NSString *mapImageName;
@property (nonatomic) int courseIndex;

- (instancetype)initWithName:(NSString *)name
             withDisplayName:displayName
           withIconImageName:iconImageName
            withMapImageName:(NSString *)mapImageName
             withCourseIndex:(int)courseIndex;

@end
