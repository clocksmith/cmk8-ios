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
          withPartGroupIndex:(int)partGroupIndex {
  self = [super init];

  if (self) {
    self.name = name;
    self.displayName = partType == Character ? NSLocalizedString(name, nil) : name;
    self.imageName =
        [NSString stringWithFormat:@"wiiu_%@_%@", [CMKPartData nameForPartType:partType], [name lowercaseString]];
    self.partType = partType;
    self.partGroupIndex = partGroupIndex;
  }

  return self;
}

@end
