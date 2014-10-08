//
//  CMKCompareViewController.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/6/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKAppDelegate.h"
#import "CMKConstants.h"
#import "CMKCompareViewController.h"
#import "CMKCompareModel.h"
#import "CMKComparePlaceholderView.h"
#import "CMKCompareStatsScrollView.h"
#import "CMKKartConfigurationView.h"
#import "CMKUserDefaultslUtils.h"
#import "CMKMainTabBarController.h"
#import "CMKPartPopupView.h"
#import "CMKStarredKartConfigurationUtils.h"
#import "CMKSpinnerView.h"
#import "CMKAnalyticsUtils.h"

#define _TAG (NSStringFromClass([CMKCompareViewController class]))

@interface CMKCompareViewController () <CMKSpinnerViewDelegate, CMKPartImageViewDelegate>

@property (nonatomic, weak) IBOutlet CMKSpinnerView *leftSpinnerView;
@property (nonatomic, weak) IBOutlet CMKSpinnerView *rightSpinnerView;
@property (nonatomic, weak) IBOutlet CMKKartConfigurationView *leftKartConfigurationView;
@property (nonatomic, weak) IBOutlet CMKKartConfigurationView *rightKartConfigurationView;
@property (nonatomic, weak) IBOutlet CMKCompareStatsScrollView *statsView;

- (void)updateSpinnerViews;

@end

@implementation CMKCompareViewController {
  CMKCompareModel *_model;
  CMKComparePlaceholderView *_placeholderView;
  BOOL _animateViews;
  BOOL _isFirstLoad;
}

- (instancetype)init {
  NSLog(@"%@ init ", _TAG);
  self = [super initWithTitle:COMPARE_TITLE_STRING withImageName:COMPARE_ICON_IMAGE];

  if (self) {
    _model = [CMKUserDefaultslUtils loadCompareModel];
  }

  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  _isFirstLoad = YES;
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.screenName = COMPARE_SCREEN;
}

- (void)viewDidAppear:(BOOL)animated {
  NSLog(@"%@ viewDidAppear ", _TAG);
  [super viewDidAppear:animated];

  CMKCompareModel *newModel = [CMKUserDefaultslUtils loadCompareModel];
  _animateViews = ![newModel isEqual:_model];
  _model = newModel;

  NSArray *allStarredKartConfigurations =
    [CMKStarredKartConfigurationUtils allStarredKartConfigurations];

  [_placeholderView removeFromSuperview];

  if ([allStarredKartConfigurations count] < 2) {
    // TODO(clocksmith): show help message.
    if (!_placeholderView) {
      _placeholderView = [[[NSBundle mainBundle]loadNibNamed:
                           NSStringFromClass([CMKComparePlaceholderView class])
                                                       owner:self
                                                     options:nil] firstObject];
      _placeholderView.frame = self.view.frame;
    }

    [self.view addSubview:_placeholderView];
  } else {
    // Set the spinner view delegates.
    self.leftSpinnerView.delegate = self;
    self.rightSpinnerView.delegate = self;

    // Set the kart configuration view delegates.
    self.leftKartConfigurationView.delegate = self;
    self.rightKartConfigurationView.delegate = self;

    // Setup the spinner views.
    [self setupSpinnerView:self.leftSpinnerView
           withAllStarredKartConfigurations:allStarredKartConfigurations];
    [self setupSpinnerView:self.rightSpinnerView
           withAllStarredKartConfigurations:allStarredKartConfigurations];

    // Setup the kart configuration views.
    if (![CMKStarredKartConfigurationUtils isKartConfigurationStarred:_model.leftKartConfiguration]) {
      [self updateLeftKartConfigurationModel:nil];
    }

    if (![CMKStarredKartConfigurationUtils isKartConfigurationStarred:_model.rightKartConfiguration]) {
      [self updateRightKartConfigurationModel:nil];
    }

    if (!_model.leftKartConfiguration || !_model.rightKartConfiguration) {
      [self updateLeftKartConfigurationModel:allStarredKartConfigurations[0]];
      [self updateRightKartConfigurationModel:allStarredKartConfigurations[1]];
    }

    // Setup the stats view.
    [self.statsView setup];

    [self updateAllViews];

    _isFirstLoad = NO;
  }
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - CMKSpinnerViewDelegate

- (void)spinner:(CMKSpinnerView *)spinner didSelectItem:(id <CMKSpinnerItem> )item {
  _animateViews = YES;

  if (spinner == self.leftSpinnerView) {
    [self updateLeftKartConfigurationModel:(CMKKartConfigurationModel *)item];
    [self.leftKartConfigurationView update:_model.leftKartConfiguration isAnimated:_animateViews];
    [CMKAnalyticsUtils sendCompareViewSelectedEvent:self.tracker
                              withKartConfiguration:_model.leftKartConfiguration];
  } else if (spinner == self.rightSpinnerView) {
    [self updateRightKartConfigurationModel:(CMKKartConfigurationModel *)item];
    [self.rightKartConfigurationView update:_model.rightKartConfiguration isAnimated:_animateViews];
    [CMKAnalyticsUtils sendCompareViewSelectedEvent:self.tracker
                              withKartConfiguration:_model.rightKartConfiguration];
  } else {
    [NSException raise:@"No Spinner View Found"
                format:@"The spinner that selected an item is not a valid spinner view in this controller"];
  }

  [self updateStatsView];
}

#pragma mark - CMKPartImageViewDelegate

- (void)partImageView:(UIImageView *)partImageView didTapPart:(CMKPartModel *)part {
  NSLog(@"%@ didTapPart: %@", _TAG, part.name);
  [CMKAnalyticsUtils sendPartViewClickedEvent:self.tracker
                               withScreenName:COMPARE_SCREEN
                                     withPart:part];

  // TODO(clocksmith): Consolidate this and the same code in CMKConfigureViewController.
  CMKPartPopupView *partPopup = [[[NSBundle mainBundle]
                                  loadNibNamed:NSStringFromClass([CMKPartPopupView class])
                                         owner:self
                                       options:nil]
                                 firstObject];

  // Add popup into window
  CMKAppDelegate *appDelegate = (CMKAppDelegate *)[[UIApplication sharedApplication] delegate];
  partPopup.frame = appDelegate.window.frame;
  [appDelegate.window addSubview:partPopup];
  [partPopup setNeedsLayout];
  [partPopup layoutIfNeeded];
  [partPopup updatePart:part withAnchorImageView:partImageView];
}

#pragma mark - CMKCompareViewController

- (void)updateLeftKartConfigurationModel:newKartConfigurationModel {
  _model.leftKartConfiguration = newKartConfigurationModel;
  NSLog(@"%@ _model.leftKartCongiguration updated with %@", _TAG, newKartConfigurationModel);
  [CMKUserDefaultslUtils saveCompareModel:_model];
}

- (void)updateRightKartConfigurationModel:newKartConfigurationModel {
  _model.rightKartConfiguration = newKartConfigurationModel;
  NSLog(@"%@ _model.rightKartCongiguration updated with %@", _TAG, newKartConfigurationModel);
  [CMKUserDefaultslUtils saveCompareModel:_model];
}


- (void)updateAllViews {
  [self updateSpinnerViews];
  [self updateKartConfigurationViews];
  [self updateStatsView];
}

- (void)updateSpinnerViews {
  [self.leftSpinnerView updateSelectedItem:_model.leftKartConfiguration];
  [self.rightSpinnerView updateSelectedItem:_model.rightKartConfiguration];
}

- (void)updateKartConfigurationViews {
  [self.leftKartConfigurationView
   update:_model.leftKartConfiguration
       isAnimated:_animateViews || _isFirstLoad];
  [self.rightKartConfigurationView
   update:_model.rightKartConfiguration
       isAnimated:_animateViews || _isFirstLoad];
}

- (void)updateStatsView {
  [self.statsView
   updateWithLeftStats:_model.leftKartConfiguration.kartStats
        withRightStats:_model.rightKartConfiguration.kartStats
            isAnimated:_animateViews || _isFirstLoad];
}

#pragma mark - Helper methods

- (void)          setupSpinnerView:(CMKSpinnerView *)spinnerView
  withAllStarredKartConfigurations:(NSArray *)allStarredKartConfigurations {
  CMKMainTabBarController *mainTabBarController =
    ((CMKMainTabBarController *)self.parentViewController);
  float tabBarHeight = mainTabBarController.tabBar.frame.size.height;

  spinnerView.listBottomMargin += tabBarHeight;
  spinnerView.selectedItemlabel.font = [UIFont fontWithName:HELVETICA_NEUE_FONT
                                                                   size:IS_IPAD ?
                                         COMPARE_SPINNER_FONT_SIZE_IPAD:COMPARE_SPINNER_FONT_SIZE_IPHONE];

  if (!IS_IPAD) {
    spinnerView.minimumListViewWidth = self.view.frame.size.width - 40;
  }

  spinnerView.cellHeight = spinnerView.frame.size.height;
  spinnerView.bottomBar.backgroundColor = [UIColor clearColor];
  spinnerView.listItemFont = [UIFont systemFontOfSize:COMPARE_SPINNER_FONT_SIZE];

  spinnerView.delegate = self;
  [spinnerView updateItems:allStarredKartConfigurations];
}

@end
