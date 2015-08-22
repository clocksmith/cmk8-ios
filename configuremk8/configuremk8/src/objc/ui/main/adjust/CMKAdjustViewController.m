//
//  CMKAdjustViewController.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/27/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <Google/Analytics.h>
#import "CMKAdjustAttributeView.h"
#import "CMKAdjustConfigurations.h"
#import "CMKAdjustConfigurationSpinnerItem.h"
#import "CMKAdjustViewController.h"
#import "CMKAdjustModel.h"
#import "CMKConfigureViewController.h"
#import "CMKCustomSpinnerItem.h"
#import "CMKUserDefaultslUtils.h"
#import "CMKMainTabBarController.h"
#import "CMKStatsToKartConverter.h"
#import "CMKConstants.h"
#import "CMKColors.h"
#import "CMKAnalyticsUtils.h"

#define _TAG (NSStringFromClass([CMKAdjustViewController class]))

@interface CMKAdjustViewController ()

@property(nonatomic, weak) IBOutlet CMKSpinnerView *spinnerView;
@property(nonatomic, weak) IBOutlet CMKAdjustAttributeView *accelerationAttributeView;
@property(nonatomic, weak) IBOutlet CMKAdjustAttributeView *speedAttributeView;
@property(nonatomic, weak) IBOutlet CMKAdjustAttributeView *handlingAttributeView;
@property(nonatomic, weak) IBOutlet CMKAdjustAttributeView *miniturboAttributeView;
@property(nonatomic, weak) IBOutlet CMKAdjustAttributeView *tractionAttributeView;
@property(nonatomic, weak) IBOutlet CMKAdjustAttributeView *weightAttributeView;

- (IBAction)handleCancelTapped:(id)sender;
- (IBAction)handleOKTapped:(id)sender;

@end

@implementation CMKAdjustViewController {
  CMKAdjustModel *_model;
  NSArray *_spinnerItems;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil withScreenName:ADJUST_SCREEN];

  if (self) {
    _model = [CMKUserDefaultslUtils loadAdjustModel];

    [self initSpinneritems];
  }

  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // Setup the spinner view.
  self.spinnerView.delegate = self;
  [self.spinnerView updateItems:_spinnerItems];
  self.spinnerView.hideFirstItem = YES;
  self.spinnerView.cellHeight = self.spinnerView.frame.size.height;
  self.spinnerView.listItemFont = [UIFont systemFontOfSize:DEFAULT_SPINNER_FONT_SIZE];

  // Setup the attribute views.
  [self.accelerationAttributeView updateAttribute:Acceleration];
  [self.speedAttributeView updateAttribute:AverageSpeed];
  [self.handlingAttributeView updateAttribute:AverageHandling];
  [self.miniturboAttributeView updateAttribute:Miniturbo];
  [self.tractionAttributeView updateAttribute:Traction];
  [self.weightAttributeView updateAttribute:Weight];
  self.accelerationAttributeView.delegate = self;
  self.speedAttributeView.delegate = self;
  self.handlingAttributeView.delegate = self;
  self.miniturboAttributeView.delegate = self;
  self.tractionAttributeView.delegate = self;
  self.weightAttributeView.delegate = self;

  [self updateAllViews];
}

#pragma mark IBAction

- (IBAction)handleCancelTapped:(id)sender {
  [CMKAnalyticsUtils sendAdjustConfigurationCancelEvent:self.tracker
                                withAdjustConfiguration:_model.adjustConfiguration
                                     withPreferredStats:[self preferredStats]];
  [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)handleOKTapped:(id)sender {
  if ([self.presentingViewController isMemberOfClass:[CMKMainTabBarController class]]) {
    UIViewController *selectedViewControler =
        [(CMKMainTabBarController *)self.presentingViewController selectedViewController];

    if ([selectedViewControler isMemberOfClass:[CMKConfigureViewController class]]) {
      CMKStatsModel *preferredStats = [self preferredStats];

      if (_model.adjustConfiguration == Custom) {
        _model.customStats = preferredStats;
      }

      [CMKAnalyticsUtils sendAdjustConfigurationOKEvent:self.tracker
                                withAdjustConfiguration:_model.adjustConfiguration
                                     withPreferredStats:preferredStats];
      [CMKUserDefaultslUtils saveAdjustModel:_model];

      CMKKartConfigurationModel *optimalKartConfiguration =
          [CMKStatsToKartConverter optimalKartConfiguration:preferredStats];
      [CMKAnalyticsUtils sendBuildConfigurationEvent:self.tracker
                             withAdjustConfiguration:_model.adjustConfiguration
                               withKartConfiguration:optimalKartConfiguration];
      [(CMKConfigureViewController *)selectedViewControler updateKartConfiguration:optimalKartConfiguration];
    } else {
      [NSException raise:@"Invalid Selected View Controller"
                  format:@"The selected view controller must be an instance of CMKConfigureViewController"];
    }
  } else {
    [NSException raise:@"Invalid Presenting View Controller"
                format:@"The presenting view controller must be an instance of CMKMainTabBarController"];
  }

  [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - CMKSpinnerViewDelegate

- (void)spinner:(CMKSpinnerView *)spinner didSelectItem:(id<CMKSpinnerItem>)item {
  NSLog(@"%@ configuration index: %d", _TAG, ((CMKAdjustConfigurationSpinnerItem *)item).adjustConfiguration);

  if ([item isMemberOfClass:[CMKAdjustConfigurationSpinnerItem class]]) {
    _model.adjustConfiguration = ((CMKAdjustConfigurationSpinnerItem *)item).adjustConfiguration;

    [self updateAllViews];
  } else {
    [NSException raise:@"Invalid CMKSpinnerItem"
                format:@"The item must be either a CMKAdjustConfigurationSpinnerItem."];
  }
}

#pragma mark - CMKAdjustAttributeViewDelegate

- (void)didChangeSliderValue {
  _model.adjustConfiguration = Custom;
  [self updateSpinnerView];
}

#pragma mark - CMKAdjustViewController Views

- (void)updateAllViews {
  [self updateSpinnerView];
  [self updateAttributeViews];
}

- (void)updateSpinnerView {
  [self.spinnerView updateSelectedItem:_spinnerItems[(int)_model.adjustConfiguration]];
  self.spinnerView.selectedItemlabel.textColor =
      _model.adjustConfiguration == Custom ? [CMKColors blueColor] : [CMKColors darkGrayColor];
}

- (void)updateAttributeViews {
  CMKStatsModel *stats =
      _model.adjustConfiguration == Custom
          ? _model.customStats
          : [CMKAdjustConfigurations statsForIndex:[NSNumber numberWithInt:_model.adjustConfiguration]];

  [self.accelerationAttributeView updateAttributeValue:stats.acceleration];
  [self.speedAttributeView updateAttributeValue:stats.averageSpeed];
  [self.handlingAttributeView updateAttributeValue:stats.averageHandling];
  [self.miniturboAttributeView updateAttributeValue:stats.miniturbo];
  [self.tractionAttributeView updateAttributeValue:stats.traction];
  [self.weightAttributeView updateAttributeValue:stats.weight];
}

#pragma mark - Helper methods

- (void)initSpinneritems {
  NSMutableArray *spinnerItems = [[NSMutableArray alloc] init];

  for (NSNumber *index in [CMKAdjustConfigurations allAdjustConfigurations]) {
    [spinnerItems addObject:[[CMKAdjustConfigurationSpinnerItem alloc]
                                initWithAdjustConfiguration:(CMKAdjustConfiguration)[index intValue]]];
  }

  _spinnerItems = [spinnerItems copy];
}

- (CMKStatsModel *)preferredStats {
  return [[CMKStatsModel alloc] initWithAcceleration:[self.accelerationAttributeView attributeValue]
                                    withAverageSpeed:[self.speedAttributeView attributeValue]
                                 withAverageHandling:[self.handlingAttributeView attributeValue]
                                       withMiniturbo:[self.miniturboAttributeView attributeValue]
                                        withTraction:[self.tractionAttributeView attributeValue]
                                          withWeight:[self.weightAttributeView attributeValue]];
}

@end
