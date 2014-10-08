//
//  CMKStats.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/13/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKConstants.h"
#import "CMKStatsModel.h"

@implementation CMKStatsModel

static NSDictionary *_attributeKeys;
static NSDictionary *_attributeNames;

+ (void)initialize {
  // Need to do if we call initialize directly.
  static BOOL initialized = NO;

  if (!initialized) {
    initialized = YES;

    _attributeKeys = @{ [NSNumber numberWithInt:Acceleration]: @"acceleration",
                        [NSNumber numberWithInt:AverageSpeed]: @"averageSpeed",
                        [NSNumber numberWithInt:GroundSpeed]: @"groundSpeed",
                        [NSNumber numberWithInt:AntigravitySpeed]: @"antigravitySpeed",
                        [NSNumber numberWithInt:AirSpeed]: @"airSpeed",
                        [NSNumber numberWithInt:WaterSpeed]: @"waterSpeed",
                        [NSNumber numberWithInt:AverageHandling]: @"averageHandling",
                        [NSNumber numberWithInt:GroundHandling]: @"groundHandling",
                        [NSNumber numberWithInt:AntigravityHandling]: @"antigravityHandling",
                        [NSNumber numberWithInt:AirHandling]: @"airHandling",
                        [NSNumber numberWithInt:WaterHandling]: @"waterHandling",
                        [NSNumber numberWithInt:Miniturbo]: @"miniturbo",
                        [NSNumber numberWithInt:Traction]: @"traction",
                        [NSNumber numberWithInt:Weight]: @"weight" };

    _attributeNames = @{ [NSNumber numberWithInt:Acceleration]: ACCELERATION_STRING,
                         [NSNumber numberWithInt:AverageSpeed]: AVERAGE_SPEED_STRING,
                         [NSNumber numberWithInt:GroundSpeed]: GROUND_SPEED_STRING,
                         [NSNumber numberWithInt:AntigravitySpeed]: ANTIGRAVITY_SPEED_STRING,
                         [NSNumber numberWithInt:AirSpeed]: AIR_SPEED_STRING,
                         [NSNumber numberWithInt:WaterSpeed]: WATER_SPEED_STRING,
                         [NSNumber numberWithInt:AverageHandling]: AVERAGE_HANDLING_STRING,
                         [NSNumber numberWithInt:GroundHandling]: GROUND_HANDLING_STRING,
                         [NSNumber numberWithInt:AntigravityHandling]: ANTIGRAVITY_HANDLING_STRING,
                         [NSNumber numberWithInt:AirHandling]: AIR_HANDLING_STRING,
                         [NSNumber numberWithInt:WaterHandling]: WATER_HANDLING_STRING,
                         [NSNumber numberWithInt:Miniturbo]: MINITURBO_STRING,
                         [NSNumber numberWithInt:Traction]: TRACTION_STRING,
                         [NSNumber numberWithInt:Weight]: WEIGHT_STRING };
  }
}

- (CMKStatsModel *)initWithAcceleration:(float)acceleration
                       withAverageSpeed:(float)averageSpeed
                    withAverageHandling:(float)averageHandling
                          withMiniturbo:(float)miniturbo
                           withTraction:(float)traction
                             withWeight:(float)weight {
  self = [super init];

  if (self) {
    self.acceleration = acceleration;
    self.averageSpeed = averageSpeed;
    self.groundSpeed = averageSpeed;
    self.antigravitySpeed = averageSpeed;
    self.airSpeed = averageSpeed;
    self.waterSpeed = averageSpeed;
    self.averageHandling = averageHandling;
    self.groundHandling = averageHandling;
    self.antigravityHandling = averageHandling;
    self.airHandling = averageHandling;
    self.waterHandling = averageHandling;
    self.miniturbo = miniturbo;
    self.traction = traction;
    self.weight = weight;
  }

  return self;
}

- (CMKStatsModel *)initWithAcceleration:(float)acceleration
                        withGroundSpeed:(float)groundSpeed
                   withAntigravitySpeed:(float)antigravitySpeed
                           withAirSpeed:(float)airSpeed
                         withWaterSpeed:(float)waterSpeed
                          withMiniturbo:(float)miniturbo
                     withGroundHandling:(float)groundHandling
                withAntigravityHandling:(float)antigravityHandling
                        withAirHandling:(float)airHandling
                      withWaterHandling:(float)waterHandling
                           withTraction:(float)traction
                             withWeight:(float)weight {
  self = [super init];

  if (self) {
    self.acceleration = acceleration;
    self.averageSpeed = (groundSpeed + antigravitySpeed + airSpeed + waterSpeed) / 4;
    self.groundSpeed = groundSpeed;
    self.antigravitySpeed = antigravitySpeed;
    self.airSpeed = airSpeed;
    self.waterSpeed = waterSpeed;
    self.miniturbo = miniturbo;
    self.averageHandling = (groundHandling + antigravityHandling + airHandling + waterHandling) / 4;
    self.groundHandling = groundHandling;
    self.antigravityHandling = antigravityHandling;
    self.airHandling = airHandling;
    self.waterHandling = waterHandling;
    self.traction = traction;
    self.weight = weight;
  }

  return self;
}

+ (NSString *)nameForIndex:(NSNumber *)attributeIndex {
  return NSLocalizedString(_attributeNames[attributeIndex], nil);
}

- (float)statValueForIndex:(NSNumber *)attributeIndex {
  return [[self valueForKey:[_attributeKeys objectForKey:attributeIndex]] floatValue];
}

+ (NSArray *)attributeKeys {
  return [_attributeKeys allValues];
}

+ (NSArray *)simpleAttributes {
  return @[[NSNumber numberWithInteger:Acceleration],
           [NSNumber numberWithInteger:AverageSpeed],
           [NSNumber numberWithInteger:AverageHandling],
           [NSNumber numberWithInteger:Miniturbo],
           [NSNumber numberWithInteger:Traction],
           [NSNumber numberWithInteger:Weight]];
}

+ (NSArray *)advancedAttributes {
  return @[[NSNumber numberWithInteger:GroundSpeed],
           [NSNumber numberWithInteger:AntigravitySpeed],
           [NSNumber numberWithInteger:AirSpeed],
           [NSNumber numberWithInteger:WaterSpeed],
           [NSNumber numberWithInteger:GroundHandling],
           [NSNumber numberWithInteger:AntigravityHandling],
           [NSNumber numberWithInteger:AirHandling],
           [NSNumber numberWithInteger:WaterHandling]];
}

+ (NSArray *)allAttributesInOrder {
  return [[self simpleAttributes] arrayByAddingObjectsFromArray:[self advancedAttributes]];
}

- (NSString *)description {
  NSString *newDescription = @"";

  for (NSNumber *attributeIndex in[CMKStatsModel allAttributesInOrder]) {
    newDescription = [newDescription stringByAppendingString:
                      [CMKStatsModel nameForIndex:attributeIndex]];
    newDescription = [newDescription stringByAppendingString:@":"];
    newDescription = [newDescription stringByAppendingString:
                      [NSString stringWithFormat:@"%f",
                       [self statValueForIndex:attributeIndex]]];
    newDescription = [newDescription stringByAppendingString:@", "];
  }

  return [NSString stringWithFormat:@"%@ *** %@", [super description], newDescription];
}

@end
