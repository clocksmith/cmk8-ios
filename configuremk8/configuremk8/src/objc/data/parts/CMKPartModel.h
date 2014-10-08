//
//  CMKPart.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/13/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CMKPartGroupModel;

@interface CMKPartModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *displayName;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, strong) CMKPartGroupModel *partGroup;

- (instancetype)initWithName:(NSString *)name
             withDisplayName:(NSString *)displayName
               withImageName:(NSString *)imageName
               withPartGroup:(CMKPartGroupModel *)partGroup;

@end
