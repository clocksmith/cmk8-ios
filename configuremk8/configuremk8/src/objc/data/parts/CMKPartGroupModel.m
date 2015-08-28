//
//  CMKPartGroup.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/13/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKConstants.h"
#import "CMKPartGroupModel.h"
#import "CMKPartData.h"
#import "CMKPartType.h"

@interface CMKPartGroupModel ()

@end

@implementation CMKPartGroupModel

static NSDictionary *_characterNameValues;

- (CMKPartGroupModel *)initWithType:(CMKPartType)theType
                           withName:(NSString *)theName
                          withStats:(CMKStatsModel *)theStats
                          withParts:(NSArray *)theParts
                          withIndex:(int)theIndex {
  self = [super init];

  if (self) {
    self.type = theType;
    self.name = theName;
    self.stats = theStats;
    self.parts = theParts;
    self.index = theIndex;

    NSString *name = self.name;
    CMKPartType type = self.type;
    switch (type) {
      case Character: {
        NSString *firstLetter = [NSString stringWithString:[name substringToIndex:1]];
        NSString *restOfLetters = [NSString stringWithString:[[name substringFromIndex:1] lowercaseString]];
        NSString *localizedStringKey = [NSString stringWithFormat:@"%@%@", firstLetter, restOfLetters];
        self.displayName = NSLocalizedString(localizedStringKey, nil);
        break;
      }

      case Vehicle:
        self.displayName = [NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"Vehicle", nil), name];
        break;

      case Tire:
        self.displayName = [NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"Tire", nil), name];
        break;

      case Glider:
        self.displayName = [NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"Glider", nil), name];
        break;
    }
  }

  return self;
}

- (NSComparisonResult)compare:(CMKPartGroupModel *)otherObject {
  if (self.type == Character) {
    long lhs = [[CMKPartData characterGroups] indexOfKey:self.name];
    long rhs = [[CMKPartData characterGroups] indexOfKey:otherObject.name];

    if (lhs < rhs) {
      return NSOrderedAscending;
    } else if (lhs > rhs) {
      return NSOrderedDescending;
    } else {
      return NSOrderedSame;
    }
  } else {
    return [self.name compare:otherObject.name];
  }
}

@end
