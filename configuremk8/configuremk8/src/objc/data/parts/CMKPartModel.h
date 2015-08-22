//
//  CMKPart.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/13/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMKPartType.h"
#import "CMKPartData.h"

@interface CMKPartModel : NSObject

@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *displayName;
@property(nonatomic, copy) NSString *imageName;
@property(nonatomic, assign) CMKPartType partType;
@property(nonatomic, assign) int partGroupIndex;

- (instancetype)initWithName:(NSString *)name withPartType:(CMKPartType)partType withPartGroupIndex:(int)partGroupIndex;

@end
