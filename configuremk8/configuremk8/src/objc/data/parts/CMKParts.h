//
//  CMKParts.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/13/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMKPartModel.h"
#import "CMKPartGroupModel.h"

@interface CMKParts : NSObject

// Flyweights.
+ (CMKPartModel *)     babyMario;
+ (CMKPartModel *)     babyLuigi;
+ (CMKPartModel *)     babyPeach;
+ (CMKPartModel *)     babyDaisy;
+ (CMKPartModel *)     babyRosalina;
+ (CMKPartModel *)     lemmy;

// Featherweights.
+ (CMKPartModel *)     toad;
+ (CMKPartModel *)     koopaTroopa;
+ (CMKPartModel *)     shyGuy;
+ (CMKPartModel *)     lakitu;
+ (CMKPartModel *)     toadette;
+ (CMKPartModel *)     larry;
+ (CMKPartModel *)     wendy;

// Lightweights.
+ (CMKPartModel *)     peach;
+ (CMKPartModel *)     daisy;
+ (CMKPartModel *)     yoshi;

// Middleweights.
+ (CMKPartModel *)     mario;
+ (CMKPartModel *)     luigi;
+ (CMKPartModel *)     iggy;
+ (CMKPartModel *)     ludwig;

// Cruiserweights.
+ (CMKPartModel *)     donkeyKong;
+ (CMKPartModel *)     waluigi;
+ (CMKPartModel *)     rosalina;
+ (CMKPartModel *)     roy;

// Metalweights.
+ (CMKPartModel *)     metalMario;
+ (CMKPartModel *)     pinkGoldPeach;

// Heavyweights.
+ (CMKPartModel *)     bowser;
+ (CMKPartModel *)     wario;
+ (CMKPartModel *)     morton;

// Character groups.
+ (CMKPartGroupModel *)flyweight;
+ (CMKPartGroupModel *)featherweight;
+ (CMKPartGroupModel *)lightweight;
+ (CMKPartGroupModel *)middleweight;
+ (CMKPartGroupModel *)cruiserweight;
+ (CMKPartGroupModel *)metalweight;
+ (CMKPartGroupModel *)heavyweight;

// Vehicle class A.
+ (CMKPartModel *)     standardKart;
+ (CMKPartModel *)     catCruiser;
+ (CMKPartModel *)     prancer;
+ (CMKPartModel *)     sneeker;
+ (CMKPartModel *)     theDuke;
+ (CMKPartModel *)     teddyBuggy;
+ (CMKPartModel *)     threeHundredSlRoadster;

// Vehicle class B.
+ (CMKPartModel *)     pipeFrame;
+ (CMKPartModel *)     standardBike;
+ (CMKPartModel *)     flameRider;
+ (CMKPartModel *)     varmint;
+ (CMKPartModel *)     wildWiggler;
+ (CMKPartModel *)     w25SilverArrow;

// Vehicle class C.
+ (CMKPartModel *)     mach8;
+ (CMKPartModel *)     circuitSpecial;
+ (CMKPartModel *)     sportsCoupe;
+ (CMKPartModel *)     goldStandard;

// Vehicle class D.
+ (CMKPartModel *)     steelDriver;
+ (CMKPartModel *)     triSpeeder;
+ (CMKPartModel *)     badwagon;
+ (CMKPartModel *)     standardAtv;
+ (CMKPartModel *)     gla;

// Vehicle class E.
+ (CMKPartModel *)     biddybuggy;
+ (CMKPartModel *)     landship;
+ (CMKPartModel *)     mrScooty;

// Vehicle class F.
+ (CMKPartModel *)     comet;
+ (CMKPartModel *)     sportsBike;
+ (CMKPartModel *)     jetBike;
+ (CMKPartModel *)     yoshiBike;

// Vehicle groups.
+ (CMKPartGroupModel *)vehicleA;
+ (CMKPartGroupModel *)vehicleB;
+ (CMKPartGroupModel *)vehicleC;
+ (CMKPartGroupModel *)vehicleD;
+ (CMKPartGroupModel *)vehicleE;
+ (CMKPartGroupModel *)vehicleF;

// Tire class A.
+ (CMKPartModel *)     standard;
+ (CMKPartModel *)     offRoad;
+ (CMKPartModel *)     blueStandard;
+ (CMKPartModel *)     retroOffRoad;
+ (CMKPartModel *)     glaTires;

// Tire class B.
+ (CMKPartModel *)     monster;
+ (CMKPartModel *)     hotMonster;

// Tire class C.
+ (CMKPartModel *)     roller;
+ (CMKPartModel *)     button;
+ (CMKPartModel *)     azureRoller;

// Tire class D.
+ (CMKPartModel *)     slim;
+ (CMKPartModel *)     crimsonSlim;

// Tire class E.
+ (CMKPartModel *)     slick;
+ (CMKPartModel *)     cyberSlick;

// Tire class F.
+ (CMKPartModel *)     metal;
+ (CMKPartModel *)     goldTires;

// Tire class G.
+ (CMKPartModel *)     sponge;
+ (CMKPartModel *)     wood;
+ (CMKPartModel *)     cushion;

// Tire groups.
+ (CMKPartGroupModel *)tireA;
+ (CMKPartGroupModel *)tireB;
+ (CMKPartGroupModel *)tireC;
+ (CMKPartGroupModel *)tireD;
+ (CMKPartGroupModel *)tireE;
+ (CMKPartGroupModel *)tireF;
+ (CMKPartGroupModel *)tireG;

// Glider class A.
+ (CMKPartModel *)     superGlider;
+ (CMKPartModel *)     warioWing;
+ (CMKPartModel *)     waddleWing;
+ (CMKPartModel *)     planeGlider;
+ (CMKPartModel *)     goldGlider;

// Glider class B.
+ (CMKPartModel *)     cloudGlider;
+ (CMKPartModel *)     peachParasol;
+ (CMKPartModel *)     parachute;
+ (CMKPartModel *)     parafoil;
+ (CMKPartModel *)     flowerGlider;
+ (CMKPartModel *)     bowserKite;
+ (CMKPartModel *)     mktvParafoil;

// Glider groups.
+ (CMKPartGroupModel *)gliderA;
+ (CMKPartGroupModel *)gliderB;

// Groups.
+ (NSArray *)          characterGroups;
+ (NSArray *)          vehicleGroups;
+ (NSArray *)          tireGroups;
+ (NSArray *)          gliderGroups;

// All kart configurations.
+ (NSArray *)          allKartConfigurations;

@end
