//
//  CMKCourses.m
//  configuremk8
//
//  Created by Anthony Robledo on 9/9/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKCourses.h"
#import "CMKConstants.h"
#import "CMKCupModel.h"
#import "CMKCourseModel.h"

#define _TAG (NSStringFromClass([CMKCourses class]))

// Note: For some reason, we need to use .jpg for the maps.
@implementation CMKCourses

// Cups.
static CMKCupModel *_mushroomCup;
static CMKCupModel *_flowerCup;
static CMKCupModel *_starCup;
static CMKCupModel *_specialCup;
static CMKCupModel *_shellCup;
static CMKCupModel *_bananaCup;
static CMKCupModel *_leafCup;
static CMKCupModel *_lightningCup;

// Courses.

// Mushroom Cup.
static CMKCourseModel *_marioKartStadium;
static CMKCourseModel *_waterPark;
static CMKCourseModel *_sweetSweetCanyon;
static CMKCourseModel *_thwompRuins;

// Flower Cup.
static CMKCourseModel *_marioCircuit;
static CMKCourseModel *_toadHarbor;
static CMKCourseModel *_twistedMansion;
static CMKCourseModel *_shyGuyFalls;

// Star Cup.
static CMKCourseModel *_sunshineAirport;
static CMKCourseModel *_dolphinShoals;
static CMKCourseModel *_electrodrome;
static CMKCourseModel *_mountWario;

// Special Cup.
static CMKCourseModel *_cloudtopCruise;
static CMKCourseModel *_boneDryDunes;
static CMKCourseModel *_bowsersCastle;
static CMKCourseModel *_rainbowRoad;

// Shell Cup.
static CMKCourseModel *_mooMooMeadows;
static CMKCourseModel *_marioCircuitGba;
static CMKCourseModel *_cheepCheepBeach;
static CMKCourseModel *_toadsTurnpike;

// Banana Cup.
static CMKCourseModel *_dryDryDesert;
static CMKCourseModel *_donutPlains3;
static CMKCourseModel *_royalRaceway;
static CMKCourseModel *_dkJungle;

// Leaf Cup.
static CMKCourseModel *_warioStadium;
static CMKCourseModel *_sherbetLand;
static CMKCourseModel *_musicPark;
static CMKCourseModel *_yoshiValley;

// Lightning Cup.
static CMKCourseModel *_tickTockClock;
static CMKCourseModel *_piranhaPlantSlide;
static CMKCourseModel *_grumbleVolcano;
static CMKCourseModel *_rainbowRoadN64;

static NSArray *_cups;
static NSArray *_courses;

+ (void)initialize {
  // Need to do if we call initialize directly.
  static BOOL initialized = NO;

  if (!initialized) {
    initialized = YES;

    // Courses.

    // Mushroom Cup.
    _marioKartStadium = [[CMKCourseModel alloc] initWithName:MARIO_KART_STADIUM_NAME_STRING
                                             withDisplayName:MARIO_KART_STADIUM_DISPLAY_NAME_STRING
                                           withIconImageName:@"wiiu_map_icon_mario_kart_stadium"
                                            withMapImageName:@"prima_map_mario_kart_stadium.jpg"
                                             withCourseIndex:0];

    _waterPark = [[CMKCourseModel alloc] initWithName:WATER_PARK_NAME_STRING
                                      withDisplayName:WATER_PARK_DISPLAY_NAME_STRING
                                    withIconImageName:@"wiiu_map_icon_water_park"
                                     withMapImageName:@"prima_map_water_park.jpg"
                                      withCourseIndex:1];

    _sweetSweetCanyon = [[CMKCourseModel alloc] initWithName:SWEET_SWEET_CANYON_NAME_STRING
                                             withDisplayName:SWEET_SWEET_CANYON_DISPLAY_NAME_STRING
                                           withIconImageName:@"wiiu_map_icon_sweet_sweet_canyon"
                                            withMapImageName:@"prima_map_sweet_sweet_canyon.jpg"
                                             withCourseIndex:2];

    _thwompRuins = [[CMKCourseModel alloc] initWithName:THWOMP_RUINS_NAME_STRING
                                        withDisplayName:THWOMP_RUINS_DISPLAY_NAME_STRING
                                      withIconImageName:@"wiiu_map_icon_thwomp_ruins"
                                       withMapImageName:@"prima_map_thwomp_ruins.jpg"
                                        withCourseIndex:3];

    // Flower Cup.
    _marioCircuit = [[CMKCourseModel alloc] initWithName:MARIO_CIRCUIT_NAME_STRING
                                         withDisplayName:MARIO_CIRCUIT_DISPLAY_NAME_STRING
                                       withIconImageName:@"wiiu_map_icon_mario_circuit"
                                        withMapImageName:@"prima_map_mario_circuit.jpg"
                                         withCourseIndex:4];

    _toadHarbor = [[CMKCourseModel alloc] initWithName:TOAD_HARBOR_NAME_STRING
                                       withDisplayName:TOAD_HARBOR_DISPLAY_NAME_STRING
                                     withIconImageName:@"wiiu_map_icon_toad_harbor"
                                      withMapImageName:@"prima_map_toad_harbor.jpg"
                                       withCourseIndex:5];

    _twistedMansion = [[CMKCourseModel alloc] initWithName:TWISTED_MANSION_NAME_STRING
                                           withDisplayName:TWISTED_MANSION_DISPLAY_NAME_STRING
                                         withIconImageName:@"wiiu_map_icon_twisted_mansion"
                                          withMapImageName:@"prima_map_twisted_mansion.jpg"
                                           withCourseIndex:6];

    _shyGuyFalls = [[CMKCourseModel alloc] initWithName:SHY_GUY_FALLS_NAME_STRING
                                        withDisplayName:SHY_GUY_FALLS_DISPLAY_NAME_STRING
                                      withIconImageName:@"wiiu_map_icon_shy_guy_falls"
                                       withMapImageName:@"prima_map_shy_guy_falls.jpg"
                                        withCourseIndex:7];

// Star Cup.
    _sunshineAirport = [[CMKCourseModel alloc] initWithName:SUNSHINE_AIRPORT_NAME_STRING
                                            withDisplayName:SUNSHINE_AIRPORT_DISPLAY_NAME_STRING
                                          withIconImageName:@"wiiu_map_icon_sunshine_airport"
                                           withMapImageName:@"prima_map_sunshine_airport.jpg"
                                            withCourseIndex:8];

    _dolphinShoals = [[CMKCourseModel alloc] initWithName:DOLPHIN_SHOALS_NAME_STRING
                                          withDisplayName:DOLPHIN_SHOALS_DISPLAY_NAME_STRING
                                        withIconImageName:@"wiiu_map_icon_dolphin_shoals"
                                         withMapImageName:@"prima_map_dolphin_shoals.jpg"
                                          withCourseIndex:9];

    _electrodrome = [[CMKCourseModel alloc] initWithName:ELECTRODROME_NAME_STRING
                                         withDisplayName:ELECTRODROME_DISPLAY_NAME_STRING
                                       withIconImageName:@"wiiu_map_icon_electrodrome"
                                        withMapImageName:@"prima_map_electrodrome.jpg"
                                         withCourseIndex:10];

    _mountWario = [[CMKCourseModel alloc] initWithName:MOUNT_WARIO_NAME_STRING
                                       withDisplayName:MOUNT_WARIO_DISPLAY_NAME_STRING
                                     withIconImageName:@"wiiu_map_icon_mount_wario"
                                      withMapImageName:@"prima_map_mount_wario.jpg"
                                       withCourseIndex:11];

// Special Cup.
    _cloudtopCruise = [[CMKCourseModel alloc] initWithName:CLOUDTOP_CRUISE_NAME_STRING
                                           withDisplayName:CLOUDTOP_CRUISE_DISPLAY_NAME_STRING
                                         withIconImageName:@"wiiu_map_icon_cloudtop_cruise"
                                          withMapImageName:@"prima_map_cloudtop_cruise.jpg"
                                           withCourseIndex:12];

    _boneDryDunes = [[CMKCourseModel alloc] initWithName:BONE_DRY_DUNES_NAME_STRING
                                         withDisplayName:BONE_DRY_DUNES_DISPLAY_NAME_STRING
                                       withIconImageName:@"wiiu_map_icon_bone_dry_dunes"
                                        withMapImageName:@"prima_map_bone_dry_dunes.jpg"
                                         withCourseIndex:13];

    _bowsersCastle = [[CMKCourseModel alloc] initWithName:BOWSERS_CASTLE_NAME_STRING
                                          withDisplayName:BOWSERS_CASTLE_DISPLAY_NAME_STRING
                                        withIconImageName:@"wiiu_map_icon_bowsers_castle"
                                         withMapImageName:@"prima_map_bowsers_castle.jpg"
                                          withCourseIndex:14];

    _rainbowRoad = [[CMKCourseModel alloc] initWithName:RAINBOW_ROAD_NAME_STRING
                                        withDisplayName:RAINBOW_ROAD_N64_DISPLAY_NAME_STRING
                                      withIconImageName:@"wiiu_map_icon_rainbow_road"
                                       withMapImageName:@"prima_map_rainbow_road.jpg"
                                        withCourseIndex:15];

// Shell Cup.
    _mooMooMeadows = [[CMKCourseModel alloc] initWithName:MOO_MOO_MEADOWS_NAME_STRING
                                          withDisplayName:MOO_MOO_MEADOWS_DISPLAY_NAME_STRING
                                        withIconImageName:@"wiiu_map_icon_moo_moo_meadows"
                                         withMapImageName:@"prima_map_moo_moo_meadows.jpg"
                                          withCourseIndex:16];

    _marioCircuitGba = [[CMKCourseModel alloc] initWithName:MARIO_CIRCUIT_GBA_NAME_STRING
                                            withDisplayName:MARIO_CIRCUIT_GBA_DISPLAY_NAME_STRING
                                          withIconImageName:@"wiiu_map_icon_mario_circuit_gba"
                                           withMapImageName:@"prima_map_mario_circuit_gba.jpg"
                                            withCourseIndex:17];

    _cheepCheepBeach = [[CMKCourseModel alloc] initWithName:CHEEP_CHEEP_BEACH_NAME_STRING
                                            withDisplayName:CHEEP_CHEEP_BEACH_DISPLAY_NAME_STRING
                                          withIconImageName:@"wiiu_map_icon_cheep_cheep_beach"
                                           withMapImageName:@"prima_map_cheep_cheep_beach.jpg"
                                            withCourseIndex:18];

    _toadsTurnpike = [[CMKCourseModel alloc] initWithName:TOADS_TURNPIKE_NAME_STRING
                                          withDisplayName:TOADS_TURNPIKE_DISPLAY_NAME_STRING
                                        withIconImageName:@"wiiu_map_icon_toads_turnpike"
                                         withMapImageName:@"prima_map_toads_turnpike.jpg"
                                          withCourseIndex:19];

// Banana Cup.
    _dryDryDesert = [[CMKCourseModel alloc] initWithName:DRY_DRY_DESERT_NAME_STRING
                                         withDisplayName:DRY_DRY_DESERT_DISPLAY_NAME_STRING
                                       withIconImageName:@"wiiu_map_icon_dry_dry_desert"
                                        withMapImageName:@"prima_map_dry_dry_desert.jpg"
                                         withCourseIndex:20];

    _donutPlains3 = [[CMKCourseModel alloc] initWithName:DONUT_PLAINS_3_NAME_STRING
                                         withDisplayName:DONUT_PLAINS_3_DISPLAY_NAME_STRING
                                       withIconImageName:@"wiiu_map_icon_donut_plains_3"
                                        withMapImageName:@"prima_map_donut_plains_3.jpg"
                                         withCourseIndex:21];

    _royalRaceway = [[CMKCourseModel alloc] initWithName:ROYAL_RACEWAY_NAME_STRING
                                         withDisplayName:ROYAL_RACEWAY_DISPLAY_NAME_STRING
                                       withIconImageName:@"wiiu_map_icon_royal_raceway"
                                        withMapImageName:@"prima_map_royal_raceway.jpg"
                                         withCourseIndex:22];

    _dkJungle = [[CMKCourseModel alloc] initWithName:DK_JUNGLE_NAME_STRING
                                     withDisplayName:DK_JUNGLE_DISPLAY_NAME_STRING
                                   withIconImageName:@"wiiu_map_icon_dk_jungle"
                                    withMapImageName:@"prima_map_dk_jungle.jpg"
                                     withCourseIndex:23];

// Leaf Cup.
    _warioStadium = [[CMKCourseModel alloc] initWithName:WARIO_STADIUM_NAME_STRING
                                         withDisplayName:WARIO_STADIUM_DISPLAY_NAME_STRING
                                       withIconImageName:@"wiiu_map_icon_wario_stadium"
                                        withMapImageName:@"prima_map_wario_stadium.jpg"
                                         withCourseIndex:24];

    _sherbetLand = [[CMKCourseModel alloc] initWithName:SHERBET_LAND_NAME_STRING
                                        withDisplayName:SHERBET_LAND_DISPLAY_NAME_STRING
                                      withIconImageName:@"wiiu_map_icon_sherbet_land"
                                       withMapImageName:@"prima_map_sherbet_land.jpg"
                                        withCourseIndex:25];

    _musicPark = [[CMKCourseModel alloc] initWithName:MUSIC_PARK_NAME_STRING
                                      withDisplayName:MUSIC_PARK_DISPLAY_NAME_STRING
                                    withIconImageName:@"wiiu_map_icon_music_park"
                                     withMapImageName:@"prima_map_music_park.jpg"
                                      withCourseIndex:26];

    _yoshiValley = [[CMKCourseModel alloc] initWithName:YOSHI_VALLEY_NAME_STRING
                                        withDisplayName:YOSHI_VALLEY_DISPLAY_NAME_STRING
                                      withIconImageName:@"wiiu_map_icon_yoshi_valley"
                                       withMapImageName:@"prima_map_yoshi_valley.jpg"
                                        withCourseIndex:27];

// Lightning Cup.
    _tickTockClock = [[CMKCourseModel alloc] initWithName:TICK_TOCK_CLOCK_NAME_STRING
                                          withDisplayName:TICK_TOCK_CLOCK_DISPLAY_NAME_STRING
                                        withIconImageName:@"wiiu_map_icon_tick_tock_clock"
                                         withMapImageName:@"prima_map_tick_tock_clock.jpg"
                                          withCourseIndex:28];

    _piranhaPlantSlide = [[CMKCourseModel alloc] initWithName:PIRANHA_PLANT_SLIDE_NAME_STRING
                                              withDisplayName:PIRANHA_PLANT_SLIDE_DISPLAY_NAME_STRING
                                            withIconImageName:@"wiiu_map_icon_piranha_plant_slide"
                                             withMapImageName:@"prima_map_piranha_plant_slide.jpg"
                                              withCourseIndex:29];

    _grumbleVolcano = [[CMKCourseModel alloc] initWithName:GRUMBLE_VOLCANO_NAME_STRING
                                           withDisplayName:GRUMBLE_VOLCANO_DISPLAY_NAME_STRING
                                         withIconImageName:@"wiiu_map_icon_grumble_volcano"
                                          withMapImageName:@"prima_map_grumble_volcano.jpg"
                                           withCourseIndex:30];

    _rainbowRoadN64 = [[CMKCourseModel alloc] initWithName:RAINBOW_ROAD_N64_NAME_STRING
                                           withDisplayName:RAINBOW_ROAD_N64_DISPLAY_NAME_STRING
                                         withIconImageName:@"wiiu_map_icon_rainbow_road_n64"
                                          withMapImageName:@"prima_map_rainbow_road_n64.jpg"
                                           withCourseIndex:31];

    // Cups.
    _mushroomCup = [[CMKCupModel alloc] initWithName:MUSHROOM_CUP_NAME_STRING
                                     withDisplayName:MUSHROOM_CUP_DISPLAY_NAME_STRING
                                   withIconImageName:@"wiiu_cup_mushroom"
                                         withCourses:@[_marioKartStadium,
                                                       _waterPark,
                                                       _sweetSweetCanyon,
                                                       _thwompRuins]];

    _flowerCup = [[CMKCupModel alloc] initWithName:FLOWER_CUP_NAME_STRING
                                   withDisplayName:FLOWER_CUP_DISPLAY_NAME_STRING
                                 withIconImageName:@"wiiu_cup_flower"
                                       withCourses:@[_marioCircuit,
                                                     _toadHarbor,
                                                     _twistedMansion,
                                                     _shyGuyFalls]];

    _starCup = [[CMKCupModel alloc] initWithName:STAR_CUP_NAME_STRING
                                 withDisplayName:STAR_CUP_DISPLAY_NAME_STRING
                               withIconImageName:@"wiiu_cup_star"
                                     withCourses:@[_sunshineAirport,
                                                   _dolphinShoals,
                                                   _electrodrome,
                                                   _mountWario]];

    _specialCup = [[CMKCupModel alloc] initWithName:SPECIAL_CUP_NAME_STRING
                                    withDisplayName:SPECIAL_CUP_DISPLAY_NAME_STRING
                                  withIconImageName:@"wiiu_cup_special"
                                        withCourses:@[_cloudtopCruise,
                                                      _boneDryDunes,
                                                      _bowsersCastle,
                                                      _rainbowRoad]];

    _shellCup = [[CMKCupModel alloc] initWithName:SHELL_CUP_NAME_STRING
                                  withDisplayName:SHELL_CUP_DISPLAY_NAME_STRING
                                withIconImageName:@"wiiu_cup_shell"
                                      withCourses:@[_mooMooMeadows,
                                                    _marioCircuitGba,
                                                    _cheepCheepBeach,
                                                    _toadsTurnpike]];

    _bananaCup = [[CMKCupModel alloc] initWithName:BANANA_CUP_NAME_STRING
                                   withDisplayName:BANANA_CUP_DISPLAY_NAME_STRING
                                 withIconImageName:@"wiiu_cup_banana"
                                       withCourses:@[_dryDryDesert,
                                                     _donutPlains3,
                                                     _royalRaceway,
                                                     _dkJungle]];

    _leafCup = [[CMKCupModel alloc] initWithName:LEAF_CUP_NAME_STRING
                                 withDisplayName:LEAF_CUP_DISPLAY_NAME_STRING
                               withIconImageName:@"wiiu_cup_leaf"
                                     withCourses:@[_warioStadium,
                                                   _sherbetLand,
                                                   _musicPark,
                                                   _yoshiValley]];

    _lightningCup = [[CMKCupModel alloc] initWithName:LIGHTWEIGHT_NAME_STRING
                                      withDisplayName:LIGHTNING_CUP_DISPLAY_NAME_STRING
                                    withIconImageName:@"wiiu_cup_lightning"
                                          withCourses:@[_tickTockClock,
                                                        _piranhaPlantSlide,
                                                        _grumbleVolcano,
                                                        _rainbowRoadN64]];

    _cups = @[_mushroomCup,
              _flowerCup,
              _starCup,
              _specialCup,
              _shellCup,
              _bananaCup,
              _leafCup,
              _lightningCup];

    _courses = @[_marioKartStadium,
                 _waterPark,
                 _sweetSweetCanyon,
                 _thwompRuins,

                 _marioCircuit,
                 _toadHarbor,
                 _twistedMansion,
                 _shyGuyFalls,

                 _sunshineAirport,
                 _dolphinShoals,
                 _electrodrome,
                 _mountWario,

                 _cloudtopCruise,
                 _boneDryDunes,
                 _bowsersCastle,
                 _rainbowRoad,

                 _mooMooMeadows,
                 _marioCircuitGba,
                 _cheepCheepBeach,
                 _toadsTurnpike,

                 _dryDryDesert,
                 _donutPlains3,
                 _royalRaceway,
                 _dkJungle,

                 _warioStadium,
                 _sherbetLand,
                 _musicPark,
                 _yoshiValley,

                 _tickTockClock,
                 _piranhaPlantSlide,
                 _grumbleVolcano,
                 _rainbowRoadN64];

    NSLog(@"%@ Cups and courses initialized.", _TAG);
  }
}

// Cups.
+ (CMKCupModel *)mushroomCup {
  return _mushroomCup;
}

+ (CMKCupModel *)flowerCup {
  return _flowerCup;
}

+ (CMKCupModel *)starCup {
  return _starCup;
}

+ (CMKCupModel *)specialCup {
  return _specialCup;
}

+ (CMKCupModel *)shellCup {
  return _shellCup;
}

+ (CMKCupModel *)bananaCup {
  return _bananaCup;
}

+ (CMKCupModel *)leafCup {
  return _leafCup;
}

+ (CMKCupModel *)lightningCup {
  return _lightningCup;
}

// Courses.

// Mushroom Cup.
+ (CMKCourseModel *)marioKartStadium {
  return _marioKartStadium;
}

+ (CMKCourseModel *)waterPark {
  return _waterPark;
}

+ (CMKCourseModel *)sweetSweetCanyon {
  return _sweetSweetCanyon;
}

+ (CMKCourseModel *)thwompRuins {
  return _thwompRuins;
}

// Flower Cup.
+ (CMKCourseModel *)marioCircuit {
  return _marioCircuit;
}

+ (CMKCourseModel *)toadHarbor {
  return _toadHarbor;
}

+ (CMKCourseModel *)twistedMansion {
  return _twistedMansion;
}

+ (CMKCourseModel *)shyGuyFalls {
  return _shyGuyFalls;
}

// Star Cup.
+ (CMKCourseModel *)sunshineAirport {
  return _sunshineAirport;
}

+ (CMKCourseModel *)dolphinShoals {
  return _dolphinShoals;
}

+ (CMKCourseModel *)electrodrome {
  return _electrodrome;
}

+ (CMKCourseModel *)mountWario {
  return _mountWario;
}

// Special Cup.
+ (CMKCourseModel *)cloudtopCruise {
  return _cloudtopCruise;
}

+ (CMKCourseModel *)boneDryDunes {
  return _boneDryDunes;
}

+ (CMKCourseModel *)bowsersCastle {
  return _bowsersCastle;
}

+ (CMKCourseModel *)rainbowRoad {
  return _rainbowRoadN64;
}

// Shell Cup.
+ (CMKCourseModel *)mooMooMeadows {
  return _mooMooMeadows;
}

+ (CMKCourseModel *)marioCircuitGba {
  return _marioCircuitGba;
}

+ (CMKCourseModel *)cheepCheepBeach {
  return _cheepCheepBeach;
}

+ (CMKCourseModel *)toadsTurnpike {
  return _toadsTurnpike;
}

// Banana Cup.
+ (CMKCourseModel *)dryDryDesert {
  return _dryDryDesert;
}

+ (CMKCourseModel *)donutPlains3 {
  return _donutPlains3;
}

+ (CMKCourseModel *)royalRaceway {
  return _royalRaceway;
}

+ (CMKCourseModel *)dkJungle {
  return _dkJungle;
}

// Leaf Cup.
+ (CMKCourseModel *)warioStadium {
  return _warioStadium;
}

+ (CMKCourseModel *)sherbetLand {
  return _sherbetLand;
}

+ (CMKCourseModel *)musicPark {
  return _musicPark;
}

+ (CMKCourseModel *)yoshiValley {
  return _yoshiValley;
}

// Lightning Cup.
+ (CMKCourseModel *)tickTockClock {
  return _tickTockClock;
}

+ (CMKCourseModel *)piranhaPlantSlide {
  return _piranhaPlantSlide;
}

+ (CMKCourseModel *)grumbleVolcano {
  return _grumbleVolcano;
}

+ (CMKCourseModel *)rainbowRoadN64 {
  return _rainbowRoadN64;
}

+ (NSArray *)cups {
  return _cups;
}

+ (NSArray *)courses {
  return _courses;
}

@end
