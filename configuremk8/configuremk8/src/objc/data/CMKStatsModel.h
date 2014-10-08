//
//  CMKStats.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/13/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSInteger, CMKAttribute) {
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

@property (nonatomic) float acceleration;
@property (nonatomic) float averageSpeed;
@property (nonatomic) float groundSpeed;
@property (nonatomic) float antigravitySpeed;
@property (nonatomic) float airSpeed;
@property (nonatomic) float waterSpeed;
@property (nonatomic) float miniturbo;
@property (nonatomic) float averageHandling;
@property (nonatomic) float groundHandling;
@property (nonatomic) float antigravityHandling;
@property (nonatomic) float airHandling;
@property (nonatomic) float waterHandling;
@property (nonatomic) float traction;
@property (nonatomic) float weight;

- (CMKStatsModel *)initWithAcceleration:(float)acceleration
                       withAverageSpeed:(float)averageSpeed
                    withAverageHandling:(float)averageHandling
                          withMiniturbo:(float)miniturbo
                           withTraction:(float)traction
                             withWeight:(float)weight;

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
                             withWeight:(float)weight;

+ (NSString *)nameForIndex:(NSNumber *)attributeIndex;

- (float)statValueForIndex:(NSNumber *)attributeIndex;

+ (NSArray *)      attributeKeys;

+ (NSArray *)      simpleAttributes;

+ (NSArray *)      advancedAttributes;

+ (NSArray *)      allAttributesInOrder;

@end
