//
//  CMKStats.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/13/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, CMKAttribute) {
  Acceleration,
  AverageSpeed,
  GroundSpeed,
  AntigravitySpeed,
  AirSpeed,
  WaterSpeed,
  AverageHandling,
  GroundHandling,
  AntigravityHandling,
  AirHandling,
  WaterHandling,
  Miniturbo,
  Traction,
  Weight,
};

@interface CMKStatsModel : NSObject

@property(nonatomic) double acceleration;
@property(nonatomic) double averageSpeed;
@property(nonatomic) double groundSpeed;
@property(nonatomic) double antigravitySpeed;
@property(nonatomic) double airSpeed;
@property(nonatomic) double waterSpeed;
@property(nonatomic) double miniturbo;
@property(nonatomic) double averageHandling;
@property(nonatomic) double groundHandling;
@property(nonatomic) double antigravityHandling;
@property(nonatomic) double airHandling;
@property(nonatomic) double waterHandling;
@property(nonatomic) double traction;
@property(nonatomic) double weight;

- (CMKStatsModel *)initWithAcceleration:(double)acceleration
                       withAverageSpeed:(double)averageSpeed
                    withAverageHandling:(double)averageHandling
                          withMiniturbo:(double)miniturbo
                           withTraction:(double)traction
                             withWeight:(double)weight;

- (CMKStatsModel *)initWithAcceleration:(double)acceleration
                        withGroundSpeed:(double)groundSpeed
                   withAntigravitySpeed:(double)antigravitySpeed
                           withAirSpeed:(double)airSpeed
                         withWaterSpeed:(double)waterSpeed
                          withMiniturbo:(double)miniturbo
                     withGroundHandling:(double)groundHandling
                withAntigravityHandling:(double)antigravityHandling
                        withAirHandling:(double)airHandling
                      withWaterHandling:(double)waterHandling
                           withTraction:(double)traction
                             withWeight:(double)weight;

+ (NSString *)displayNameForIndex:(NSNumber *)attributeIndex;

- (double)statValueForIndex:(NSNumber *)attributeIndex;

+ (NSArray *)attributeKeys;

+ (NSArray *)simpleAttributes;

+ (NSArray *)advancedAttributes;

+ (NSArray *)allAttributesInOrder;

@end
