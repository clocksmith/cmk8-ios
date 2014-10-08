//
//  CMKCourses.h
//  configuremk8
//
//  Created by Anthony Robledo on 9/9/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMKCupModel.h"
#import "CMKCourseModel.h"

@interface CMKCourses : NSObject


// Cups.
+ (CMKCupModel *)   mushroomCup;
+ (CMKCupModel *)   flowerCup;
+ (CMKCupModel *)   starCup;
+ (CMKCupModel *)   specialCup;
+ (CMKCupModel *)   shellCup;
+ (CMKCupModel *)   bananaCup;
+ (CMKCupModel *)   leafCup;
+ (CMKCupModel *)   lightningCup;

// Courses.

// Mushroom Cup.
+ (CMKCourseModel *)marioKartStadium;
+ (CMKCourseModel *)waterPark;
+ (CMKCourseModel *)sweetSweetCanyon;
+ (CMKCourseModel *)thwompRuins;

// Flower Cup.
+ (CMKCourseModel *)marioCircuit;
+ (CMKCourseModel *)toadHarbor;
+ (CMKCourseModel *)twistedMansion;
+ (CMKCourseModel *)shyGuyFalls;

// Star Cup.
+ (CMKCourseModel *)sunshineAirport;
+ (CMKCourseModel *)dolphinShoals;
+ (CMKCourseModel *)electrodrome;
+ (CMKCourseModel *)mountWario;

// Special Cup.
+ (CMKCourseModel *)cloudtopCruise;
+ (CMKCourseModel *)boneDryDunes;
+ (CMKCourseModel *)bowsersCastle;
+ (CMKCourseModel *)rainbowRoad;

// Shell Cup.
+ (CMKCourseModel *)mooMooMeadows;
+ (CMKCourseModel *)marioCircuitGba;
+ (CMKCourseModel *)cheepCheepBeach;
+ (CMKCourseModel *)toadsTurnpike;

// Banana Cup.
+ (CMKCourseModel *)dryDryDesert;
+ (CMKCourseModel *)donutPlains3;
+ (CMKCourseModel *)royalRaceway;
+ (CMKCourseModel *)dkJungle;

// Leaf Cup.
+ (CMKCourseModel *)warioStadium;
+ (CMKCourseModel *)sherbetLand;
+ (CMKCourseModel *)musicPark;
+ (CMKCourseModel *)yoshiValley;

// Lightning Cup.
+ (CMKCourseModel *)tickTockClock;
+ (CMKCourseModel *)piranhaPlantSlide;
+ (CMKCourseModel *)grumbleVolcano;
+ (CMKCourseModel *)rainbowRoadN64;

+ (NSArray *)       cups;
+ (NSArray *)       courses;

@end
