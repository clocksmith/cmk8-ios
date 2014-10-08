//
//  CMKConstants.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/7/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//
//  NOTE: The part name strings are an artificat from the Android app and are needed for Google
//  Analytics.

// IDs, Keys, wallets.
extern NSString *const APP_ID;
extern NSString *const BITCOIN_ADDRESS;

// Dimensions.
// Font sizes.
extern int const DEFAULT_FONT_SIZE_IPHONE;
extern int const DEFAULT_FONT_SIZE_IPAD;
extern int const DEFAULT_TITLE_FONT_SIZE_IPHONE;
extern int const DEFAULT_TITLE_FONT_SIZE_IPAD;
extern int const DEFAULT_SPINNER_FONT_SIZE_IPHONE;
extern int const DEFAULT_SPINNER_FONT_SIZE_IPAD;
extern int const PART_GROUP_VIEW_TITLE_FONT_SIZE_IPHONE;
extern int const PART_GROUP_VIEW_TITLE_FONT_SIZE_IPAD;
extern int const COMPARE_SPINNER_FONT_SIZE_IPHONE;
extern int const COMPARE_SPINNER_FONT_SIZE_IPAD;
extern int const COURSE_SPINNER_LIST_VIEW_FONT_SIZE_IPHONE;
extern int const ADJUST_BUTTON_FONT_SIZE_IPHONE;
extern int const ADJUST_BUTTON_FONT_SIZE_IPAD;
extern int const FAQ_BUTTON_FONT_SIZE_IPHONE;
extern int const FAQ_BUTTON_FONT_SIZE_IPAD;
// View sizes.
extern int const MAIN_TAB_BAR_HEIGHT;
extern int const MAIN_TAB_ICON_SIZE;
extern int const CUP_SPINNER_DROPDOWN_ITEM_HEIGHT_IPHONE;
extern int const CUP_SPINNER_DROPDOWN_ITEM_HEIGHT_IPAD;
extern int const COURSE_SPINNER_DROPDOWN_ITEM_HEIGHT_IPHONE;
extern int const COURSE_SPINNER_DROPDOWN_ITEM_HEIGHT_IPAD;
extern int const PART_GROUP_VIEW_TITLE_HEIGHT_IPHONE;
extern int const PART_GROUP_VIEW_TITLE_HEIGHT_IPAD;

// Values.
extern int const MAX_NUM_PARTS_PER_GROUP;
extern int const NUM_COURSES_PER_CUP;
extern float const MAX_TOTAL_STATS_VALUE;
extern float const MAX_SMALL_PART_STATS_VALUE;
extern float const STATS_BAR_CHANGE_DURATION_S;
extern float const POPUP_SHADE_ALPHA;
extern float const POPUP_TRANSITION_DURAION_S;
extern float const POPUP_CONTENT_CORNER_RADIUS;
extern float const POPUP_CONTENT_SHADOW_RADIUS;
extern float const POPUP_SHADOW_OPACITY;

// Strings.
extern NSString *const NAMESPACE_SEPERATOR;
extern NSString *const KEY_SEPERATOR;
extern NSString *const NAME_SEPERATOR;

// Fonts.
extern NSString *const HELVETICA_NEUE_FONT;
extern NSString *const HELVETICA_NEUE_BOLD_FONT;
extern NSString *const HELVETICA_NEUE_ITALIC_FONT;
extern NSString *const HELVETICA_NEUE_LIGHT_FONT;
extern NSString *const HELVETICA_NEUE_MEDIUM_FONT;

// Image names.
extern NSString *const CONFIGURE_ICON_IMAGE;
extern NSString *const COMPARE_ICON_IMAGE;
extern NSString *const MAPS_ICON_IMAGE;
extern NSString *const FAQ_ICON_IMAGE;

// UI Strings.
extern NSString *const CONFIGURE_TITLE_STRING;
extern NSString *const COMPARE_TITLE_STRING;
extern NSString *const MAPS_TITLE_STRING;
extern NSString *const FAQ_TITLE_STRING;

// Analytics screen names.
extern NSString *const ADJUST_SCREEN;
extern NSString *const CONFIGURE_SCREEN;
extern NSString *const COMPARE_SCREEN;
extern NSString *const FAQ_SCREEN;
extern NSString *const PART_POPUP_SCREEN;
extern NSString *const DONATION_POPUP_SCREEN;

// Attributes.
extern NSString *const ACCELERATION_STRING;
extern NSString *const AVERAGE_SPEED_STRING;
extern NSString *const GROUND_SPEED_STRING;
extern NSString *const ANTIGRAVITY_SPEED_STRING;
extern NSString *const AIR_SPEED_STRING;
extern NSString *const WATER_SPEED_STRING;
extern NSString *const AVERAGE_HANDLING_STRING;
extern NSString *const GROUND_HANDLING_STRING;
extern NSString *const ANTIGRAVITY_HANDLING_STRING;
extern NSString *const AIR_HANDLING_STRING;
extern NSString *const WATER_HANDLING_STRING;
extern NSString *const MINITURBO_STRING;
extern NSString *const TRACTION_STRING;
extern NSString *const WEIGHT_STRING;

// Parts.
extern NSString *const CHARACTER_STRING;
extern NSString *const VEHICLE_STRING;
extern NSString *const TIRE_STRING;
extern NSString *const GLIDER_STRING;

// Character groups.
extern NSString *const FLYWEIGHT_NAME_STRING;
extern NSString *const FEATHERWEIGHT_NAME_STRING;
extern NSString *const LIGHTWEIGHT_NAME_STRING;
extern NSString *const MIDDLEWEIGHT_NAME_STRING;
extern NSString *const CRUISERWEIGHT_NAME_STRING;
extern NSString *const METALWEIGHT_NAME_STRING;
extern NSString *const HEAVYWEIGHT_NAME_STRING;

extern NSString *const FLYWEIGHT_STRING;
extern NSString *const FEATHERWEIGHT_STRING;
extern NSString *const LIGHTWEIGHT_STRING;
extern NSString *const MIDDLEWEIGHT_STRING;
extern NSString *const CRUISERWEIGHT_STRING;
extern NSString *const METALWEIGHT_STRING;
extern NSString *const HEAVYWEIGHT_STRING;

// Character names.
// Flyweights.
extern NSString *const BABY_MARIO_NAME_STRING;
extern NSString *const BABY_LUIGI_NAME_STRING;
extern NSString *const BABY_PEACH_NAME_STRING;
extern NSString *const BABY_DAISY_NAME_STRING;
extern NSString *const BABY_ROSALINA_NAME_STRING;
extern NSString *const LEMMY_NAME_STRING;

extern NSString *const BABY_MARIO_DISPLAY_NAME_STRING;
extern NSString *const BABY_LUIGI_DISPLAY_NAME_STRING;
extern NSString *const BABY_PEACH_DISPLAY_NAME_STRING;
extern NSString *const BABY_DAISY_DISPLAY_NAME_STRING;
extern NSString *const BABY_ROSALINA_DISPLAY_NAME_STRING;
extern NSString *const LEMMY_DISPLAY_NAME_STRING;

// Featherweights.
extern NSString *const TOAD_NAME_STRING;
extern NSString *const KOOPA_TROOPA_NAME_STRING;
extern NSString *const SHY_GUY_NAME_STRING;
extern NSString *const LAKITU_NAME_STRING;
extern NSString *const TOADETTE_NAME_STRING;
extern NSString *const LARRY_NAME_STRING;
extern NSString *const WENDY_NAME_STRING;

extern NSString *const TOAD_DISPLAY_NAME_STRING;
extern NSString *const KOOPA_TROOPA_DISPLAY_NAME_STRING;
extern NSString *const SHY_GUY_DISPLAY_NAME_STRING;
extern NSString *const LAKITU_DISPLAY_NAME_STRING;
extern NSString *const TOADETTE_DISPLAY_NAME_STRING;
extern NSString *const LARRY_DISPLAY_NAME_STRING;
extern NSString *const WENDY_DISPLAY_NAME_STRING;

// Lightweights.
extern NSString *const PEACH_NAME_STRING;
extern NSString *const DAISY_NAME_STRING;
extern NSString *const YOSHI_NAME_STRING;

extern NSString *const PEACH_DISPLAY_NAME_STRING;
extern NSString *const DAISY_DISPLAY_NAME_STRING;
extern NSString *const YOSHI_DISPLAY_NAME_STRING;

// Middleweights.
extern NSString *const MARIO_NAME_STRING;
extern NSString *const LUIGI_NAME_STRING;
extern NSString *const IGGY_NAME_STRING;
extern NSString *const LUDWIG_NAME_STRING;

extern NSString *const MARIO_DISPLAY_NAME_STRING;
extern NSString *const LUIGI_DISPLAY_NAME_STRING;
extern NSString *const IGGY_DISPLAY_NAME_STRING;
extern NSString *const LUDWIG_DISPLAY_NAME_STRING;

// Cruiserweights.
extern NSString *const DONKEY_KONG_NAME_STRING;
extern NSString *const WALUIGI_NAME_STRING;
extern NSString *const ROSALINA_NAME_STRING;
extern NSString *const ROY_NAME_STRING;

extern NSString *const DONKEY_KONG_DISPLAY_NAME_STRING;
extern NSString *const WALUIGI_DISPLAY_NAME_STRING;
extern NSString *const ROSALINA_DISPLAY_NAME_STRING;
extern NSString *const ROY_DISPLAY_NAME_STRING;

// Metalweights.
extern NSString *const METAL_MARIO_NAME_STRING;
extern NSString *const PINK_GOLD_PEACH_NAME_STRING;

extern NSString *const METAL_MARIO_DISPLAY_NAME_STRING;
extern NSString *const PINK_GOLD_PEACH_DISPLAY_NAME_STRING;

// Heavyweights.
extern NSString *const BOWSER_NAME_STRING;
extern NSString *const WARIO_NAME_STRING;
extern NSString *const MORTON_NAME_STRING;

extern NSString *const BOWSER_DISPLAY_NAME_STRING;
extern NSString *const WARIO_DISPLAY_NAME_STRING;
extern NSString *const MORTON_DISPLAY_NAME_STRING;

// Vehicle groups (Analytics names only. Display names are generated through CMKPartGroup).
extern NSString *const VEHICLE_A_NAME_STRING;
extern NSString *const VEHICLE_B_NAME_STRING;
extern NSString *const VEHICLE_C_NAME_STRING;
extern NSString *const VEHICLE_D_NAME_STRING;
extern NSString *const VEHICLE_E_NAME_STRING;
extern NSString *const VEHICLE_F_NAME_STRING;

// Vehicle class A.
extern NSString *const STANDARD_KART_NAME_STRING;
extern NSString *const CAT_CRUISER_NAME_STRING;
extern NSString *const PRANCER_NAME_STRING;
extern NSString *const SNEEKER_NAME_STRING;
extern NSString *const THE_DUKE_NAME_STRING;
extern NSString *const TEDDY_BUGGY_NAME_STRING;
extern NSString *const THREE_HUNDRED_SL_ROADSTER_NAME_STRING;

extern NSString *const STANDARD_KART_DISPLAY_NAME_STRING;
extern NSString *const CAT_CRUISER_DISPLAY_NAME_STRING;
extern NSString *const PRANCER_DISPLAY_NAME_STRING;
extern NSString *const SNEEKER_DISPLAY_NAME_STRING;
extern NSString *const THE_DUKE_DISPLAY_NAME_STRING;
extern NSString *const TEDDY_BUGGY_DISPLAY_NAME_STRING;
extern NSString *const THREE_HUNDRED_SL_ROADSTER_DISPLAY_NAME_STRING;

// Vehicle class B.
extern NSString *const PIPE_FRAME_NAME_STRING;
extern NSString *const STANDARD_BIKE_NAME_STRING;
extern NSString *const FLAME_RIDER_NAME_STRING;
extern NSString *const VARMINT_NAME_STRING;
extern NSString *const WILD_WIGGLER_NAME_STRING;
extern NSString *const W_25_SILVER_ARROW_NAME_STRING;

extern NSString *const PIPE_FRAME_DISPLAY_NAME_STRING;
extern NSString *const STANDARD_BIKE_DISPLAY_NAME_STRING;
extern NSString *const FLAME_RIDER_DISPLAY_NAME_STRING;
extern NSString *const VARMINT_DISPLAY_NAME_STRING;
extern NSString *const WILD_WIGGLER_DISPLAY_NAME_STRING;
extern NSString *const W_25_SILVER_ARROW_DISPLAY_NAME_STRING;

// Vehicle class C.
extern NSString *const MACH_8_NAME_STRING;
extern NSString *const CIRCUIT_SPECIAL_NAME_STRING;
extern NSString *const SPORTS_COUPE_NAME_STRING;
extern NSString *const GOLD_STANDARD_NAME_STRING;

extern NSString *const MACH_8_DISPLAY_NAME_STRING;
extern NSString *const CIRCUIT_SPECIAL_DISPLAY_NAME_STRING;
extern NSString *const SPORTS_COUPE_DISPLAY_NAME_STRING;
extern NSString *const GOLD_STANDARD_DISPLAY_NAME_STRING;

// Vehicle class D.
extern NSString *const STEEL_DRIVER_NAME_STRING;
extern NSString *const TRI_SPEEDER_NAME_STRING;
extern NSString *const BADWAGON_NAME_STRING;
extern NSString *const STANDARD_ATV_NAME_STRING;
extern NSString *const GLA_NAME_STRING;

extern NSString *const STEEL_DRIVER_DISPLAY_NAME_STRING;
extern NSString *const TRI_SPEEDER_DISPLAY_NAME_STRING;
extern NSString *const BADWAGON_DISPLAY_NAME_STRING;
extern NSString *const STANDARD_ATV_DISPLAY_NAME_STRING;
extern NSString *const GLA_DISPLAY_NAME_STRING;

// Vehicle class E.
extern NSString *const BIDDYBUGGY_NAME_STRING;
extern NSString *const LANDSHIP_NAME_STRING;
extern NSString *const MR_SCOOTY_NAME_STRING;

extern NSString *const BIDDYBUGGY_DISPLAY_NAME_STRING;
extern NSString *const LANDSHIP_DISPLAY_NAME_STRING;
extern NSString *const MR_SCOOTY_DISPLAY_NAME_STRING;

// Vehicle class F.
extern NSString *const COMET_NAME_STRING;
extern NSString *const SPORTS_BIKE_NAME_STRING;
extern NSString *const JET_BIKE_NAME_STRING;
extern NSString *const YOSHI_BIKE_NAME_STRING;

extern NSString *const COMET_DISPLAY_NAME_STRING;
extern NSString *const SPORTS_BIKE_DISPLAY_NAME_STRING;
extern NSString *const JET_BIKE_DISPLAY_NAME_STRING;
extern NSString *const YOSHI_BIKE_DISPLAY_NAME_STRING;

// Tire groups (Analytics names only. Display names are generated through CMKPartGroup).
extern NSString *const TIRE_A_NAME_STRING;
extern NSString *const TIRE_B_NAME_STRING;
extern NSString *const TIRE_C_NAME_STRING;
extern NSString *const TIRE_D_NAME_STRING;
extern NSString *const TIRE_E_NAME_STRING;
extern NSString *const TIRE_F_NAME_STRING;
extern NSString *const TIRE_G_NAME_STRING;

// Tire class A.
extern NSString *const STANDARD_NAME_STRING;
extern NSString *const OFF_ROAD_NAME_STRING;
extern NSString *const BLUE_STANDARD_NAME_STRING;
extern NSString *const RETRO_OFF_ROAD_NAME_STRING;
extern NSString *const GLA_TIRES_NAME_STRING;

extern NSString *const STANDARD_DISPLAY_NAME_STRING;
extern NSString *const OFF_ROAD_DISPLAY_NAME_STRING;
extern NSString *const BLUE_STANDARD_DISPLAY_NAME_STRING;
extern NSString *const RETRO_OFF_ROAD_DISPLAY_NAME_STRING;
extern NSString *const GLA_TIRES_DISPLAY_NAME_STRING;

// Tire class B.
extern NSString *const MONSTER_NAME_STRING;
extern NSString *const HOT_MONSTER_NAME_STRING;

extern NSString *const MONSTER_DISPLAY_NAME_STRING;
extern NSString *const HOT_MONSTER_DISPLAY_NAME_STRING;

// Tire class C.
extern NSString *const ROLLER_NAME_STRING;
extern NSString *const BUTTON_NAME_STRING;
extern NSString *const AZURE_ROLLER_NAME_STRING;

extern NSString *const ROLLER_DISPLAY_NAME_STRING;
extern NSString *const BUTTON_DISPLAY_NAME_STRING;
extern NSString *const AZURE_ROLLER_DISPLAY_NAME_STRING;

// Tire class D.
extern NSString *const SLIM_NAME_STRING;
extern NSString *const CRIMSON_SLIM_NAME_STRING;

extern NSString *const SLIM_DISPLAY_NAME_STRING;
extern NSString *const CRIMSON_SLIM_DISPLAY_NAME_STRING;

// Tire class E.
extern NSString *const SLICK_NAME_STRING;
extern NSString *const CYBER_SLICK_NAME_STRING;

extern NSString *const SLICK_DISPLAY_NAME_STRING;
extern NSString *const CYBER_SLICK_DISPLAY_NAME_STRING;

// Tire class F.
extern NSString *const METAL_NAME_STRING;
extern NSString *const GOLD_TIRES_NAME_STRING;

extern NSString *const METAL_DISPLAY_NAME_STRING;
extern NSString *const GOLD_TIRES_DISPLAY_NAME_STRING;

// Tire class G.
extern NSString *const SPONGE_NAME_STRING;
extern NSString *const WOOD_NAME_STRING;
extern NSString *const CUSHION_NAME_STRING;

extern NSString *const SPONGE_DISPLAY_NAME_STRING;
extern NSString *const WOOD_DISPLAY_NAME_STRING;
extern NSString *const CUSHION_DISPLAY_NAME_STRING;

// Glider groups (Analytics names only. Display names are generated through CMKPartGroup).
extern NSString *const GLIDER_A_NAME_STRING;
extern NSString *const GLIDER_B_NAME_STRING;

// Glider class A.
extern NSString *const SUPER_GLIDER_NAME_STRING;
extern NSString *const WARIO_WING_NAME_STRING;
extern NSString *const WADDLE_WING_NAME_STRING;
extern NSString *const PLANE_GLIDER_NAME_STRING;
extern NSString *const GOLD_GLIDER_NAME_STRING;

extern NSString *const SUPER_GLIDER_DISPLAY_NAME_STRING;
extern NSString *const WARIO_WING_DISPLAY_NAME_STRING;
extern NSString *const WADDLE_WING_DISPLAY_NAME_STRING;
extern NSString *const PLANE_GLIDER_DISPLAY_NAME_STRING;
extern NSString *const GOLD_GLIDER_DISPLAY_NAME_STRING;

// Glider class B.
extern NSString *const CLOUD_GLIDER_NAME_STRING;
extern NSString *const PEACH_PARASOL_NAME_STRING;
extern NSString *const PARACHUTE_NAME_STRING;
extern NSString *const PARAFOIL_NAME_STRING;
extern NSString *const FLOWER_GLIDER_NAME_STRING;
extern NSString *const BOWSER_KITE_NAME_STRING;
extern NSString *const MKTV_PARAFOIL_NAME_STRING;

extern NSString *const CLOUD_GLIDER_DISPLAY_NAME_STRING;
extern NSString *const PEACH_PARASOL_DISPLAY_NAME_STRING;
extern NSString *const PARACHUTE_DISPLAY_NAME_STRING;
extern NSString *const PARAFOIL_DISPLAY_NAME_STRING;
extern NSString *const FLOWER_GLIDER_DISPLAY_NAME_STRING;
extern NSString *const BOWSER_KITE_DISPLAY_NAME_STRING;
extern NSString *const MKTV_PARAFOIL_DISPLAY_NAME_STRING;

// Cups.
extern NSString *const MUSHROOM_CUP_NAME_STRING;
extern NSString *const FLOWER_CUP_NAME_STRING;
extern NSString *const STAR_CUP_NAME_STRING;
extern NSString *const SPECIAL_CUP_NAME_STRING;
extern NSString *const SHELL_CUP_NAME_STRING;
extern NSString *const BANANA_CUP_NAME_STRING;
extern NSString *const LEAF_CUP_NAME_STRING;
extern NSString *const LIGHTNING_CUP_NAME_STRING;

extern NSString *const MUSHROOM_CUP_DISPLAY_NAME_STRING;
extern NSString *const FLOWER_CUP_DISPLAY_NAME_STRING;
extern NSString *const STAR_CUP_DISPLAY_NAME_STRING;
extern NSString *const SPECIAL_CUP_DISPLAY_NAME_STRING;
extern NSString *const SHELL_CUP_DISPLAY_NAME_STRING;
extern NSString *const BANANA_CUP_DISPLAY_NAME_STRING;
extern NSString *const LEAF_CUP_DISPLAY_NAME_STRING;
extern NSString *const LIGHTNING_CUP_DISPLAY_NAME_STRING;

// Courses.

// Mushroom Cup.
extern NSString *const MARIO_KART_STADIUM_NAME_STRING;
extern NSString *const WATER_PARK_NAME_STRING;
extern NSString *const SWEET_SWEET_CANYON_NAME_STRING;
extern NSString *const THWOMP_RUINS_NAME_STRING;

extern NSString *const MARIO_KART_STADIUM_DISPLAY_NAME_STRING;
extern NSString *const WATER_PARK_DISPLAY_NAME_STRING;
extern NSString *const SWEET_SWEET_CANYON_DISPLAY_NAME_STRING;
extern NSString *const THWOMP_RUINS_DISPLAY_NAME_STRING;

// Flower Cup.
extern NSString *const MARIO_CIRCUIT_NAME_STRING;
extern NSString *const TOAD_HARBOR_NAME_STRING;
extern NSString *const TWISTED_MANSION_NAME_STRING;
extern NSString *const SHY_GUY_FALLS_NAME_STRING;

extern NSString *const MARIO_CIRCUIT_DISPLAY_NAME_STRING;
extern NSString *const TOAD_HARBOR_DISPLAY_NAME_STRING;
extern NSString *const TWISTED_MANSION_DISPLAY_NAME_STRING;
extern NSString *const SHY_GUY_FALLS_DISPLAY_NAME_STRING;

// Star Cup.
extern NSString *const SUNSHINE_AIRPORT_NAME_STRING;
extern NSString *const DOLPHIN_SHOALS_NAME_STRING;
extern NSString *const ELECTRODROME_NAME_STRING;
extern NSString *const MOUNT_WARIO_NAME_STRING;

extern NSString *const SUNSHINE_AIRPORT_DISPLAY_NAME_STRING;
extern NSString *const DOLPHIN_SHOALS_DISPLAY_NAME_STRING;
extern NSString *const ELECTRODROME_DISPLAY_NAME_STRING;
extern NSString *const MOUNT_WARIO_DISPLAY_NAME_STRING;

// Special Cup.
extern NSString *const CLOUDTOP_CRUISE_NAME_STRING;
extern NSString *const BONE_DRY_DUNES_NAME_STRING;
extern NSString *const BOWSERS_CASTLE_NAME_STRING;
extern NSString *const RAINBOW_ROAD_NAME_STRING;

extern NSString *const CLOUDTOP_CRUISE_DISPLAY_NAME_STRING;
extern NSString *const BONE_DRY_DUNES_DISPLAY_NAME_STRING;
extern NSString *const BOWSERS_CASTLE_DISPLAY_NAME_STRING;
extern NSString *const RAINBOW_ROAD_DISPLAY_NAME_STRING;

// Shell Cup.
extern NSString *const MOO_MOO_MEADOWS_NAME_STRING;
extern NSString *const MARIO_CIRCUIT_GBA_NAME_STRING;
extern NSString *const CHEEP_CHEEP_BEACH_NAME_STRING;
extern NSString *const TOADS_TURNPIKE_NAME_STRING;

extern NSString *const MOO_MOO_MEADOWS_DISPLAY_NAME_STRING;
extern NSString *const MARIO_CIRCUIT_GBA_DISPLAY_NAME_STRING;
extern NSString *const CHEEP_CHEEP_BEACH_DISPLAY_NAME_STRING;
extern NSString *const TOADS_TURNPIKE_DISPLAY_NAME_STRING;

// Banana Cup.
extern NSString *const DRY_DRY_DESERT_NAME_STRING;
extern NSString *const DONUT_PLAINS_3_NAME_STRING;
extern NSString *const ROYAL_RACEWAY_NAME_STRING;
extern NSString *const DK_JUNGLE_NAME_STRING;

extern NSString *const DRY_DRY_DESERT_DISPLAY_NAME_STRING;
extern NSString *const DONUT_PLAINS_3_DISPLAY_NAME_STRING;
extern NSString *const ROYAL_RACEWAY_DISPLAY_NAME_STRING;
extern NSString *const DK_JUNGLE_DISPLAY_NAME_STRING;

// Leaf Cup.
extern NSString *const WARIO_STADIUM_NAME_STRING;
extern NSString *const SHERBET_LAND_NAME_STRING;
extern NSString *const MUSIC_PARK_NAME_STRING;
extern NSString *const YOSHI_VALLEY_NAME_STRING;

extern NSString *const WARIO_STADIUM_DISPLAY_NAME_STRING;
extern NSString *const SHERBET_LAND_DISPLAY_NAME_STRING;
extern NSString *const MUSIC_PARK_DISPLAY_NAME_STRING;
extern NSString *const YOSHI_VALLEY_DISPLAY_NAME_STRING;

// Lightning Cup.
extern NSString *const TICK_TOCK_CLOCK_NAME_STRING;
extern NSString *const PIRANHA_PLANT_SLIDE_NAME_STRING;
extern NSString *const GRUMBLE_VOLCANO_NAME_STRING;
extern NSString *const RAINBOW_ROAD_N64_NAME_STRING;

extern NSString *const TICK_TOCK_CLOCK_DISPLAY_NAME_STRING;
extern NSString *const PIRANHA_PLANT_SLIDE_DISPLAY_NAME_STRING;
extern NSString *const GRUMBLE_VOLCANO_DISPLAY_NAME_STRING;
extern NSString *const RAINBOW_ROAD_N64_DISPLAY_NAME_STRING;
