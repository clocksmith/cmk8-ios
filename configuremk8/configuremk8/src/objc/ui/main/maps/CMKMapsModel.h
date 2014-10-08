//
//  CMKMapsModel.h
//  configuremk8
//
//  Created by Anthony Robledo on 9/9/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMKMapsModel : NSObject

@property (nonatomic) int courseIndex;

- (instancetype)init;

- (instancetype)initWithCourseIndex:(int)courseIndex;

@end
