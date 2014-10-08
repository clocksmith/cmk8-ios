//
//  CMKConstants.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/7/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

// Flags.
BOOL const ANDROID_STYLE = NO;

// IDs, Keys, and wallets.
NSString *const APP_ID = @"0";
NSString *const BITCOIN_ADDRESS = @"1L3xkhhQh1nWD8sAUDWyHdvnbcpqT1Qe7U";

// Dimensions.

// Font sizes.
int const DEFAULT_FONT_SIZE_IPHONE = 14;
int const DEFAULT_FONT_SIZE_IPAD = 17;
int const DEFAULT_TITLE_FONT_SIZE_IPHONE = 17;
int const DEFAULT_TITLE_FONT_SIZE_IPAD = 22;
int const DEFAULT_SPINNER_FONT_SIZE_IPHONE = DEFAULT_TITLE_FONT_SIZE_IPHONE;
int const DEFAULT_SPINNER_FONT_SIZE_IPAD = DEFAULT_TITLE_FONT_SIZE_IPAD;
int const PART_GROUP_VIEW_TITLE_FONT_SIZE_IPHONE = DEFAULT_FONT_SIZE_IPHONE;
int const PART_GROUP_VIEW_TITLE_FONT_SIZE_IPAD = DEFAULT_FONT_SIZE_IPAD;
int const COMPARE_SPINNER_FONT_SIZE_IPHONE = 13;
int const COMPARE_SPINNER_FONT_SIZE_IPAD = DEFAULT_SPINNER_FONT_SIZE_IPAD;
int const COURSE_SPINNER_LIST_VIEW_FONT_SIZE_IPHONE = 15;
int const ADJUST_BUTTON_FONT_SIZE_IPHONE = 18;
int const ADJUST_BUTTON_FONT_SIZE_IPAD = 22;
int const FAQ_BUTTON_FONT_SIZE_IPHONE = 13;
int const FAQ_BUTTON_FONT_SIZE_IPAD = 15;
// View sizes.
int const MAIN_TAB_BAR_HEIGHT = 48;
int const MAIN_TAB_ICON_SIZE = 24;
int const COURSE_SPINNER_DROPDOWN_ITEM_HEIGHT_IPHONE = 60;
int const COURSE_SPINNER_DROPDOWN_ITEM_HEIGHT_IPAD = 120;
int const PART_GROUP_VIEW_TITLE_HEIGHT_IPHONE = 18;
int const PART_GROUP_VIEW_TITLE_HEIGHT_IPAD = 24;

// Values.
int const MAX_NUM_PARTS_PER_GROUP = 7;
int const NUM_COURSES_PER_CUP = 4;
float const MAX_TOTAL_STATS_VALUE = 6.0;
float const MAX_SMALL_PART_STATS_VALUE = 1.5;
float const STATS_BAR_CHANGE_DURATION_S = 0.350;
float const POPUP_SHADE_ALPHA = 0.5f;
float const POPUP_TRANSITION_DURAION_S = 0.350f;
float const POPUP_CONTENT_CORNER_RADIUS = 4.0f;
float const POPUP_CONTENT_SHADOW_RADIUS = 6.0f;
float const POPUP_SHADOW_OPACITY = 0.8f;

// Strings.
NSString *const NAMESPACE_SEPERATOR = @"$";
NSString *const KEY_SEPERATOR = @":";
NSString *const NAME_SEPERATOR = @"-";

// Fonts.
NSString *const HELVETICA_NEUE_FONT = @"Helvetica Neue";
NSString *const HELVETICA_NEUE_BOLD_FONT = @"HelveticaNeue-Bold";
NSString *const HELVETICA_NEUE_ITALIC_FONT = @"HelveticaNeue-Italic";
NSString *const HELVETICA_NEUE_LIGHT_FONT = @"HelveticaNeue-Light";
NSString *const HELVETICA_NEUE_MEDIUM_FONT = @"HelveticaNeue-Medium";

// Image names.
NSString *const CONFIGURE_ICON_IMAGE = @"configure_icon";
NSString *const COMPARE_ICON_IMAGE = @"compare_icon";
NSString *const MAPS_ICON_IMAGE = @"maps_icon";
NSString *const FAQ_ICON_IMAGE = @"faq_icon";

// UI Strings.
NSString *const CONFIGURE_TITLE_STRING = @"Configure";
NSString *const COMPARE_TITLE_STRING = @"Compare";
NSString *const MAPS_TITLE_STRING = @"Maps";
NSString *const FAQ_TITLE_STRING = @"F.A.Q.";

// Analytics screen names.
NSString *const ADJUST_SCREEN = @"AdjustScreen";
NSString *const CONFIGURE_SCREEN = @"ConfigureScreen";
NSString *const COMPARE_SCREEN = @"CompareScreen";
NSString *const FAQ_SCREEN = @"FAQScreen";
NSString *const PART_POPUP_SCREEN = @"PartPopupScreen";
NSString *const DONATION_POPUP_SCREEN = @"DonationPopupScreen";

NSString *const ACCELERATION_STRING = @"Acceleration";
NSString *const AVERAGE_SPEED_STRING = @"Average Speed";
NSString *const GROUND_SPEED_STRING = @"Ground Speed";
NSString *const ANTIGRAVITY_SPEED_STRING = @"Antigravity Speed";
NSString *const AIR_SPEED_STRING = @"Air Speed";
NSString *const WATER_SPEED_STRING = @"Water Speed";
NSString *const AVERAGE_HANDLING_STRING = @"Average Handling";
NSString *const GROUND_HANDLING_STRING = @"Ground Handling";
NSString *const ANTIGRAVITY_HANDLING_STRING = @"Antigravity Handling";
NSString *const AIR_HANDLING_STRING = @"Air Handling";
NSString *const WATER_HANDLING_STRING = @"Water Handling";
NSString *const MINITURBO_STRING = @"Miniturbo";
NSString *const TRACTION_STRING = @"Traction";
NSString *const WEIGHT_STRING = @"Weight";

// Parts.
NSString *const CHARACTER_STRING = @"Character";
NSString *const VEHICLE_STRING = @"Vehicle";
NSString *const TIRE_STRING = @"Tire";
NSString *const GLIDER_STRING = @"Glider";

// Character groups.
NSString *const FLYWEIGHT_NAME_STRING = @"FLYWEIGHT";
NSString *const FEATHERWEIGHT_NAME_STRING = @"FEATHERWEIGHT";
NSString *const LIGHTWEIGHT_NAME_STRING = @"LIGHTWEIGHT";
NSString *const MIDDLEWEIGHT_NAME_STRING = @"MIDDLEWEIGHT";
NSString *const CRUISERWEIGHT_NAME_STRING = @"CRUISERWEIGHT";
NSString *const METALWEIGHT_NAME_STRING = @"METALWEIGHT";
NSString *const HEAVYWEIGHT_NAME_STRING = @"HEAVYWEIGHT";

NSString *const FLYWEIGHT_STRING = @"Flyweight";
NSString *const FEATHERWEIGHT_STRING = @"Featherweight";
NSString *const LIGHTWEIGHT_STRING = @"Lightweight";
NSString *const MIDDLEWEIGHT_STRING = @"Middleweight";
NSString *const CRUISERWEIGHT_STRING = @"Cruiserweight";
NSString *const METALWEIGHT_STRING = @"Metalweight";
NSString *const HEAVYWEIGHT_STRING = @"Heavyweight";

// Character names.
// Lightweights.
NSString *const BABY_MARIO_NAME_STRING = @"BABY_MARIO";
NSString *const BABY_LUIGI_NAME_STRING = @"BABY_LUIGI";
NSString *const BABY_PEACH_NAME_STRING = @"BABY_PEACH";
NSString *const BABY_DAISY_NAME_STRING = @"BABY_DAISY";
NSString *const BABY_ROSALINA_NAME_STRING = @"BABY_ROSALINA";
NSString *const LEMMY_NAME_STRING = @"LEMMY";

NSString *const BABY_MARIO_DISPLAY_NAME_STRING = @"Baby Mario";
NSString *const BABY_LUIGI_DISPLAY_NAME_STRING = @"Baby Luigi";
NSString *const BABY_PEACH_DISPLAY_NAME_STRING = @"Baby Peach";
NSString *const BABY_DAISY_DISPLAY_NAME_STRING = @"Baby Daisy";
NSString *const BABY_ROSALINA_DISPLAY_NAME_STRING = @"Baby Rosalina";
NSString *const LEMMY_DISPLAY_NAME_STRING = @"Lemmy";

// Featherweights.
NSString *const TOAD_NAME_STRING = @"TOAD";
NSString *const KOOPA_TROOPA_NAME_STRING = @"KOOPA_TROOPA";
NSString *const SHY_GUY_NAME_STRING = @"SHY_GUY";
NSString *const LAKITU_NAME_STRING = @"LAKITU";
NSString *const TOADETTE_NAME_STRING = @"TOADETTE";
NSString *const LARRY_NAME_STRING = @"LARRY";
NSString *const WENDY_NAME_STRING = @"WENDY";

NSString *const TOAD_DISPLAY_NAME_STRING = @"Toad";
NSString *const KOOPA_TROOPA_DISPLAY_NAME_STRING = @"Koopa Troopa";
NSString *const SHY_GUY_DISPLAY_NAME_STRING = @"Shy Guy";
NSString *const LAKITU_DISPLAY_NAME_STRING = @"Lakitu";
NSString *const TOADETTE_DISPLAY_NAME_STRING = @"Toadette";
NSString *const LARRY_DISPLAY_NAME_STRING = @"Larry";
NSString *const WENDY_DISPLAY_NAME_STRING = @"Wendy";

// Lightweights.
NSString *const PEACH_NAME_STRING = @"PEACH";
NSString *const DAISY_NAME_STRING = @"DAISY";
NSString *const YOSHI_NAME_STRING = @"YOSHI";

NSString *const PEACH_DISPLAY_NAME_STRING = @"Peach";
NSString *const DAISY_DISPLAY_NAME_STRING = @"Daisy";
NSString *const YOSHI_DISPLAY_NAME_STRING = @"Yoshi";

// Middleweights.
NSString *const MARIO_NAME_STRING = @"MARIO";
NSString *const LUIGI_NAME_STRING = @"LUIGI";
NSString *const IGGY_NAME_STRING = @"IGGY";
NSString *const LUDWIG_NAME_STRING = @"LUDWIG";

NSString *const MARIO_DISPLAY_NAME_STRING = @"Mario";
NSString *const LUIGI_DISPLAY_NAME_STRING = @"Luigi";
NSString *const IGGY_DISPLAY_NAME_STRING = @"Iggy";
NSString *const LUDWIG_DISPLAY_NAME_STRING = @"Ludwig";

// Cruiserweights.
NSString *const DONKEY_KONG_NAME_STRING = @"DONKEY_KONG";
NSString *const WALUIGI_NAME_STRING = @"WALUIGI";
NSString *const ROSALINA_NAME_STRING = @"ROSALINA";
NSString *const ROY_NAME_STRING = @"ROY";

NSString *const DONKEY_KONG_DISPLAY_NAME_STRING = @"Donkey Kong";
NSString *const WALUIGI_DISPLAY_NAME_STRING = @"Waluigi";
NSString *const ROSALINA_DISPLAY_NAME_STRING = @"Rosalina";
NSString *const ROY_DISPLAY_NAME_STRING = @"Roy";

// Metalweights.
NSString *const METAL_MARIO_NAME_STRING = @"METAL_MARIO";
NSString *const PINK_GOLD_PEACH_NAME_STRING = @"PINK_GOLD_PEACH";

NSString *const METAL_MARIO_DISPLAY_NAME_STRING = @"Metal Mario";
NSString *const PINK_GOLD_PEACH_DISPLAY_NAME_STRING = @"Pink Gold Peach";

// Heavyweights.
NSString *const BOWSER_NAME_STRING = @"BOWSER";
NSString *const WARIO_NAME_STRING = @"WARIO";
NSString *const MORTON_NAME_STRING = @"MORTON";

NSString *const BOWSER_DISPLAY_NAME_STRING = @"Bowser";
NSString *const WARIO_DISPLAY_NAME_STRING = @"Wario";
NSString *const MORTON_DISPLAY_NAME_STRING = @"Morton";

// Vehicle groups (Display names are generated through CMKPartGroup).
NSString *const VEHICLE_A_NAME_STRING = @"A";
NSString *const VEHICLE_B_NAME_STRING = @"B";
NSString *const VEHICLE_C_NAME_STRING = @"C";
NSString *const VEHICLE_D_NAME_STRING = @"D";
NSString *const VEHICLE_E_NAME_STRING = @"E";
NSString *const VEHICLE_F_NAME_STRING = @"F";

// Vehicle class A.
NSString *const STANDARD_KART_NAME_STRING = @"STANDARD_KART";
NSString *const CAT_CRUISER_NAME_STRING = @"CAT_CRUISER";
NSString *const PRANCER_NAME_STRING = @"PRANCER";
NSString *const SNEEKER_NAME_STRING = @"SNEEKER";
NSString *const THE_DUKE_NAME_STRING = @"THE_DUKE";
NSString *const TEDDY_BUGGY_NAME_STRING = @"TEDDY_BUGGY";
NSString *const THREE_HUNDRED_SL_ROADSTER_NAME_STRING = @"THREE_HUNDRED_SL_ROADTSER";

NSString *const STANDARD_KART_DISPLAY_NAME_STRING = @"Standard Kart";
NSString *const CAT_CRUISER_DISPLAY_NAME_STRING = @"Cat Cruiser";
NSString *const PRANCER_DISPLAY_NAME_STRING = @"Prancer";
NSString *const SNEEKER_DISPLAY_NAME_STRING = @"Sneeker";
NSString *const THE_DUKE_DISPLAY_NAME_STRING = @"The Duke";
NSString *const TEDDY_BUGGY_DISPLAY_NAME_STRING = @"Teddy Buggy";
NSString *const THREE_HUNDRED_SL_ROADSTER_DISPLAY_NAME_STRING = @"300 SL Roadster";

// Vehicle class B.
NSString *const PIPE_FRAME_NAME_STRING = @"PIPE_FRAME";
NSString *const STANDARD_BIKE_NAME_STRING = @"STANDAR_BIKE";
NSString *const FLAME_RIDER_NAME_STRING = @"FLAME_RIDER";
NSString *const VARMINT_NAME_STRING = @"VARMINT";
NSString *const WILD_WIGGLER_NAME_STRING = @"WILD_WIGGLER";
NSString *const W_25_SILVER_ARROW_NAME_STRING = @"W_25_SILVER_ARROW";

NSString *const PIPE_FRAME_DISPLAY_NAME_STRING = @"Pipe Frame";
NSString *const STANDARD_BIKE_DISPLAY_NAME_STRING = @"Standard Bike";
NSString *const FLAME_RIDER_DISPLAY_NAME_STRING = @"Flame Rider";
NSString *const VARMINT_DISPLAY_NAME_STRING = @"Varmint";
NSString *const WILD_WIGGLER_DISPLAY_NAME_STRING = @"Wild Wiggler";
NSString *const W_25_SILVER_ARROW_DISPLAY_NAME_STRING = @"W 25 Silver Arrow";

// Vehicle class C.
NSString *const MACH_8_NAME_STRING = @"MACH_8";
NSString *const CIRCUIT_SPECIAL_NAME_STRING = @"CIRCUIT_SPECIAL";
NSString *const SPORTS_COUPE_NAME_STRING = @"SPORTS_COUPE";
NSString *const GOLD_STANDARD_NAME_STRING = @"GOLD_STANDARD";

NSString *const MACH_8_DISPLAY_NAME_STRING = @"Mach 8";
NSString *const CIRCUIT_SPECIAL_DISPLAY_NAME_STRING = @"Circuit Special";
NSString *const SPORTS_COUPE_DISPLAY_NAME_STRING = @"Sports Coupe";
NSString *const GOLD_STANDARD_DISPLAY_NAME_STRING = @"Gold Standard";

// Vehicle class D.
NSString *const STEEL_DRIVER_NAME_STRING = @"STEEL_DRIVER";
NSString *const TRI_SPEEDER_NAME_STRING = @"TRI_SPEEDER";
NSString *const BADWAGON_NAME_STRING = @"BADWAGON";
NSString *const STANDARD_ATV_NAME_STRING = @"STANDARD_ATV";
NSString *const GLA_NAME_STRING = @"GLA";

NSString *const STEEL_DRIVER_DISPLAY_NAME_STRING = @"Steel Driver";
NSString *const TRI_SPEEDER_DISPLAY_NAME_STRING = @"Tri Speeder";
NSString *const BADWAGON_DISPLAY_NAME_STRING = @"Badwagon";
NSString *const STANDARD_ATV_DISPLAY_NAME_STRING = @"Standard ATV";
NSString *const GLA_DISPLAY_NAME_STRING = @"GLA";

// Vehicle class E.
NSString *const BIDDYBUGGY_NAME_STRING = @"BIDDYBUGGY";
NSString *const LANDSHIP_NAME_STRING = @"LANDSHIP";
NSString *const MR_SCOOTY_NAME_STRING = @"MR_SCOOTY";

NSString *const BIDDYBUGGY_DISPLAY_NAME_STRING = @"Biddybuggy";
NSString *const LANDSHIP_DISPLAY_NAME_STRING = @"Landship";
NSString *const MR_SCOOTY_DISPLAY_NAME_STRING = @"Mr. Scooty";

// Vehicle class F.
NSString *const COMET_NAME_STRING = @"COMET";
NSString *const SPORTS_BIKE_NAME_STRING = @"SPORTS_BIKE";
NSString *const JET_BIKE_NAME_STRING = @"JET_BIKE";
NSString *const YOSHI_BIKE_NAME_STRING = @"YOSHI_BIKE";

NSString *const COMET_DISPLAY_NAME_STRING = @"Comet";
NSString *const SPORTS_BIKE_DISPLAY_NAME_STRING = @"Sports Bike";
NSString *const JET_BIKE_DISPLAY_NAME_STRING = @"Jet Bike";
NSString *const YOSHI_BIKE_DISPLAY_NAME_STRING = @"Yoshi Bike";

// Tire groups (Analytics names only. Display names are generated through CMKPartGroup).
NSString *const TIRE_A_NAME_STRING = @"A";
NSString *const TIRE_B_NAME_STRING = @"B";
NSString *const TIRE_C_NAME_STRING = @"C";
NSString *const TIRE_D_NAME_STRING = @"D";
NSString *const TIRE_E_NAME_STRING = @"E";
NSString *const TIRE_F_NAME_STRING = @"F";
NSString *const TIRE_G_NAME_STRING = @"G";

// Tire class A.
NSString *const STANDARD_NAME_STRING = @"STANDARD";
NSString *const OFF_ROAD_NAME_STRING = @"OFF_ROAD";
NSString *const BLUE_STANDARD_NAME_STRING = @"BLUE_STANDARD";
NSString *const RETRO_OFF_ROAD_NAME_STRING = @"RETRO_OFF_ROAD";
NSString *const GLA_TIRES_NAME_STRING = @"GLA_TIRES";

NSString *const STANDARD_DISPLAY_NAME_STRING = @"Standard";
NSString *const OFF_ROAD_DISPLAY_NAME_STRING = @"Off-Road";
NSString *const BLUE_STANDARD_DISPLAY_NAME_STRING = @"Blue Standard";
NSString *const RETRO_OFF_ROAD_DISPLAY_NAME_STRING = @"Retro Off-Road";
NSString *const GLA_TIRES_DISPLAY_NAME_STRING = @"GLA Tires";

// Tire class B.
NSString *const MONSTER_NAME_STRING = @"MONSTER";
NSString *const HOT_MONSTER_NAME_STRING = @"HOT_MONSTER";

NSString *const MONSTER_DISPLAY_NAME_STRING = @"Monster";
NSString *const HOT_MONSTER_DISPLAY_NAME_STRING = @"Hot Monster";

// Tire class C.
NSString *const ROLLER_NAME_STRING = @"ROLLER";
NSString *const BUTTON_NAME_STRING = @"BUTTON";
NSString *const AZURE_ROLLER_NAME_STRING = @"AZURE_ROLLER";

NSString *const ROLLER_DISPLAY_NAME_STRING = @"Roller";
NSString *const BUTTON_DISPLAY_NAME_STRING = @"Button";
NSString *const AZURE_ROLLER_DISPLAY_NAME_STRING = @"Azure Roller";

// Tire class D.
NSString *const SLIM_NAME_STRING = @"SLIM";
NSString *const CRIMSON_SLIM_NAME_STRING = @"CRIMSON_SLIM";

NSString *const SLIM_DISPLAY_NAME_STRING = @"Slim";
NSString *const CRIMSON_SLIM_DISPLAY_NAME_STRING = @"Crimson Slim";

// Tire class E.
NSString *const SLICK_NAME_STRING = @"SLICK";
NSString *const CYBER_SLICK_NAME_STRING = @"CYBER_SLICK";

NSString *const SLICK_DISPLAY_NAME_STRING = @"Slick";
NSString *const CYBER_SLICK_DISPLAY_NAME_STRING = @"Cyber Slick";

// Tire class F.
NSString *const METAL_NAME_STRING = @"METAL";
NSString *const GOLD_TIRES_NAME_STRING = @"GOLD_TIRES";

NSString *const METAL_DISPLAY_NAME_STRING = @"Metal";
NSString *const GOLD_TIRES_DISPLAY_NAME_STRING = @"Gold Tires";

// Tire class G.
NSString *const SPONGE_NAME_STRING = @"SPONGE";
NSString *const WOOD_NAME_STRING = @"WOOD";
NSString *const CUSHION_NAME_STRING = @"CUSHION";

NSString *const SPONGE_DISPLAY_NAME_STRING = @"Sponge";
NSString *const WOOD_DISPLAY_NAME_STRING = @"Wood";
NSString *const CUSHION_DISPLAY_NAME_STRING = @"Cushion";

// Glider groups (Analytics names only. Display names are generated through CMKPartGroup).
NSString *const GLIDER_A_NAME_STRING = @"A";
NSString *const GLIDER_B_NAME_STRING = @"B";

// Glider class A.
NSString *const SUPER_GLIDER_NAME_STRING = @"SUPER_GLIDER";
NSString *const WARIO_WING_NAME_STRING = @"WARIO_WING";
NSString *const WADDLE_WING_NAME_STRING = @"WADDLE_WING";
NSString *const PLANE_GLIDER_NAME_STRING = @"PLANE_GLIDER";
NSString *const GOLD_GLIDER_NAME_STRING = @"GOLD_GLIDER";

NSString *const SUPER_GLIDER_DISPLAY_NAME_STRING = @"Super Glider";
NSString *const WARIO_WING_DISPLAY_NAME_STRING = @"Wario Wing";
NSString *const WADDLE_WING_DISPLAY_NAME_STRING = @"Waddle Wing";
NSString *const PLANE_GLIDER_DISPLAY_NAME_STRING = @"Plane Gider";
NSString *const GOLD_GLIDER_DISPLAY_NAME_STRING = @"Gold Glider";

// Glider class B.
NSString *const CLOUD_GLIDER_NAME_STRING = @"CLOUD_GLIDER";
NSString *const PEACH_PARASOL_NAME_STRING = @"PEACH_PARASOL";
NSString *const PARACHUTE_NAME_STRING = @"PARACHUTE";
NSString *const PARAFOIL_NAME_STRING = @"PARAFOIL";
NSString *const FLOWER_GLIDER_NAME_STRING = @"FLOWER_GLIDER";
NSString *const BOWSER_KITE_NAME_STRING = @"BOWSER_KITE";
NSString *const MKTV_PARAFOIL_NAME_STRING = @"MKTV_PARAFOIL";

NSString *const CLOUD_GLIDER_DISPLAY_NAME_STRING = @"Cloud Glider";
NSString *const PEACH_PARASOL_DISPLAY_NAME_STRING = @"Peach Parasol";
NSString *const PARACHUTE_DISPLAY_NAME_STRING = @"Parachute";
NSString *const PARAFOIL_DISPLAY_NAME_STRING = @"Parafoil";
NSString *const FLOWER_GLIDER_DISPLAY_NAME_STRING = @"Flower Glider";
NSString *const BOWSER_KITE_DISPLAY_NAME_STRING = @"Bowser Kite";
NSString *const MKTV_PARAFOIL_DISPLAY_NAME_STRING = @"MKTV Parafoil";

// Cups.
NSString *const MUSHROOM_CUP_NAME_STRING = @"MUSHROOM_CUP";
NSString *const FLOWER_CUP_NAME_STRING = @"FLOWER_CUP";
NSString *const STAR_CUP_NAME_STRING = @"STAR_CUP";
NSString *const SPECIAL_CUP_NAME_STRING = @"SPECIAL_CUP";
NSString *const SHELL_CUP_NAME_STRING = @"SHELL_CUP";
NSString *const BANANA_CUP_NAME_STRING = @"BANANA_CUP";
NSString *const LEAF_CUP_NAME_STRING = @"LEAF_CUP";
NSString *const LIGHTNING_CUP_NAME_STRING = @"LIGHTNING_CUP";

NSString *const MUSHROOM_CUP_DISPLAY_NAME_STRING = @"Mushroom Cup";
NSString *const FLOWER_CUP_DISPLAY_NAME_STRING = @"Flower Cup";
NSString *const STAR_CUP_DISPLAY_NAME_STRING = @"Star Cup";
NSString *const SPECIAL_CUP_DISPLAY_NAME_STRING = @"Special Cup";
NSString *const SHELL_CUP_DISPLAY_NAME_STRING = @"Shell Cup";
NSString *const BANANA_CUP_DISPLAY_NAME_STRING = @"Banana Cup";
NSString *const LEAF_CUP_DISPLAY_NAME_STRING = @"Leaf Cup";
NSString *const LIGHTNING_CUP_DISPLAY_NAME_STRING = @"Lightning Cup";

// Courses.

// Mushroom Cup.
NSString *const MARIO_KART_STADIUM_NAME_STRING = @"MARIO_KART_STADIUM";
NSString *const WATER_PARK_NAME_STRING = @"WATER_PARK";
NSString *const SWEET_SWEET_CANYON_NAME_STRING = @"SWEET_SWEET_CANYON";
NSString *const THWOMP_RUINS_NAME_STRING = @"THWOMP_RUINS";

NSString *const MARIO_KART_STADIUM_DISPLAY_NAME_STRING = @"Mario Kart Stadium";
NSString *const WATER_PARK_DISPLAY_NAME_STRING = @"Water Park";
NSString *const SWEET_SWEET_CANYON_DISPLAY_NAME_STRING = @"Sweet Sweet Canyon";
NSString *const THWOMP_RUINS_DISPLAY_NAME_STRING = @"Thwomp Ruins";


// Flower Cup.
NSString *const MARIO_CIRCUIT_NAME_STRING = @"MARIO_CIRCUIT";
NSString *const TOAD_HARBOR_NAME_STRING = @"TOAD_HARBOR";
NSString *const TWISTED_MANSION_NAME_STRING = @"TWISTED_MANSION";
NSString *const SHY_GUY_FALLS_NAME_STRING = @"SHY_GUY_FALLS";

NSString *const MARIO_CIRCUIT_DISPLAY_NAME_STRING = @"Mario Circuit";
NSString *const TOAD_HARBOR_DISPLAY_NAME_STRING = @"Toad Harbor";
NSString *const TWISTED_MANSION_DISPLAY_NAME_STRING = @"Twisted Mansion";
NSString *const SHY_GUY_FALLS_DISPLAY_NAME_STRING = @"Shy Guy Falls";

// Star Cup.
NSString *const SUNSHINE_AIRPORT_NAME_STRING = @"SUNSHINE_AIRPORT";
NSString *const DOLPHIN_SHOALS_NAME_STRING = @"DOLPHIN_SHOALS";
NSString *const ELECTRODROME_NAME_STRING = @"ELECTRODROME";
NSString *const MOUNT_WARIO_NAME_STRING = @"MOUNT_WARIO";

NSString *const SUNSHINE_AIRPORT_DISPLAY_NAME_STRING = @"Sunshine Airport";
NSString *const DOLPHIN_SHOALS_DISPLAY_NAME_STRING = @"Dolphin Shoals";
NSString *const ELECTRODROME_DISPLAY_NAME_STRING = @"Electrodrome";
NSString *const MOUNT_WARIO_DISPLAY_NAME_STRING = @"Mount Wario";

// Special Cup.
NSString *const CLOUDTOP_CRUISE_NAME_STRING = @"CLOUDTOP_CRUISE";
NSString *const BONE_DRY_DUNES_NAME_STRING = @"BONE_DRY_DUNES";
NSString *const BOWSERS_CASTLE_NAME_STRING = @"BOWSERS_CASTLE";
NSString *const RAINBOW_ROAD_NAME_STRING = @"RAINBOW_ROAD";

NSString *const CLOUDTOP_CRUISE_DISPLAY_NAME_STRING = @"Cloudtop Cruise";
NSString *const BONE_DRY_DUNES_DISPLAY_NAME_STRING = @"Bone-Dry Dunes";
NSString *const BOWSERS_CASTLE_DISPLAY_NAME_STRING = @"Bowser's Castle";
NSString *const RAINBOW_ROAD_DISPLAY_NAME_STRING = @"Rainbow Road";

// Shell Cup.
NSString *const MOO_MOO_MEADOWS_NAME_STRING = @"MOO_MOO_MEADOWS";
NSString *const MARIO_CIRCUIT_GBA_NAME_STRING = @"MARIO_CIRCUIT_GBA";
NSString *const CHEEP_CHEEP_BEACH_NAME_STRING = @"CHEEP_CHEEP_BEACH";
NSString *const TOADS_TURNPIKE_NAME_STRING = @"TOADS_TURNPIKE";

NSString *const MOO_MOO_MEADOWS_DISPLAY_NAME_STRING = @"Moo Moo Meadows";
NSString *const MARIO_CIRCUIT_GBA_DISPLAY_NAME_STRING = @"Mario Circuit (GBA)";
NSString *const CHEEP_CHEEP_BEACH_DISPLAY_NAME_STRING = @"Cheep Cheep Beach";
NSString *const TOADS_TURNPIKE_DISPLAY_NAME_STRING = @"Toad's Turnpike";

// Banana Cup.
NSString *const DRY_DRY_DESERT_NAME_STRING = @"DRY_DRY_DESERT";
NSString *const DONUT_PLAINS_3_NAME_STRING = @"DONUT_PLAINS_3";
NSString *const ROYAL_RACEWAY_NAME_STRING = @"ROYAL_RACEWAY";
NSString *const DK_JUNGLE_NAME_STRING = @"DK_JUNGLE";

NSString *const DRY_DRY_DESERT_DISPLAY_NAME_STRING = @"Dry Dry Desert";
NSString *const DONUT_PLAINS_3_DISPLAY_NAME_STRING = @"Donut Plains 3";
NSString *const ROYAL_RACEWAY_DISPLAY_NAME_STRING = @"Royal Raceway";
NSString *const DK_JUNGLE_DISPLAY_NAME_STRING = @"DK Jungle";

// Leaf Cup.
NSString *const WARIO_STADIUM_NAME_STRING = @"WARIO_STADIUM";
NSString *const SHERBET_LAND_NAME_STRING = @"SHERBET_LAND";
NSString *const MUSIC_PARK_NAME_STRING = @"MUSIC_PARK";
NSString *const YOSHI_VALLEY_NAME_STRING = @"YOSHI_VALLEY";

NSString *const WARIO_STADIUM_DISPLAY_NAME_STRING = @"Wario Stadium";
NSString *const SHERBET_LAND_DISPLAY_NAME_STRING = @"Sherbet Land";
NSString *const MUSIC_PARK_DISPLAY_NAME_STRING = @"Music Park";
NSString *const YOSHI_VALLEY_DISPLAY_NAME_STRING = @"Yoshi Valley";

// Lightning Cup.
NSString *const TICK_TOCK_CLOCK_NAME_STRING = @"TICK_TOCK_CLOCK";
NSString *const PIRANHA_PLANT_SLIDE_NAME_STRING = @"PIRANHA_PLANT_SLIDE";
NSString *const GRUMBLE_VOLCANO_NAME_STRING = @"GRUMBLE_VOLCANO";
NSString *const RAINBOW_ROAD_N64_NAME_STRING = @"RAINBOW_ROAD_N64";

NSString *const TICK_TOCK_CLOCK_DISPLAY_NAME_STRING = @"Tick-Tock Clock";
NSString *const PIRANHA_PLANT_SLIDE_DISPLAY_NAME_STRING = @"Piranha Plant Slide";
NSString *const GRUMBLE_VOLCANO_DISPLAY_NAME_STRING = @"Grumble Volcano";
NSString *const RAINBOW_ROAD_N64_DISPLAY_NAME_STRING = @"Rainbow Road (N64)";
