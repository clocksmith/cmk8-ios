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
                withPartType:(CMKPartType)partType
          withPartGroupIndex:(int)partGroupIndex
               withImageName:(NSString *)imageName {
  self = [super init];

  if (self) {
    _name = name;
    _displayName = NSLocalizedString(name, nil);
    _imageName = imageName;
    _partType = partType;
    _partGroupIndex = partGroupIndex;
      
  }

  return self;
}

@end
