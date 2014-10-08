//
//  CMKPartGroup.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/13/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKConstants.h"
#import "CMKPartGroupModel.h"

@interface CMKPartGroupModel () {
  NSString *_displayName;
}

@end

@implementation CMKPartGroupModel

static NSDictionary *_characterNameValues;

+ (void)initialize {
  // Need to do if we call initialize directly.
  static BOOL initialized = NO;

  if (!initialized) {
    initialized = YES;
    _characterNameValues = @{ FLYWEIGHT_NAME_STRING: @0,
                              FEATHERWEIGHT_NAME_STRING: @1,
                              LIGHTWEIGHT_NAME_STRING: @2,
                              MIDDLEWEIGHT_NAME_STRING: @3,
                              CRUISERWEIGHT_NAME_STRING: @4,
                              METALWEIGHT_NAME_STRING: @5,
                              HEAVYWEIGHT_NAME_STRING: @6 };
  }
}

- (CMKPartGroupModel *)initWithType:(CMKPartGroupType)theType
                           withName:(NSString *)theName
                          withStats:(CMKStatsModel *)theStats
                          withParts:(NSArray *)theParts {
  self = [super init];

  if (self) {
    self.type = theType;
    self.name = theName;
    self.stats = theStats;
    self.parts = theParts;
  }

  return self;
}

- (NSString *)displayName {
  if (!_displayName) {
    switch ((CMKPartGroupType)self.type) {
      case Character:

        if ([self.name isEqualToString:FLYWEIGHT_NAME_STRING]) {
          _displayName = NSLocalizedString(FLYWEIGHT_STRING, nil);
        } else if ([self.name isEqualToString:FEATHERWEIGHT_NAME_STRING]) {
          _displayName = NSLocalizedString(FEATHERWEIGHT_STRING, nil);
        } else if ([self.name isEqualToString:LIGHTWEIGHT_NAME_STRING]) {
          _displayName = NSLocalizedString(LIGHTWEIGHT_STRING, nil);
        } else if ([self.name isEqualToString:MIDDLEWEIGHT_NAME_STRING]) {
          _displayName = NSLocalizedString(MIDDLEWEIGHT_STRING, nil);
        } else if ([self.name isEqualToString:CRUISERWEIGHT_NAME_STRING]) {
          _displayName = NSLocalizedString(CRUISERWEIGHT_STRING, nil);
        } else if ([self.name isEqualToString:METALWEIGHT_NAME_STRING]) {
          _displayName = NSLocalizedString(METALWEIGHT_STRING, nil);
        } else if ([self.name isEqualToString:HEAVYWEIGHT_NAME_STRING]) {
          _displayName = NSLocalizedString(HEAVYWEIGHT_STRING, nil);
        }

        break;

      case Vehicle:
        _displayName = [NSString stringWithFormat:@"%@ %@",
                        NSLocalizedString(@"Vehicle", nil),
                        self.name];
        break;

      case Tire:
        _displayName = [NSString stringWithFormat:@"%@ %@",
                        NSLocalizedString(@"Tire", nil),
                        self.name];
        break;

      case Glider:
        _displayName = [NSString stringWithFormat:@"%@ %@",
                        NSLocalizedString(@"Glider", nil),
                        self.name];
        break;

      default:
        break;
    }
  }

  return _displayName;
}

- (NSComparisonResult)compare:(CMKPartGroupModel *)otherObject {
  if (self.type == Character) {
    int lhs = [[_characterNameValues valueForKey:self.name] integerValue];
    int rhs = [[_characterNameValues valueForKey:otherObject.name] integerValue];

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
