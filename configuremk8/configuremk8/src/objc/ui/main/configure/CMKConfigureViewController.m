//
//  CMKConfigureViewController.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/6/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <Google/Analytics.h>
#import "CMKAdjustViewController.h"
#import "CMKConstants.h"
#import "CMKConfigureViewController.h"
#import "CMKKartConfigurationModel.h"
#import "CMKCustomSpinnerItem.h"
#import "CMKPartData.h"
#import "CMKPartGroupChooserView.h"
#import "CMKStarView.h"
#import "CMKUserDefaultslUtils.h"
#import "CMKConfigureModel.h"
#import "CMKStarredKartConfigurationUtils.h"
#import "CMKColors.h"
#import "CMKSingleStatsScrollView.h"
#import "CMKPartPopupView.h"
#import "CMKStatsModel.h"
#import "CMKPartGroupView.h"
#import "CMKPartImageView.h"
#import "CMKAppDelegate.h"
#import "CMKSpinnerView.h"
#import "CMKHelpWizardView.h"
#import "CMKHelpWizardItemModel.h"
#import "CMKAnalyticsUtils.h"

#define _TAG (NSStringFromClass([CMKConfigureViewController class]))

@interface CMKConfigureViewController () <CMKSpinnerViewDelegate, CMKPartGroupChooserViewDelegate,
                                          CMKPartImageViewDelegate, CMKAdjustViewControllerDelegate>

@property(nonatomic, weak) IBOutlet CMKSpinnerView *spinnerView;
@property(nonatomic, weak) IBOutlet CMKStarView *starView;
@property(nonatomic, weak) IBOutlet CMKPartGroupChooserView *characterChooserView;
@property(nonatomic, weak) IBOutlet CMKPartGroupChooserView *vehicleChooserView;
@property(nonatomic, weak) IBOutlet CMKPartGroupChooserView *tireChooserView;
@property(nonatomic, weak) IBOutlet CMKPartGroupChooserView *gliderChooserView;
@property(nonatomic, weak) IBOutlet CMKSingleStatsScrollView *statsView;

- (IBAction)handleStarTapped:(id)sender;

@end

@implementation CMKConfigureViewController {
  CMKConfigureModel *_model;
  BOOL _animateViews;
  BOOL _isFirstLoad;
}

#pragma mark - UIViewController

- (instancetype)init {
  NSLog(@"%@ init ", _TAG);
  self =
      [super initWithTitle:CONFIGURE_TITLE_STRING withImageName:CONFIGURE_ICON_IMAGE withScreenName:CONFIGURE_SCREEN];

  if (self) {
    _model = [CMKUserDefaultslUtils loadConfigureModel];

    if (_model.kartConfiguration == nil) {
      _model.kartConfiguration =
          [[CMKKartConfigurationModel alloc] initWithCharacterGroup:[CMKPartData characterGroups][0]
                                                   withVehicleGroup:[CMKPartData vehicleGroups][0]
                                                      withTireGroup:[CMKPartData tireGroups][0]
                                                    withGliderGroup:[CMKPartData gliderGroups][0]];
      [CMKUserDefaultslUtils saveConfigureModel:_model];
    }
  }

  return self;
}

- (void)viewDidLoad {
  //  NSLog(@"%@ viewDidLoad ", _TAG);
  [super viewDidLoad];

  // Setup the spinner view.
  self.spinnerView.delegate = self;
  CMKMainTabBarController *mainTabBarController = ((CMKMainTabBarController *)self.parentViewController);
  float tabBarHeight = mainTabBarController.tabBar.frame.size.height;
  self.spinnerView.listBottomMargin += tabBarHeight;
  self.spinnerView.bottomBar.backgroundColor = [UIColor clearColor];
  self.spinnerView.cellHeight = self.spinnerView.frame.size.height;
  self.spinnerView.listItemFont = [UIFont systemFontOfSize:DEFAULT_SPINNER_FONT_SIZE];
  [self.spinnerView updateItems:[self spinnerItems]];

  // Setup the part chooser views.
  self.characterChooserView.delegate = self;
  self.vehicleChooserView.delegate = self;
  self.tireChooserView.delegate = self;
  self.gliderChooserView.delegate = self;

  _isFirstLoad = YES;
}

- (void)viewDidAppear:(BOOL)animated {
  //  NSLog(@"%@ viewDidAppear ", _TAG);
  [super viewDidAppear:animated];

  _animateViews = NO;

  // Draw the stats view.
  [self.statsView drawWithMode:CMKStatModeOnlyPositive];

  // Draw the part chooser views.
  [self.characterChooserView drawPartGroups:[CMKPartData characterGroups]];
  [self.vehicleChooserView drawPartGroups:[CMKPartData vehicleGroups]];
  [self.tireChooserView drawPartGroups:[CMKPartData tireGroups]];
  [self.gliderChooserView drawPartGroups:[CMKPartData gliderGroups]];

  [self updateAllViews];

  if (![CMKUserDefaultslUtils hasConfigureHelpWizardLoaded]) {
    [self startHelpWizard];
  }

  _isFirstLoad = NO;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)updateKartConfiguration:(CMKKartConfigurationModel *)kartConfiguration {
  _model.kartConfiguration = kartConfiguration;
  [CMKUserDefaultslUtils saveConfigureModel:_model];
  _animateViews = YES;
  [self updateAllViews];
}

#pragma mark - IBAction

- (IBAction)handleStarTapped:(id)sender {
  NSLog(@" %@ handleStarTapped", _TAG);

  if ([CMKStarredKartConfigurationUtils isKartConfigurationStarred:_model.kartConfiguration]) {
    [CMKStarredKartConfigurationUtils unstarKartConfiguration:_model.kartConfiguration];
    [CMKAnalyticsUtils sendStarViewStarredEvent:self.tracker
                          withKartConfiguration:_model.kartConfiguration
                                      isStarred:false];
  } else {
    [CMKStarredKartConfigurationUtils starKartConfiguration:_model.kartConfiguration];
    [CMKAnalyticsUtils sendStarViewStarredEvent:self.tracker
                          withKartConfiguration:_model.kartConfiguration
                                      isStarred:true];
  }

  [self.spinnerView updateItems:[self spinnerItems]];

  [self updateStarView];
}

#pragma mark - Other handlers

- (void)handleNewCustomConfigurationSelected {
  CMKAdjustViewController *adjustViewController = [[CMKAdjustViewController alloc] init];

  [self presentViewController:adjustViewController animated:YES completion:nil];
}

- (void)handleKartConfigurationSelected:(CMKKartConfigurationModel *)kartConfiguration {
  _model.kartConfiguration = kartConfiguration;
  [CMKUserDefaultslUtils saveConfigureModel:_model];
  _animateViews = YES;
  [self updateAllViews];
}

#pragma mark - CMKPartGroupChooserViewDelegate

- (void)partGroupChooserView:(CMKPartGroupChooserView *)partGroupChooserView
          didSelectPartGroup:(CMKPartGroupModel *)partGroup {
  //  NSLog(@" % @ partGroupChooserView : didSelectPartGroup : % @", _TAG, partGroup.displayName);

  if (partGroup.type == Character) {
    _model.kartConfiguration.characterGroup = partGroup;
  } else if (partGroup.type == Vehicle) {
    _model.kartConfiguration.vehicleGroup = partGroup;
  } else if (partGroup.type == Tire) {
    _model.kartConfiguration.tireGroup = partGroup;
  } else if (partGroup.type == Glider) {
    _model.kartConfiguration.gliderGroup = partGroup;
  } else {
    // TODO(clocksmith): throw an exception?
    NSLog(@"ERROR ! %@ No part group chooser view !", _TAG);
  }

  [CMKUserDefaultslUtils saveConfigureModel:_model];

  _animateViews = YES;
  [self updateSpinnerView];
  [self updateStarView];
  [self updateStatsView];
}

#pragma mark - CMKPartImageViewDelegate

- (void)partImageView:(UIImageView *)partImageView didTapPart:(CMKPartModel *)part {
  NSLog(@"%@ didTapPart: %@", _TAG, part.name);
  [CMKAnalyticsUtils sendPartViewClickedEvent:self.tracker withScreenName:CONFIGURE_SCREEN withPart:part];

  CMKPartPopupView *partPopup = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([CMKPartPopupView class])
                                                               owner:self
                                                             options:nil] firstObject];

  // Add popup into window
  CMKAppDelegate *appDelegate = (CMKAppDelegate *)[[UIApplication sharedApplication] delegate];
  partPopup.frame = appDelegate.window.frame;
  [appDelegate.window addSubview:partPopup];
  [partPopup setNeedsLayout];
  [partPopup layoutIfNeeded];
  [partPopup updatePart:part withAnchorImageView:partImageView];
}

#pragma mark - CMKSpinnerViewDelegate

- (void)spinner:(CMKSpinnerView *)spinner didSelectItem:(id<CMKSpinnerItem>)item {
  if ([item isMemberOfClass:[CMKCustomSpinnerItem class]]) {
    [self handleNewCustomConfigurationSelected];
  } else if ([item isMemberOfClass:[CMKKartConfigurationModel class]]) {
    [self handleKartConfigurationSelected:(CMKKartConfigurationModel *)item];
  } else {
    [NSException raise:@"Invalid CMKSpinnerItem"
                format:@"The item must be either a CMKNewCustomConfigurationSpinnerItem or a \
                        CMKKartConfigurationModel."];
  }
}

#pragma mark - CMKAdjustViewControllerDelegate

- (void)didEndWithKartConfiguration:(CMKKartConfigurationModel *)kartConfiguration {
}

#pragma mark - CMKConfigureViewController Views

- (void)updateAllViews {
  [self updateSpinnerView];
  [self updateStarView];
  [self updateChooserViews];
  [self updateStatsView];
}

- (void)updateSpinnerView {
  NSLog(@"%@ updateSpinnerView", _TAG);
  [self.spinnerView updateSelectedItem:_model.kartConfiguration];
}

- (void)updateStarView {
  NSLog(@"%@ updateStarView", _TAG);
  [self.starView updateFill:[CMKStarredKartConfigurationUtils isKartConfigurationStarred:_model.kartConfiguration]];
}

- (void)updateChooserViews {
  NSLog(@"%@ updateChooserViews", _TAG);
  [self.characterChooserView selectPartGroup:_model.kartConfiguration.characterGroup
                                  isAnimated:_animateViews || _isFirstLoad];
  [self.vehicleChooserView selectPartGroup:_model.kartConfiguration.vehicleGroup
                                isAnimated:_animateViews || _isFirstLoad];
  [self.tireChooserView selectPartGroup:_model.kartConfiguration.tireGroup isAnimated:_animateViews || _isFirstLoad];
  [self.gliderChooserView selectPartGroup:_model.kartConfiguration.gliderGroup
                               isAnimated:_animateViews || _isFirstLoad];
}

- (void)updateStatsView {
  NSLog(@"%@ updateStatsView", _TAG);
  [self.statsView updateStats:_model.kartConfiguration.kartStats isAnimated:_animateViews || _isFirstLoad];
}

#pragma mark - Helper methods

- (NSArray *)spinnerItems {
  return [@[ [[CMKCustomSpinnerItem alloc] initWithDisplayText:NSLocalizedString(@"Custom Configuration...", nil)] ]
      arrayByAddingObjectsFromArray:[CMKStarredKartConfigurationUtils allStarredKartConfigurations]];
}

- (void)startHelpWizard {
  CMKAppDelegate *appDelegate = (CMKAppDelegate *)[[UIApplication sharedApplication] delegate];
  CMKHelpWizardView *helpWizardView = [[CMKHelpWizardView alloc]
      initWithFrame:appDelegate.window.frame
      withHelpItems:@[
        [[CMKHelpWizardItemModel alloc] initWithView:self.characterChooserView
                                     withHelpMessage:NSLocalizedString(@"PartGroupChooserHelpMessage", nil)],
        [[CMKHelpWizardItemModel alloc] initWithView:self.starView
                                     withHelpMessage:NSLocalizedString(@"StarHelpMessage", nil)],
        [[CMKHelpWizardItemModel alloc] initWithView:self.spinnerView
                                     withHelpMessage:NSLocalizedString(@"SpinnerHelpMessage", nil)]
      ]];

  helpWizardView.frame = appDelegate.window.frame;
  [appDelegate.window addSubview:helpWizardView];
  [helpWizardView start];
  [CMKUserDefaultslUtils configureHelpWizardDidLoad];
}

@end
