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
int const MAX_NUM_PARTS_PER_GROUP = 8;
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
NSString *const MAPS_SCREEN = @"MapsScreen";
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
