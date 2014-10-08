//
//  CMKParts.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/13/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKConstants.h"
#import "CMKKartConfigurationModel.h"
#import "CMKParts.h"
#import "CMKPartGroupModel.h"
#import "CMKStatsModel.h"

#define _TAG (NSStringFromClass([CMKParts class]))

@implementation CMKParts

// Flyweights.
static CMKPartModel *_babyMario;
static CMKPartModel *_babyLuigi;
static CMKPartModel *_babyPeach;
static CMKPartModel *_babyDaisy;
static CMKPartModel *_babyRosalina;
static CMKPartModel *_lemmy;

// Featherweights.
static CMKPartModel *_toad;
static CMKPartModel *_koopaTroopa;
static CMKPartModel *_shyGuy;
static CMKPartModel *_lakitu;
static CMKPartModel *_toadette;
static CMKPartModel *_larry;
static CMKPartModel *_wendy;

// Lightweights.
static CMKPartModel *_peach;
static CMKPartModel *_daisy;
static CMKPartModel *_yoshi;

// Middleweights.
static CMKPartModel *_mario;
static CMKPartModel *_luigi;
static CMKPartModel *_iggy;
static CMKPartModel *_ludwig;

// Cruiserweights.
static CMKPartModel *_donkeyKong;
static CMKPartModel *_waluigi;
static CMKPartModel *_rosalina;
static CMKPartModel *_roy;

// Metalweights.
static CMKPartModel *_metalMario;
static CMKPartModel *_pinkGoldPeach;

// Heavyweights.
static CMKPartModel *_bowser;
static CMKPartModel *_wario;
static CMKPartModel *_morton;

// Weight classes.
static CMKPartGroupModel *_flyweight;
static CMKPartGroupModel *_featherweight;
static CMKPartGroupModel *_lightweight;
static CMKPartGroupModel *_middleweight;
static CMKPartGroupModel *_cruiserweight;
static CMKPartGroupModel *_metalweight;
static CMKPartGroupModel *_heavyweight;

// Vehicle class A.
static CMKPartModel *_standardKart;
static CMKPartModel *_catCruiser;
static CMKPartModel *_prancer;
static CMKPartModel *_sneeker;
static CMKPartModel *_theDuke;
static CMKPartModel *_teddyBuggy;
static CMKPartModel *_threeHundredSlRoadster;

// Vehicle class B.
static CMKPartModel *_pipeFrame;
static CMKPartModel *_standardBike;
static CMKPartModel *_flameRider;
static CMKPartModel *_varmint;
static CMKPartModel *_wildWiggler;
static CMKPartModel *_w25SilverArrow;

// Vehicle class C.
static CMKPartModel *_mach8;
static CMKPartModel *_circuitSpecial;
static CMKPartModel *_sportsCoupe;
static CMKPartModel *_goldStandard;

// Vehicle class D.
static CMKPartModel *_steelDriver;
static CMKPartModel *_triSpeeder;
static CMKPartModel *_badwagon;
static CMKPartModel *_standardAtv;
static CMKPartModel *_gla;

// Vehicle class E.
static CMKPartModel *_biddybuggy;
static CMKPartModel *_landship;
static CMKPartModel *_mrScooty;

// Vehicle class F.
static CMKPartModel *_comet;
static CMKPartModel *_sportsBike;
static CMKPartModel *_jetBike;
static CMKPartModel *_yoshiBike;

// Vehicle groups.
static CMKPartGroupModel *_vehicleA;
static CMKPartGroupModel *_vehicleB;
static CMKPartGroupModel *_vehicleC;
static CMKPartGroupModel *_vehicleD;
static CMKPartGroupModel *_vehicleE;
static CMKPartGroupModel *_vehicleF;

// Tire class A.
static CMKPartModel *_standard;
static CMKPartModel *_offRoad;
static CMKPartModel *_blueStandard;
static CMKPartModel *_retroOffRoad;
static CMKPartModel *_glaTires;

// Tire class B.
static CMKPartModel *_monster;
static CMKPartModel *_hotMonster;

// Tire class C.
static CMKPartModel *_roller;
static CMKPartModel *_button;
static CMKPartModel *_azureRoller;

// Tire class D.
static CMKPartModel *_slim;
static CMKPartModel *_crimsonSlim;

// Tire class E.
static CMKPartModel *_slick;
static CMKPartModel *_cyberSlick;

// Tire class F.
static CMKPartModel *_metal;
static CMKPartModel *_goldTires;

// Tire class G.
static CMKPartModel *_sponge;
static CMKPartModel *_wood;
static CMKPartModel *_cushion;

// Tire groups.
static CMKPartGroupModel *_tireA;
static CMKPartGroupModel *_tireB;
static CMKPartGroupModel *_tireC;
static CMKPartGroupModel *_tireD;
static CMKPartGroupModel *_tireE;
static CMKPartGroupModel *_tireF;
static CMKPartGroupModel *_tireG;

// Glider class A.
static CMKPartModel *_superGlider;
static CMKPartModel *_warioWing;
static CMKPartModel *_waddleWing;
static CMKPartModel *_planeGlider;
static CMKPartModel *_goldGlider;

// Glider class B.
static CMKPartModel *_cloudGlider;
static CMKPartModel *_peachParasol;
static CMKPartModel *_parachute;
static CMKPartModel *_parafoil;
static CMKPartModel *_flowerGlider;
static CMKPartModel *_bowserKite;
static CMKPartModel *_mktvParafoil;

// Glider groups.
static CMKPartGroupModel *_gliderA;
static CMKPartGroupModel *_gliderB;

// Groups.
static NSArray *_characterGroups;
static NSArray *_vehicleGroups;
static NSArray *_tireGroups;
static NSArray *_gliderGroups;

// All kart configurations.
static NSMutableArray *_allKartConfigurations;

+ (void)initialize {
  // Need to do if we call initialize directly.
  static BOOL initialized = NO;

  if (!initialized) {
    initialized = YES;

    // Flyweights.
    _babyMario = [[CMKPartModel alloc] initWithName:BABY_MARIO_NAME_STRING
                                    withDisplayName:NSLocalizedString(BABY_MARIO_DISPLAY_NAME_STRING, nil)
                                      withImageName:@"wiiu_character_baby_mario"
                                      withPartGroup:_flyweight];

    _babyLuigi = [[CMKPartModel alloc] initWithName:BABY_LUIGI_NAME_STRING
                                    withDisplayName:NSLocalizedString(BABY_LUIGI_DISPLAY_NAME_STRING, nil)
                                      withImageName:@"wiiu_character_baby_luigi"
                                      withPartGroup:_flyweight];

    _babyPeach = [[CMKPartModel alloc] initWithName:BABY_PEACH_NAME_STRING
                                    withDisplayName:NSLocalizedString(BABY_PEACH_DISPLAY_NAME_STRING, nil)
                                      withImageName:@"wiiu_character_baby_peach"
                                      withPartGroup:_flyweight];

    _babyDaisy = [[CMKPartModel alloc] initWithName:BABY_DAISY_NAME_STRING
                                    withDisplayName:NSLocalizedString(BABY_DAISY_DISPLAY_NAME_STRING, nil)
                                      withImageName:@"wiiu_character_baby_daisy"
                                      withPartGroup:_flyweight];

    _babyRosalina = [[CMKPartModel alloc] initWithName:BABY_ROSALINA_NAME_STRING
                                       withDisplayName:NSLocalizedString(BABY_ROSALINA_DISPLAY_NAME_STRING, nil)
                                         withImageName:@"wiiu_character_baby_rosalina"
                                         withPartGroup:_flyweight];

    _lemmy = [[CMKPartModel alloc] initWithName:LEMMY_NAME_STRING
                                withDisplayName:NSLocalizedString(LEMMY_DISPLAY_NAME_STRING, nil)
                                  withImageName:@"wiiu_character_lemmy"
                                  withPartGroup:_flyweight];

    // Featherweights.
    _toad = [[CMKPartModel alloc] initWithName:TOAD_NAME_STRING
                               withDisplayName:NSLocalizedString(TOAD_DISPLAY_NAME_STRING, nil)
                                 withImageName:@"wiiu_character_toad"
                                 withPartGroup:_featherweight];

    _koopaTroopa = [[CMKPartModel alloc] initWithName:KOOPA_TROOPA_NAME_STRING
                                      withDisplayName:NSLocalizedString(KOOPA_TROOPA_DISPLAY_NAME_STRING, nil)
                                        withImageName:@"wiiu_character_koopa_troopa"
                                        withPartGroup:_featherweight];

    _shyGuy = [[CMKPartModel alloc] initWithName:SHY_GUY_NAME_STRING
                                 withDisplayName:NSLocalizedString(SHY_GUY_DISPLAY_NAME_STRING, nil)
                                   withImageName:@"wiiu_character_shy_guy"
                                   withPartGroup:_featherweight];

    _lakitu = [[CMKPartModel alloc] initWithName:LAKITU_NAME_STRING
                                 withDisplayName:NSLocalizedString(LAKITU_DISPLAY_NAME_STRING, nil)
                                   withImageName:@"wiiu_character_lakitu"
                                   withPartGroup:_featherweight];

    _toadette = [[CMKPartModel alloc] initWithName:TOADETTE_NAME_STRING
                                   withDisplayName:NSLocalizedString(TOADETTE_DISPLAY_NAME_STRING, nil)
                                     withImageName:@"wiiu_character_toadette"
                                     withPartGroup:_featherweight];

    _larry = [[CMKPartModel alloc] initWithName:LARRY_NAME_STRING
                                withDisplayName:NSLocalizedString(LARRY_DISPLAY_NAME_STRING, nil)
                                  withImageName:@"wiiu_character_larry"
                                  withPartGroup:_featherweight];

    _wendy = [[CMKPartModel alloc] initWithName:WENDY_NAME_STRING
                                withDisplayName:NSLocalizedString(WENDY_DISPLAY_NAME_STRING, nil)
                                  withImageName:@"wiiu_character_wendy"
                                  withPartGroup:_featherweight];

    // Lightweights.
    _peach = [[CMKPartModel alloc] initWithName:PEACH_NAME_STRING
                                withDisplayName:NSLocalizedString(PEACH_DISPLAY_NAME_STRING, nil)
                                  withImageName:@"wiiu_character_peach"
                                  withPartGroup:_lightweight];

    _daisy = [[CMKPartModel alloc] initWithName:DAISY_NAME_STRING
                                withDisplayName:NSLocalizedString(DAISY_DISPLAY_NAME_STRING, nil)
                                  withImageName:@"wiiu_character_daisy"
                                  withPartGroup:_lightweight];

    _yoshi = [[CMKPartModel alloc] initWithName:YOSHI_NAME_STRING
                                withDisplayName:NSLocalizedString(YOSHI_DISPLAY_NAME_STRING, nil)
                                  withImageName:@"wiiu_character_yoshi"
                                  withPartGroup:_lightweight];

    // Middleweights.
    _mario = [[CMKPartModel alloc] initWithName:MARIO_NAME_STRING
                                withDisplayName:NSLocalizedString(MARIO_DISPLAY_NAME_STRING, nil)
                                  withImageName:@"wiiu_character_mario"
                                  withPartGroup:_middleweight];

    _luigi = [[CMKPartModel alloc] initWithName:LUIGI_NAME_STRING
                                withDisplayName:NSLocalizedString(LUIGI_DISPLAY_NAME_STRING, nil)
                                  withImageName:@"wiiu_character_luigi"
                                  withPartGroup:_middleweight];

    _iggy = [[CMKPartModel alloc] initWithName:IGGY_NAME_STRING
                               withDisplayName:NSLocalizedString(IGGY_DISPLAY_NAME_STRING, nil)
                                 withImageName:@"wiiu_character_iggy"
                                 withPartGroup:_middleweight];

    _ludwig = [[CMKPartModel alloc] initWithName:LUDWIG_NAME_STRING
                                 withDisplayName:NSLocalizedString(LUDWIG_DISPLAY_NAME_STRING, nil)
                                   withImageName:@"wiiu_character_ludwig"
                                   withPartGroup:_middleweight];

    // Cruiserweights.
    _donkeyKong = [[CMKPartModel alloc] initWithName:DONKEY_KONG_NAME_STRING
                                     withDisplayName:NSLocalizedString(DONKEY_KONG_DISPLAY_NAME_STRING, nil)
                                       withImageName:@"wiiu_character_donkey_kong"
                                       withPartGroup:_cruiserweight];

    _waluigi = [[CMKPartModel alloc] initWithName:WALUIGI_NAME_STRING
                                  withDisplayName:NSLocalizedString(WALUIGI_DISPLAY_NAME_STRING, nil)
                                    withImageName:@"wiiu_character_waluigi"
                                    withPartGroup:_cruiserweight];

    _rosalina = [[CMKPartModel alloc] initWithName:ROSALINA_NAME_STRING
                                   withDisplayName:NSLocalizedString(ROSALINA_DISPLAY_NAME_STRING, nil)
                                     withImageName:@"wiiu_character_rosalina"
                                     withPartGroup:_cruiserweight];

    _roy = [[CMKPartModel alloc] initWithName:ROY_NAME_STRING
                              withDisplayName:NSLocalizedString(ROY_DISPLAY_NAME_STRING, nil)
                                withImageName:@"wiiu_character_roy"
                                withPartGroup:_cruiserweight];

    // Metalweights.
    _metalMario = [[CMKPartModel alloc] initWithName:METAL_MARIO_NAME_STRING
                                     withDisplayName:NSLocalizedString(METAL_MARIO_DISPLAY_NAME_STRING, nil)
                                       withImageName:@"wiiu_character_metal_mario"
                                       withPartGroup:_metalweight];

    _pinkGoldPeach = [[CMKPartModel alloc] initWithName:PINK_GOLD_PEACH_NAME_STRING
                                        withDisplayName:NSLocalizedString(PINK_GOLD_PEACH_DISPLAY_NAME_STRING, nil)
                                          withImageName:@"wiiu_character_pink_gold_peach"
                                          withPartGroup:_metalweight];

    // Heavyweights.
    _bowser = [[CMKPartModel alloc] initWithName:BOWSER_NAME_STRING
                                 withDisplayName:NSLocalizedString(BOWSER_DISPLAY_NAME_STRING, nil)
                                   withImageName:@"wiiu_character_bowser"
                                   withPartGroup:_heavyweight];

    _wario = [[CMKPartModel alloc] initWithName:WARIO_NAME_STRING
                                withDisplayName:NSLocalizedString(WARIO_DISPLAY_NAME_STRING, nil)
                                  withImageName:@"wiiu_character_wario"
                                  withPartGroup:_heavyweight];

    _morton = [[CMKPartModel alloc] initWithName:MORTON_NAME_STRING
                                 withDisplayName:NSLocalizedString(MORTON_DISPLAY_NAME_STRING, nil)
                                   withImageName:@"wiiu_character_morton"
                                   withPartGroup:_heavyweight];

    // Character groups.
    _flyweight = [[CMKPartGroupModel alloc] initWithType:Character
                                                withName:FLYWEIGHT_NAME_STRING
                                               withStats:[[CMKStatsModel alloc]initWithAcceleration:3.25f
                                                                                    withGroundSpeed:2.25f
                                                                               withAntigravitySpeed:2.5f
                                                                                       withAirSpeed:2.25f
                                                                                     withWaterSpeed:2.75f
                                                                                      withMiniturbo:3.0f
                                                                                 withGroundHandling:4.75f
                                                                            withAntigravityHandling:5.0f
                                                                                    withAirHandling:4.5f
                                                                                  withWaterHandling:4.75f
                                                                                       withTraction:4.5f
                                                                                         withWeight:2.25f]
                                               withParts:@[_babyMario,
                                                           _babyLuigi,
                                                           _babyPeach,
                                                           _babyDaisy,
                                                           _babyRosalina,
                                                           _lemmy]];

    _featherweight = [[CMKPartGroupModel alloc] initWithType:Character
                                                    withName:FEATHERWEIGHT_NAME_STRING
                                                   withStats:[[CMKStatsModel alloc]initWithAcceleration:3.0f
                                                                                        withGroundSpeed:2.75f
                                                                                   withAntigravitySpeed:3.0f
                                                                                           withAirSpeed:2.75f
                                                                                         withWaterSpeed:3.25f
                                                                                          withMiniturbo:2.75f
                                                                                     withGroundHandling:4.25f
                                                                                withAntigravityHandling:4.5f
                                                                                        withAirHandling:4.0f
                                                                                      withWaterHandling:4.25f
                                                                                           withTraction:4.25f
                                                                                             withWeight:2.75f]
                                                   withParts:@[_toad,
                                                               _koopaTroopa,
                                                               _shyGuy,
                                                               _lakitu,
                                                               _toadette,
                                                               _larry,
                                                               _wendy]];

    _lightweight = [[CMKPartGroupModel alloc] initWithType:Character
                                                  withName:LIGHTWEIGHT_NAME_STRING
                                                 withStats:[[CMKStatsModel alloc]initWithAcceleration:2.75f
                                                                                      withGroundSpeed:3.25f
                                                                                 withAntigravitySpeed:3.5f
                                                                                         withAirSpeed:3.25f
                                                                                       withWaterSpeed:3.75f
                                                                                        withMiniturbo:2.5f
                                                                                   withGroundHandling:3.75f
                                                                              withAntigravityHandling:4.0f
                                                                                      withAirHandling:3.5f
                                                                                    withWaterHandling:3.75f
                                                                                         withTraction:4.0f
                                                                                           withWeight:3.25f]
                                                 withParts:@[_peach,
                                                             _daisy,
                                                             _yoshi]];

    _middleweight = [[CMKPartGroupModel alloc] initWithType:Character
                                                   withName:MIDDLEWEIGHT_NAME_STRING
                                                  withStats:[[CMKStatsModel alloc]initWithAcceleration:2.5f
                                                                                       withGroundSpeed:3.75f
                                                                                  withAntigravitySpeed:4.0f
                                                                                          withAirSpeed:3.75f
                                                                                        withWaterSpeed:4.25f
                                                                                         withMiniturbo:2.25f
                                                                                    withGroundHandling:3.25f
                                                                               withAntigravityHandling:3.5f
                                                                                       withAirHandling:3.0f
                                                                                     withWaterHandling:3.25f
                                                                                          withTraction:3.75f
                                                                                            withWeight:3.75f]
                                                  withParts:@[_mario,
                                                              _luigi,
                                                              _iggy,
                                                              _ludwig]];

    _cruiserweight = [[CMKPartGroupModel alloc] initWithType:Character
                                                    withName:CRUISERWEIGHT_NAME_STRING
                                                   withStats:[[CMKStatsModel alloc]initWithAcceleration:2.25f
                                                                                        withGroundSpeed:4.25f
                                                                                   withAntigravitySpeed:4.5f
                                                                                           withAirSpeed:4.25f
                                                                                         withWaterSpeed:4.75f
                                                                                          withMiniturbo:2.0f
                                                                                     withGroundHandling:2.75f
                                                                                withAntigravityHandling:3.0f
                                                                                        withAirHandling:2.5f
                                                                                      withWaterHandling:2.75f
                                                                                           withTraction:3.5f
                                                                                             withWeight:4.25f]
                                                   withParts:@[_donkeyKong,
                                                               _waluigi,
                                                               _rosalina,
                                                               _roy]];

    _metalweight = [[CMKPartGroupModel alloc] initWithType:Character
                                                  withName:METALWEIGHT_NAME_STRING
                                                 withStats:[[CMKStatsModel alloc]initWithAcceleration:2.0f
                                                                                      withGroundSpeed:4.25f
                                                                                 withAntigravitySpeed:4.5f
                                                                                         withAirSpeed:4.25f
                                                                                       withWaterSpeed:4.75f
                                                                                        withMiniturbo:1.75f
                                                                                   withGroundHandling:2.75f
                                                                              withAntigravityHandling:3.0f
                                                                                      withAirHandling:2.5f
                                                                                    withWaterHandling:2.75f
                                                                                         withTraction:3.5f
                                                                                           withWeight:4.75f]
                                                 withParts:@[_metalMario,
                                                             _pinkGoldPeach]];

    _heavyweight = [[CMKPartGroupModel alloc] initWithType:Character
                                                  withName:HEAVYWEIGHT_NAME_STRING
                                                 withStats:[[CMKStatsModel alloc]initWithAcceleration:2.0f
                                                                                      withGroundSpeed:4.75f
                                                                                 withAntigravitySpeed:5.0f
                                                                                         withAirSpeed:4.75f
                                                                                       withWaterSpeed:5.25f
                                                                                        withMiniturbo:1.75f
                                                                                   withGroundHandling:2.25f
                                                                              withAntigravityHandling:2.5f
                                                                                      withAirHandling:2.0f
                                                                                    withWaterHandling:2.25f
                                                                                         withTraction:3.25f
                                                                                           withWeight:4.75f]
                                                 withParts:@[_bowser,
                                                             _wario,
                                                             _morton]];

    NSLog(@"%@ Characters and character groups initialized.", _TAG);

    // Vehicle class A.
    _standardKart = [[CMKPartModel alloc] initWithName:STANDARD_KART_NAME_STRING
                                       withDisplayName:NSLocalizedString(STANDARD_KART_DISPLAY_NAME_STRING, nil)
                                         withImageName:@"wiiu_vehicle_standard_kart"
                                         withPartGroup:_vehicleA];

    _catCruiser = [[CMKPartModel alloc] initWithName:CAT_CRUISER_NAME_STRING
                                     withDisplayName:NSLocalizedString(CAT_CRUISER_DISPLAY_NAME_STRING, nil)
                                       withImageName:@"wiiu_vehicle_cat_cruiser"
                                       withPartGroup:_vehicleA];

    _prancer = [[CMKPartModel alloc] initWithName:PRANCER_NAME_STRING
                                  withDisplayName:NSLocalizedString(PRANCER_DISPLAY_NAME_STRING, nil)
                                    withImageName:@"wiiu_vehicle_prancer"
                                    withPartGroup:_vehicleA];

    _sneeker = [[CMKPartModel alloc] initWithName:SNEEKER_NAME_STRING
                                  withDisplayName:NSLocalizedString(SNEEKER_DISPLAY_NAME_STRING, nil)
                                    withImageName:@"wiiu_vehicle_sneeker"
                                    withPartGroup:_vehicleA];

    _theDuke = [[CMKPartModel alloc] initWithName:THE_DUKE_NAME_STRING
                                  withDisplayName:NSLocalizedString(THE_DUKE_DISPLAY_NAME_STRING, nil)
                                    withImageName:@"wiiu_vehicle_the_duke"
                                    withPartGroup:_vehicleA];

    _teddyBuggy = [[CMKPartModel alloc] initWithName:TEDDY_BUGGY_NAME_STRING
                                     withDisplayName:NSLocalizedString(TEDDY_BUGGY_DISPLAY_NAME_STRING, nil)
                                       withImageName:@"wiiu_vehicle_teddy_buggy"
                                       withPartGroup:_vehicleA];

    _threeHundredSlRoadster = [[CMKPartModel alloc] initWithName:THREE_HUNDRED_SL_ROADSTER_NAME_STRING
                                                 withDisplayName:NSLocalizedString(THREE_HUNDRED_SL_ROADSTER_DISPLAY_NAME_STRING, nil)
                                                   withImageName:@"wiiu_vehicle_300_sl_roadster"
                                                   withPartGroup:_vehicleA];

    // Vehicle class B.
    _pipeFrame = [[CMKPartModel alloc] initWithName:PIPE_FRAME_NAME_STRING
                                    withDisplayName:NSLocalizedString(PIPE_FRAME_DISPLAY_NAME_STRING, nil)
                                      withImageName:@"wiiu_vehicle_pipe_frame"
                                      withPartGroup:_vehicleB];

    _standardBike = [[CMKPartModel alloc] initWithName:STANDARD_BIKE_NAME_STRING
                                       withDisplayName:NSLocalizedString(STANDARD_BIKE_DISPLAY_NAME_STRING, nil)
                                         withImageName:@"wiiu_vehicle_standard_bike"
                                         withPartGroup:_vehicleB];

    _flameRider = [[CMKPartModel alloc] initWithName:FLAME_RIDER_NAME_STRING
                                     withDisplayName:NSLocalizedString(FLAME_RIDER_DISPLAY_NAME_STRING, nil)
                                       withImageName:@"wiiu_vehicle_flame_rider"
                                       withPartGroup:_vehicleB];

    _varmint = [[CMKPartModel alloc] initWithName:VARMINT_NAME_STRING
                                  withDisplayName:NSLocalizedString(VARMINT_DISPLAY_NAME_STRING, nil)
                                    withImageName:@"wiiu_vehicle_varmint"
                                    withPartGroup:_vehicleB];

    _wildWiggler = [[CMKPartModel alloc] initWithName:WILD_WIGGLER_NAME_STRING
                                      withDisplayName:NSLocalizedString(WILD_WIGGLER_DISPLAY_NAME_STRING, nil)
                                        withImageName:@"wiiu_vehicle_wild_wiggler"
                                        withPartGroup:_vehicleB];

    _w25SilverArrow = [[CMKPartModel alloc] initWithName:W_25_SILVER_ARROW_NAME_STRING
                                         withDisplayName:NSLocalizedString(W_25_SILVER_ARROW_DISPLAY_NAME_STRING, nil)
                                           withImageName:@"wiiu_vehicle_w_25_silver_arrow"
                                           withPartGroup:_vehicleB];

    // Vehicle class C.
    _mach8 = [[CMKPartModel alloc] initWithName:MACH_8_NAME_STRING
                                withDisplayName:NSLocalizedString(MACH_8_DISPLAY_NAME_STRING, nil)
                                  withImageName:@"wiiu_vehicle_mach_8"
                                  withPartGroup:_vehicleC];

    _circuitSpecial = [[CMKPartModel alloc] initWithName:CIRCUIT_SPECIAL_NAME_STRING
                                         withDisplayName:NSLocalizedString(CIRCUIT_SPECIAL_DISPLAY_NAME_STRING, nil)
                                           withImageName:@"wiiu_vehicle_circuit_special"
                                           withPartGroup:_vehicleC];

    _sportsCoupe = [[CMKPartModel alloc] initWithName:SPORTS_COUPE_NAME_STRING
                                      withDisplayName:NSLocalizedString(SPORTS_COUPE_DISPLAY_NAME_STRING, nil)
                                        withImageName:@"wiiu_vehicle_sports_coupe"
                                        withPartGroup:_vehicleC];

    _goldStandard = [[CMKPartModel alloc] initWithName:GOLD_STANDARD_NAME_STRING
                                       withDisplayName:NSLocalizedString(GOLD_STANDARD_DISPLAY_NAME_STRING, nil)
                                         withImageName:@"wiiu_vehicle_gold_standard"
                                         withPartGroup:_vehicleC];

    // Vehicle class D.
    _steelDriver = [[CMKPartModel alloc] initWithName:STEEL_DRIVER_NAME_STRING
                                      withDisplayName:NSLocalizedString(STEEL_DRIVER_DISPLAY_NAME_STRING, nil)
                                        withImageName:@"wiiu_vehicle_steel_driver"
                                        withPartGroup:_vehicleD];

    _triSpeeder = [[CMKPartModel alloc] initWithName:TRI_SPEEDER_NAME_STRING
                                     withDisplayName:NSLocalizedString(TRI_SPEEDER_DISPLAY_NAME_STRING, nil)
                                       withImageName:@"wiiu_vehicle_tri_speeder"
                                       withPartGroup:_vehicleD];

    _badwagon = [[CMKPartModel alloc] initWithName:BADWAGON_NAME_STRING
                                   withDisplayName:NSLocalizedString(BADWAGON_DISPLAY_NAME_STRING, nil)
                                     withImageName:@"wiiu_vehicle_badwagon"
                                     withPartGroup:_vehicleD];

    _standardAtv = [[CMKPartModel alloc] initWithName:STANDARD_ATV_NAME_STRING
                                      withDisplayName:NSLocalizedString(STANDARD_ATV_DISPLAY_NAME_STRING, nil)
                                        withImageName:@"wiiu_vehicle_standard_atv"
                                        withPartGroup:_vehicleD];

    _gla = [[CMKPartModel alloc] initWithName:GLA_NAME_STRING
                              withDisplayName:NSLocalizedString(GLA_DISPLAY_NAME_STRING, nil)
                                withImageName:@"wiiu_vehicle_gla"
                                withPartGroup:_vehicleD];

    // Vehicle class E.
    _biddybuggy = [[CMKPartModel alloc] initWithName:BIDDYBUGGY_NAME_STRING
                                     withDisplayName:NSLocalizedString(BIDDYBUGGY_DISPLAY_NAME_STRING, nil)
                                       withImageName:@"wiiu_vehicle_biddybuggy"
                                       withPartGroup:_vehicleE];

    _landship = [[CMKPartModel alloc] initWithName:LANDSHIP_NAME_STRING
                                   withDisplayName:NSLocalizedString(LANDSHIP_DISPLAY_NAME_STRING, nil)
                                     withImageName:@"wiiu_vehicle_landship"
                                     withPartGroup:_vehicleE];

    _mrScooty = [[CMKPartModel alloc] initWithName:MR_SCOOTY_NAME_STRING
                                   withDisplayName:NSLocalizedString(MR_SCOOTY_DISPLAY_NAME_STRING, nil)
                                     withImageName:@"wiiu_vehicle_mr_scooty"
                                     withPartGroup:_vehicleE];

    // Vehicle class F.
    _comet = [[CMKPartModel alloc] initWithName:COMET_NAME_STRING
                                withDisplayName:NSLocalizedString(COMET_DISPLAY_NAME_STRING, nil)
                                  withImageName:@"wiiu_vehicle_comet"
                                  withPartGroup:_vehicleF];

    _sportsBike = [[CMKPartModel alloc] initWithName:SPORTS_BIKE_NAME_STRING
                                     withDisplayName:NSLocalizedString(SPORTS_BIKE_DISPLAY_NAME_STRING, nil)
                                       withImageName:@"wiiu_vehicle_sport_bike"
                                       withPartGroup:_vehicleF];

    _jetBike = [[CMKPartModel alloc] initWithName:JET_BIKE_NAME_STRING
                                  withDisplayName:NSLocalizedString(JET_BIKE_DISPLAY_NAME_STRING, nil)
                                    withImageName:@"wiiu_vehicle_jet_bike"
                                    withPartGroup:_vehicleF];

    _yoshiBike = [[CMKPartModel alloc] initWithName:YOSHI_NAME_STRING
                                    withDisplayName:NSLocalizedString(YOSHI_DISPLAY_NAME_STRING, nil)
                                      withImageName:@"wiiu_vehicle_yoshi_bike"
                                      withPartGroup:_vehicleF];


    // Vehicle groups.
    _vehicleA = [[CMKPartGroupModel alloc] initWithType:Vehicle
                                               withName:VEHICLE_A_NAME_STRING
                                              withStats:[[CMKStatsModel alloc]initWithAcceleration:0.0f
                                                                                   withGroundSpeed:0.0f
                                                                              withAntigravitySpeed:0.0f
                                                                                      withAirSpeed:0.0f
                                                                                    withWaterSpeed:0.0f
                                                                                     withMiniturbo:0.0f
                                                                                withGroundHandling:0.0f
                                                                           withAntigravityHandling:0.0f
                                                                                   withAirHandling:0.0f
                                                                                 withWaterHandling:0.0f
                                                                                      withTraction:0.0f
                                                                                        withWeight:0.0f]
                                              withParts:@[_standardKart,
                                                          _catCruiser,
                                                          _prancer,
                                                          _sneeker,
                                                          _theDuke,
                                                          _teddyBuggy,
                                                          _threeHundredSlRoadster]];

    _vehicleB = [[CMKPartGroupModel alloc] initWithType:Vehicle
                                               withName:VEHICLE_B_NAME_STRING
                                              withStats:[[CMKStatsModel alloc]initWithAcceleration:0.25f
                                                                                   withGroundSpeed:0.0f
                                                                              withAntigravitySpeed:-0.25f
                                                                                      withAirSpeed:0.25f
                                                                                    withWaterSpeed:0.25f
                                                                                     withMiniturbo:0.25f
                                                                                withGroundHandling:0.5f
                                                                           withAntigravityHandling:0.25f
                                                                                   withAirHandling:0.5f
                                                                                 withWaterHandling:0.5f
                                                                                      withTraction:-0.5f
                                                                                        withWeight:-0.25f]
                                              withParts:@[_pipeFrame,
                                                          _standardBike,
                                                          _flameRider,
                                                          _varmint,
                                                          _wildWiggler,
                                                          _w25SilverArrow]];

    _vehicleC = [[CMKPartGroupModel alloc] initWithType:Vehicle
                                               withName:VEHICLE_C_NAME_STRING
                                              withStats:[[CMKStatsModel alloc]initWithAcceleration:-0.25f
                                                                                   withGroundSpeed:0.5f
                                                                              withAntigravitySpeed:-0.25f
                                                                                      withAirSpeed:0.5f
                                                                                    withWaterSpeed:0.25f
                                                                                     withMiniturbo:-0.5f
                                                                                withGroundHandling:0.0f
                                                                           withAntigravityHandling:-0.25f
                                                                                   withAirHandling:0.0f
                                                                                 withWaterHandling:0.0f
                                                                                      withTraction:-1.0f
                                                                                        withWeight:0.25f]
                                              withParts:@[_mach8,
                                                          _circuitSpecial,
                                                          _sportsCoupe,
                                                          _goldStandard]];

    _vehicleD = [[CMKPartGroupModel alloc] initWithType:Vehicle
                                               withName:VEHICLE_D_NAME_STRING
                                              withStats:[[CMKStatsModel alloc]initWithAcceleration:-0.5f
                                                                                   withGroundSpeed:0.0f
                                                                              withAntigravitySpeed:-0.25f
                                                                                      withAirSpeed:0.0f
                                                                                    withWaterSpeed:0.5f
                                                                                     withMiniturbo:-0.75f
                                                                                withGroundHandling:-0.5f
                                                                           withAntigravityHandling:-0.75f
                                                                                   withAirHandling:-0.25f
                                                                                 withWaterHandling:0.75f
                                                                                      withTraction:0.5f
                                                                                        withWeight:0.5f]
                                              withParts:@[_steelDriver,
                                                          _triSpeeder,
                                                          _badwagon,
                                                          _standardAtv,
                                                          _gla]];

    _vehicleE = [[CMKPartGroupModel alloc] initWithType:Vehicle
                                               withName:VEHICLE_E_NAME_STRING
                                              withStats:[[CMKStatsModel alloc]initWithAcceleration:1.25f
                                                                                   withGroundSpeed:-0.75f
                                                                              withAntigravitySpeed:-1.0f
                                                                                      withAirSpeed:0.5f
                                                                                    withWaterSpeed:0.5f
                                                                                     withMiniturbo:1.0f
                                                                                withGroundHandling:-0.5f
                                                                           withAntigravityHandling:0.75f
                                                                                   withAirHandling:0.75f
                                                                                 withWaterHandling:0.5f
                                                                                      withTraction:-0.25f
                                                                                        withWeight:-0.5f]
                                              withParts:@[_biddybuggy,
                                                          _landship,
                                                          _mrScooty]];

    _vehicleF = [[CMKPartGroupModel alloc] initWithType:Vehicle
                                               withName:VEHICLE_F_NAME_STRING
                                              withStats:[[CMKStatsModel alloc]initWithAcceleration:0.75f
                                                                                   withGroundSpeed:0.0f
                                                                              withAntigravitySpeed:-0.25f
                                                                                      withAirSpeed:0.0f
                                                                                    withWaterSpeed:0.0f
                                                                                     withMiniturbo:0.5f
                                                                                withGroundHandling:0.75f
                                                                           withAntigravityHandling:0.5f
                                                                                   withAirHandling:0.75f
                                                                                 withWaterHandling:0.75f
                                                                                      withTraction:-1.25f
                                                                                        withWeight:-0.25f]
                                              withParts:@[_comet,
                                                          _sportsBike,
                                                          _jetBike,
                                                          _yoshiBike]];

    NSLog(@"%@ Vehicles and vehicle groups initialized.", _TAG);

    // Tire class A.
    _standard = [[CMKPartModel alloc] initWithName:STANDARD_NAME_STRING
                                   withDisplayName:NSLocalizedString(STANDARD_DISPLAY_NAME_STRING, nil)
                                     withImageName:@"wiiu_tire_standard"
                                     withPartGroup:_tireA];
    _offRoad  = [[CMKPartModel alloc] initWithName:OFF_ROAD_NAME_STRING
                                   withDisplayName:NSLocalizedString(OFF_ROAD_DISPLAY_NAME_STRING, nil)
                                     withImageName:@"wiiu_tire_off_road"
                                     withPartGroup:_tireA];
    _blueStandard = [[CMKPartModel alloc] initWithName:BLUE_STANDARD_NAME_STRING
                                       withDisplayName:NSLocalizedString(BLUE_STANDARD_DISPLAY_NAME_STRING, nil)
                                         withImageName:@"wiiu_tire_blue_standard"
                                         withPartGroup:_tireA];

    _retroOffRoad  = [[CMKPartModel alloc] initWithName:RETRO_OFF_ROAD_NAME_STRING
                                        withDisplayName:NSLocalizedString(RETRO_OFF_ROAD_DISPLAY_NAME_STRING, nil)
                                          withImageName:@"wiiu_tire_retro_off_road"
                                          withPartGroup:_tireA];

    _glaTires = [[CMKPartModel alloc] initWithName:GLA_TIRES_NAME_STRING
                                   withDisplayName:NSLocalizedString(GLA_TIRES_DISPLAY_NAME_STRING, nil)
                                     withImageName:@"wiiu_tire_gla_tires"
                                     withPartGroup:_tireA];


    // Tire class B.
    _monster  = [[CMKPartModel alloc] initWithName:MONSTER_NAME_STRING
                                   withDisplayName:NSLocalizedString(MONSTER_DISPLAY_NAME_STRING, nil)
                                     withImageName:@"wiiu_tire_monster"
                                     withPartGroup:_tireB];

    _hotMonster  = [[CMKPartModel alloc] initWithName:HOT_MONSTER_NAME_STRING
                                      withDisplayName:NSLocalizedString(HOT_MONSTER_DISPLAY_NAME_STRING, nil)
                                        withImageName:@"wiiu_tire_hot_monster"
                                        withPartGroup:_tireB];


    // Tire class C.
    _roller  = [[CMKPartModel alloc] initWithName:ROLLER_NAME_STRING
                                  withDisplayName:NSLocalizedString(ROLLER_DISPLAY_NAME_STRING, nil)
                                    withImageName:@"wiiu_tire_roller"
                                    withPartGroup:_tireC];

    _button  = [[CMKPartModel alloc] initWithName:BUTTON_NAME_STRING
                                  withDisplayName:NSLocalizedString(BUTTON_DISPLAY_NAME_STRING, nil)
                                    withImageName:@"wiiu_tire_button"
                                    withPartGroup:_tireC];

    _azureRoller  = [[CMKPartModel alloc] initWithName:AZURE_ROLLER_NAME_STRING
                                       withDisplayName:NSLocalizedString(AZURE_ROLLER_DISPLAY_NAME_STRING, nil)
                                         withImageName:@"wiiu_tire_azure_roller"
                                         withPartGroup:_tireC];


    // Tire class D.
    _slim  = [[CMKPartModel alloc] initWithName:SLIM_NAME_STRING
                                withDisplayName:NSLocalizedString(SLIM_DISPLAY_NAME_STRING, nil)
                                  withImageName:@"wiiu_tire_slim"
                                  withPartGroup:_tireD];

    _crimsonSlim = [[CMKPartModel alloc] initWithName:CRIMSON_SLIM_NAME_STRING
                                      withDisplayName:NSLocalizedString(CRIMSON_SLIM_DISPLAY_NAME_STRING, nil)
                                        withImageName:@"wiiu_tire_crimson_slim"
                                        withPartGroup:_tireD];


    // Tire class E.
    _slick  = [[CMKPartModel alloc] initWithName:SLICK_NAME_STRING
                                 withDisplayName:NSLocalizedString(SLICK_DISPLAY_NAME_STRING, nil)
                                   withImageName:@"wiiu_tire_slick"
                                   withPartGroup:_tireE];

    _cyberSlick  = [[CMKPartModel alloc] initWithName:CYBER_SLICK_NAME_STRING
                                      withDisplayName:NSLocalizedString(CYBER_SLICK_DISPLAY_NAME_STRING, nil)
                                        withImageName:@"wiiu_tire_cyber_slick"
                                        withPartGroup:_tireE];


    // Tire class F.
    _metal = [[CMKPartModel alloc] initWithName:METAL_NAME_STRING
                                withDisplayName:NSLocalizedString(METAL_DISPLAY_NAME_STRING, nil)
                                  withImageName:@"wiiu_tire_metal"
                                  withPartGroup:_tireF];

    _goldTires  = [[CMKPartModel alloc] initWithName:GOLD_TIRES_NAME_STRING
                                     withDisplayName:NSLocalizedString(GOLD_TIRES_DISPLAY_NAME_STRING, nil)
                                       withImageName:@"wiiu_tire_gold_tires"
                                       withPartGroup:_tireF];


    // Tire class G.
    _sponge  = [[CMKPartModel alloc] initWithName:SPONGE_NAME_STRING
                                  withDisplayName:NSLocalizedString(SPONGE_DISPLAY_NAME_STRING, nil)
                                    withImageName:@"wiiu_tire_sponge"
                                    withPartGroup:_tireG];
    _wood  = [[CMKPartModel alloc] initWithName:WOOD_NAME_STRING
                                withDisplayName:NSLocalizedString(WOOD_DISPLAY_NAME_STRING, nil)
                                  withImageName:@"wiiu_tire_wood"
                                  withPartGroup:_tireG];
    _cushion  = [[CMKPartModel alloc] initWithName:CUSHION_NAME_STRING
                                   withDisplayName:NSLocalizedString(CUSHION_DISPLAY_NAME_STRING, nil)
                                     withImageName:@"wiiu_tire_cushion"
                                     withPartGroup:_tireG];

    // Tire groups.
    _tireA = [[CMKPartGroupModel alloc] initWithType:Tire
                                            withName:TIRE_A_NAME_STRING
                                           withStats:[[CMKStatsModel alloc]initWithAcceleration:0.0f
                                                                                withGroundSpeed:0.0f
                                                                           withAntigravitySpeed:0.0f
                                                                                   withAirSpeed:0.0f
                                                                                 withWaterSpeed:0.0f
                                                                                  withMiniturbo:0.0f
                                                                             withGroundHandling:0.0f
                                                                        withAntigravityHandling:0.0f
                                                                                withAirHandling:0.0f
                                                                              withWaterHandling:0.0f
                                                                                   withTraction:0.0f
                                                                                     withWeight:0.0f]
                                           withParts:@[_standard,
                                                       _offRoad,
                                                       _blueStandard,
                                                       _retroOffRoad,
                                                       _glaTires]];

    _tireB  = [[CMKPartGroupModel alloc] initWithType:Tire
                                             withName:TIRE_B_NAME_STRING
                                            withStats:[[CMKStatsModel alloc]initWithAcceleration:-0.5f
                                                                                 withGroundSpeed:0.0f
                                                                            withAntigravitySpeed:0.0f
                                                                                    withAirSpeed:-0.5f
                                                                                  withWaterSpeed:-0.5f
                                                                                   withMiniturbo:0.0f
                                                                              withGroundHandling:-0.75f
                                                                         withAntigravityHandling:-0.75f
                                                                                 withAirHandling:-0.75f
                                                                               withWaterHandling:-0.75f
                                                                                    withTraction:0.75f
                                                                                      withWeight:0.5f]
                                            withParts:@[_monster,
                                                        _hotMonster]];

    _tireC  = [[CMKPartGroupModel alloc] initWithType:Tire
                                             withName:TIRE_C_NAME_STRING
                                            withStats:[[CMKStatsModel alloc]initWithAcceleration:1.0f
                                                                                 withGroundSpeed:-0.5f
                                                                            withAntigravitySpeed:-0.5f
                                                                                    withAirSpeed:0.5f
                                                                                  withWaterSpeed:0.0f
                                                                                   withMiniturbo:1.5f
                                                                              withGroundHandling:0.25f
                                                                         withAntigravityHandling:0.25f
                                                                                 withAirHandling:0.25f
                                                                               withWaterHandling:0.25f
                                                                                    withTraction:-0.25f
                                                                                      withWeight:-0.5f]
                                            withParts:@[_roller,
                                                        _button,
                                                        _azureRoller]];

    _tireD  = [[CMKPartGroupModel alloc] initWithType:Tire
                                             withName:TIRE_D_NAME_STRING
                                            withStats:[[CMKStatsModel alloc]initWithAcceleration:-0.25f
                                                                                 withGroundSpeed:0.25f
                                                                            withAntigravitySpeed:0.25f
                                                                                    withAirSpeed:0.25f
                                                                                  withWaterSpeed:-0.25f
                                                                                   withMiniturbo:0.25f
                                                                              withGroundHandling:0.25f
                                                                         withAntigravityHandling:0.25f
                                                                                 withAirHandling:0.25f
                                                                               withWaterHandling:0.25f
                                                                                    withTraction:-0.5f
                                                                                      withWeight:0.0f]
                                            withParts:@[_slim,
                                                        _crimsonSlim]];

    _tireE  = [[CMKPartGroupModel alloc] initWithType:Tire
                                             withName:TIRE_E_NAME_STRING
                                            withStats:[[CMKStatsModel alloc]initWithAcceleration:-0.25f
                                                                                 withGroundSpeed:0.5f
                                                                            withAntigravitySpeed:0.5f
                                                                                    withAirSpeed:0.5f
                                                                                  withWaterSpeed:-1.0f
                                                                                   withMiniturbo:0.25f
                                                                              withGroundHandling:0.0f
                                                                         withAntigravityHandling:0.0f
                                                                                 withAirHandling:0.0f
                                                                               withWaterHandling:0.0f
                                                                                    withTraction:-1.0f
                                                                                      withWeight:0.25f]
                                            withParts:@[_slick,
                                                        _cyberSlick, ]];

    _tireF  = [[CMKPartGroupModel alloc] initWithType:Tire
                                             withName:TIRE_F_NAME_STRING
                                            withStats:[[CMKStatsModel alloc]initWithAcceleration:-0.5f
                                                                                 withGroundSpeed:0.25f
                                                                            withAntigravitySpeed:0.25f
                                                                                    withAirSpeed:0.25f
                                                                                  withWaterSpeed:-0.25f
                                                                                   withMiniturbo:0.0f
                                                                              withGroundHandling:0.0f
                                                                         withAntigravityHandling:0.0f
                                                                                 withAirHandling:0.0f
                                                                               withWaterHandling:0.0f
                                                                                    withTraction:-0.5f
                                                                                      withWeight:0.5f]
                                            withParts:@[_metal,
                                                        _goldTires]];

    _tireG  = [[CMKPartGroupModel alloc] initWithType:Tire
                                             withName:TIRE_G_NAME_STRING
                                            withStats:[[CMKStatsModel alloc]initWithAcceleration:0.25f
                                                                                 withGroundSpeed:-0.25f
                                                                            withAntigravitySpeed:-0.25f
                                                                                    withAirSpeed:0.25f
                                                                                  withWaterSpeed:-1.0f
                                                                                   withMiniturbo:0.75f
                                                                              withGroundHandling:-0.25f
                                                                         withAntigravityHandling:-0.25f
                                                                                 withAirHandling:0.0f
                                                                               withWaterHandling:-0.5f
                                                                                    withTraction:0.5f
                                                                                      withWeight:-0.25f]
                                            withParts:@[_sponge,
                                                        _wood,
                                                        _cushion]];

    NSLog(@"%@ Tires and tire groups initialized.", _TAG);

    // Glider class A.
    _superGlider  = [[CMKPartModel alloc] initWithName:SUPER_GLIDER_NAME_STRING
                                       withDisplayName:NSLocalizedString(SUPER_GLIDER_DISPLAY_NAME_STRING, nil)
                                         withImageName:@"wiiu_glider_super_glider"
                                         withPartGroup:_gliderA];

    _warioWing = [[CMKPartModel alloc] initWithName:WARIO_WING_NAME_STRING
                                    withDisplayName:NSLocalizedString(WARIO_WING_DISPLAY_NAME_STRING, nil)
                                      withImageName:@"wiiu_glider_wario_wing"
                                      withPartGroup:_gliderA];

    _waddleWing = [[CMKPartModel alloc] initWithName:WADDLE_WING_NAME_STRING
                                     withDisplayName:NSLocalizedString(WADDLE_WING_DISPLAY_NAME_STRING, nil)
                                       withImageName:@"wiiu_glider_waddle_wing"
                                       withPartGroup:_gliderA];

    _planeGlider = [[CMKPartModel alloc] initWithName:PLANE_GLIDER_NAME_STRING
                                      withDisplayName:NSLocalizedString(PLANE_GLIDER_DISPLAY_NAME_STRING, nil)
                                        withImageName:@"wiiu_glider_plane_glider"
                                        withPartGroup:_gliderA];

    _goldGlider = [[CMKPartModel alloc] initWithName:GOLD_GLIDER_NAME_STRING
                                     withDisplayName:NSLocalizedString(GOLD_GLIDER_DISPLAY_NAME_STRING, nil)
                                       withImageName:@"wiiu_glider_gold_glider"
                                       withPartGroup:_gliderA];

    // Glider class B.
    _cloudGlider = [[CMKPartModel alloc] initWithName:CLOUD_GLIDER_NAME_STRING
                                      withDisplayName:NSLocalizedString(CLOUD_GLIDER_DISPLAY_NAME_STRING, nil)
                                        withImageName:@"wiiu_glider_cloud_glider"
                                        withPartGroup:_gliderB];

    _peachParasol = [[CMKPartModel alloc] initWithName:PEACH_PARASOL_NAME_STRING
                                       withDisplayName:NSLocalizedString(PEACH_PARASOL_DISPLAY_NAME_STRING, nil)
                                         withImageName:@"wiiu_glider_peach_parasol"
                                         withPartGroup:_gliderB];

    _parachute = [[CMKPartModel alloc] initWithName:PARACHUTE_NAME_STRING
                                    withDisplayName:NSLocalizedString(PARACHUTE_DISPLAY_NAME_STRING, nil)
                                      withImageName:@"wiiu_glider_parachute"
                                      withPartGroup:_gliderB];

    _parafoil = [[CMKPartModel alloc] initWithName:PARAFOIL_NAME_STRING
                                   withDisplayName:NSLocalizedString(PARAFOIL_DISPLAY_NAME_STRING, nil)
                                     withImageName:@"wiiu_glider_parafoil"
                                     withPartGroup:_gliderB];

    _flowerGlider = [[CMKPartModel alloc] initWithName:FLOWER_GLIDER_NAME_STRING
                                       withDisplayName:NSLocalizedString(FLOWER_GLIDER_DISPLAY_NAME_STRING, nil)
                                         withImageName:@"wiiu_glider_flower_glider"
                                         withPartGroup:_gliderB];

    _bowserKite = [[CMKPartModel alloc] initWithName:BOWSER_KITE_NAME_STRING
                                     withDisplayName:NSLocalizedString(BOWSER_KITE_DISPLAY_NAME_STRING, nil)
                                       withImageName:@"wiiu_glider_bowser_kite"
                                       withPartGroup:_gliderB];

    _mktvParafoil = [[CMKPartModel alloc] initWithName:MKTV_PARAFOIL_NAME_STRING
                                       withDisplayName:NSLocalizedString(MKTV_PARAFOIL_DISPLAY_NAME_STRING, nil)
                                         withImageName:@"wiiu_glider_mktv_parafoil"
                                         withPartGroup:_gliderB];

    // Glider groups.
    _gliderA = [[CMKPartGroupModel alloc] initWithType:Glider
                                              withName:GLIDER_A_NAME_STRING
                                             withStats:[[CMKStatsModel alloc]initWithAcceleration:0.0f
                                                                                  withGroundSpeed:0.0f
                                                                             withAntigravitySpeed:0.0f
                                                                                     withAirSpeed:0.0f
                                                                                   withWaterSpeed:0.0f
                                                                                    withMiniturbo:0.0f
                                                                               withGroundHandling:0.0f
                                                                          withAntigravityHandling:0.0f
                                                                                  withAirHandling:0.0f
                                                                                withWaterHandling:0.0f
                                                                                     withTraction:0.0f
                                                                                       withWeight:0.0f]
                                             withParts:@[_superGlider,
                                                         _warioWing,
                                                         _waddleWing,
                                                         _planeGlider,
                                                         _goldGlider]];

    _gliderB  = [[CMKPartGroupModel alloc] initWithType:Glider
                                               withName:GLIDER_B_NAME_STRING
                                              withStats:[[CMKStatsModel alloc] initWithAcceleration:0.25f
                                                                                    withGroundSpeed:0.0f
                                                                               withAntigravitySpeed:0.0f
                                                                                       withAirSpeed:-0.25f
                                                                                     withWaterSpeed:0.0f
                                                                                      withMiniturbo:0.25f
                                                                                 withGroundHandling:0.0f
                                                                            withAntigravityHandling:0.0f
                                                                                    withAirHandling:0.25f
                                                                                  withWaterHandling:0.0f
                                                                                       withTraction:0.0f
                                                                                         withWeight:-0.25f]
                                              withParts:@[_cloudGlider,
                                                          _peachParasol,
                                                          _parachute,
                                                          _parafoil,
                                                          _flowerGlider,
                                                          _bowserKite,
                                                          _mktvParafoil]];

    NSLog(@"%@ Gliders and glider groups initialized.", _TAG);

    // Groups.
    _characterGroups = @[_flyweight,
                         _featherweight,
                         _lightweight,
                         _middleweight,
                         _cruiserweight,
                         _metalweight,
                         _heavyweight];

    _vehicleGroups = @[_vehicleA,
                       _vehicleB,
                       _vehicleC,
                       _vehicleD,
                       _vehicleE,
                       _vehicleF];

    _tireGroups = @[_tireA,
                    _tireB,
                    _tireC,
                    _tireD,
                    _tireE,
                    _tireF,
                    _tireG];

    _gliderGroups = @[_gliderA,
                      _gliderB];

    // Properly set the partGroup for each part.
    for (CMKPartGroupModel *partGroup in[_characterGroups arrayByAddingObjectsFromArray :
                                         [_vehicleGroups arrayByAddingObjectsFromArray:
                                          [_tireGroups arrayByAddingObjectsFromArray:_gliderGroups]]]) {
      for (CMKPartModel *part in partGroup.parts) {
        part.partGroup = partGroup;
      }
    }

    // All kart configurations.
    _allKartConfigurations = [[NSMutableArray alloc] init];

    for (CMKPartGroupModel *characterGroup in _characterGroups) {
      for (CMKPartGroupModel *vehicleGroup in _vehicleGroups) {
        for (CMKPartGroupModel *tireGroup in _tireGroups) {
          for (CMKPartGroupModel *gliderGroup in _gliderGroups) {
            [_allKartConfigurations addObject:[[CMKKartConfigurationModel alloc]
                                               initWithCharacterGroup:characterGroup
                                                     withVehicleGroup:vehicleGroup
                                                        withTireGroup:tireGroup
                                                      withGliderGroup:gliderGroup]];
          }
        }
      }
    }
  }
}

// Flyweights.
+ (CMKPartModel *)babyMario {
  return _babyMario;
}

+ (CMKPartModel *)babyLuigi {
  return _babyLuigi;
}

+ (CMKPartModel *)babyPeach {
  return _babyPeach;
}

+ (CMKPartModel *)babyDaisy {
  return _babyDaisy;
}

+ (CMKPartModel *)babyRosalina {
  return _babyRosalina;
}

+ (CMKPartModel *)lemmy {
  return _lemmy;
}

// Featherweights.
+ (CMKPartModel *)toad {
  return _toad;
}

+ (CMKPartModel *)koopaTroopa {
  return _koopaTroopa;
}

+ (CMKPartModel *)shyGuy {
  return _shyGuy;
}

+ (CMKPartModel *)lakitu {
  return _lakitu;
}

+ (CMKPartModel *)toadette {
  return _toadette;
}

+ (CMKPartModel *)larry {
  return _larry;
}

+ (CMKPartModel *)wendy {
  return _wendy;
}

// Lightweights.
+ (CMKPartModel *)peach {
  return _peach;
}

+ (CMKPartModel *)daisy {
  return _daisy;
}

+ (CMKPartModel *)yoshi {
  return _yoshi;
}

// Middleweights.
+ (CMKPartModel *)mario {
  return _mario;
}

+ (CMKPartModel *)luigi {
  return _luigi;
}

+ (CMKPartModel *)iggy {
  return _babyMario;
}

+ (CMKPartModel *)ludwig {
  return _ludwig;
}

// Cruiserweights.
+ (CMKPartModel *)donkeyKong {
  return _donkeyKong;
}

+ (CMKPartModel *)waluigi {
  return _waluigi;
}

+ (CMKPartModel *)rosalina {
  return _rosalina;
}

+ (CMKPartModel *)roy {
  return _roy;
}

// Metalweights.
+ (CMKPartModel *)metalMario {
  return _metalMario;
}

+ (CMKPartModel *)pinkGoldPeach {
  return _pinkGoldPeach;
}

// Heavyweights.
+ (CMKPartModel *)bowser {
  return _bowser;
}

+ (CMKPartModel *)wario {
  return _wario;
}

+ (CMKPartModel *)morton {
  return _morton;
}

// Weight classes.
+ (CMKPartGroupModel *)flyweight {
  return _flyweight;
}

+ (CMKPartGroupModel *)featherweight {
  return _featherweight;
}

+ (CMKPartGroupModel *)lightweight {
  return _lightweight;
}

+ (CMKPartGroupModel *)middleweight {
  return _middleweight;
}

+ (CMKPartGroupModel *)cruiserweight {
  return _cruiserweight;
}

+ (CMKPartGroupModel *)metalweight {
  return _metalweight;
}

+ (CMKPartGroupModel *)heavyweight {
  return _heavyweight;
}

// Vehicle class A.
+ (CMKPartModel *)standardKart {
  return _standardKart;
}

+ (CMKPartModel *)catCruiser {
  return _catCruiser;
}

+ (CMKPartModel *)prancer {
  return _prancer;
}

+ (CMKPartModel *)sneeker {
  return _sneeker;
}

+ (CMKPartModel *)theDuke {
  return _theDuke;
}

+ (CMKPartModel *)teddyBuggy {
  return _teddyBuggy;
}

+ (CMKPartModel *)threeHundredSlRoadster {
  return _threeHundredSlRoadster;
}

// Vehicle class B.
+ (CMKPartModel *)pipeFrame {
  return _pipeFrame;
}

+ (CMKPartModel *)standardBike {
  return _standardBike;
}

+ (CMKPartModel *)flameRider {
  return _flameRider;
}

+ (CMKPartModel *)varmint {
  return _varmint;
}

+ (CMKPartModel *)wildWiggler {
  return _wildWiggler;
}

+ (CMKPartModel *)w25SilverArrow {
  return _w25SilverArrow;
}

// Vehicle class C.
+ (CMKPartModel *)mach8 {
  return _mach8;
}

+ (CMKPartModel *)circuitSpecial {
  return _circuitSpecial;
}

+ (CMKPartModel *)sportsCoupe {
  return _sportsCoupe;
}

+ (CMKPartModel *)goldStandard {
  return _goldStandard;
}

// Vehicle class D.
+ (CMKPartModel *)steelDriver {
  return _steelDriver;
}

+ (CMKPartModel *)triSpeeder {
  return _triSpeeder;
}

+ (CMKPartModel *)badwagon {
  return _badwagon;
}

+ (CMKPartModel *)standardAtv {
  return _standardAtv;
}

+ (CMKPartModel *)gla {
  return _gla;
}

// Vehicle class E.
+ (CMKPartModel *)biddybuggy {
  return _biddybuggy;
}

+ (CMKPartModel *)landship {
  return _landship;
}

+ (CMKPartModel *)mrScooty {
  return _mrScooty;
}

// Vehicle class F.
+ (CMKPartModel *)comet {
  return _comet;
}

+ (CMKPartModel *)sportsBike {
  return _sportsBike;
}

+ (CMKPartModel *)jetBike {
  return _jetBike;
}

+ (CMKPartModel *)yoshiBike {
  return _yoshiBike;
}

// Vehicle groups.
+ (CMKPartGroupModel *)vehicleA {
  return _vehicleA;
}

+ (CMKPartGroupModel *)vehicleB {
  return _vehicleB;
}

+ (CMKPartGroupModel *)vehicleC {
  return _vehicleC;
}

+ (CMKPartGroupModel *)vehicleD {
  return _vehicleD;
}

+ (CMKPartGroupModel *)vehicleE {
  return _vehicleE;
}

+ (CMKPartGroupModel *)vehicleF {
  return _vehicleF;
}

// Tire class A.
+ (CMKPartModel *)standard  {
  return _standard;
}

+ (CMKPartModel *)offRoad {
  return _offRoad;
}

+ (CMKPartModel *)blueStandard {
  return _blueStandard;
}

+ (CMKPartModel *)retroOffRoad {
  return _retroOffRoad;
}

+ (CMKPartModel *)glaTires {
  return _glaTires;
}

// Tire class B.
+ (CMKPartModel *)monster {
  return _monster;
}

+ (CMKPartModel *)hotMonster {
  return _hotMonster;
}

// Tire class C.
+ (CMKPartModel *)roller {
  return _roller;
}

+ (CMKPartModel *)button {
  return _yoshiBike;
}

+ (CMKPartModel *)azureRoller {
  return _azureRoller;
}

// Tire class D.
+ (CMKPartModel *)slim {
  return _slim;
}

+ (CMKPartModel *)crimsonSlim {
  return _crimsonSlim;
}

// Tire class E.
+ (CMKPartModel *)slick {
  return _slick;
}

+ (CMKPartModel *)cyberSlick {
  return _cyberSlick;
}

// Tire class F.
+ (CMKPartModel *)metal {
  return _metal;
}

+ (CMKPartModel *)goldTires {
  return _goldTires;
}

// Tire class G.
+ (CMKPartModel *)sponge {
  return _sponge;
}

+ (CMKPartModel *)wood {
  return _wood;
}

+ (CMKPartModel *)cushion {
  return _cushion;
}

// Vehicle groups.
+ (CMKPartGroupModel *)tireA {
  return _tireA;
}

+ (CMKPartGroupModel *)tireB {
  return _tireB;
}

+ (CMKPartGroupModel *)tireC {
  return _tireC;
}

+ (CMKPartGroupModel *)tireD {
  return _tireD;
}

+ (CMKPartGroupModel *)tireE {
  return _tireE;
}

+ (CMKPartGroupModel *)tireF {
  return _tireF;
}

+ (CMKPartGroupModel *)tireG {
  return _tireG;
}

// Glider class A.
+ (CMKPartModel *)superGlider {
  return _superGlider;
}

+ (CMKPartModel *)warioWing {
  return _warioWing;
}

+ (CMKPartModel *)waddleWing {
  return _waddleWing;
}

+ (CMKPartModel *)planeGlider {
  return _planeGlider;
}

+ (CMKPartModel *)goldGlider {
  return _goldGlider;
}

// Glider class B.
+ (CMKPartModel *)cloudGlider {
  return _cloudGlider;
}

+ (CMKPartModel *)peachParasol {
  return _peachParasol;
}

+ (CMKPartModel *)parachute {
  return _parachute;
}

+ (CMKPartModel *)parafoil {
  return _parafoil;
}

+ (CMKPartModel *)flowerGlider {
  return _flowerGlider;
}

+ (CMKPartModel *)bowserKite {
  return _bowserKite;
}

+ (CMKPartModel *)mktvParafoil {
  return _mktvParafoil;
}

// Glider groups.
+ (CMKPartGroupModel *)gliderA {
  return _gliderA;
}

+ (CMKPartGroupModel *)gliderB {
  return _gliderB;
}

// Groups.
+ (NSArray *)characterGroups {
  return _characterGroups;
}

+ (NSArray *)vehicleGroups {
  return _vehicleGroups;
}

+ (NSArray *)tireGroups {
  return _tireGroups;
}

+ (NSArray *)gliderGroups {
  return _gliderGroups;
}

// All kart configurations.
+ (NSArray *)allKartConfigurations {
  return _allKartConfigurations;
}

@end
