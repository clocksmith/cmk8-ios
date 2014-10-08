//
//  CMKPart.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/13/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKPartModel.h"

@implementation CMKPartModel

- (instancetype)initWithName:(NSString *)name
             withDisplayName:(NSString *)displayName
               withImageName:(NSString *)imageName
               withPartGroup:(CMKPartGroupModel *)partGroup {
  self = [super init];

  if (self) {
    self.name = name;
    self.displayName = displayName;
    self.imageName = imageName;
    self.partGroup = partGroup;
  }

  return self;
}

@end
