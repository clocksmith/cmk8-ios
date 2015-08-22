//
//  CMKFaqViewController.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/6/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKColors.h"
#import "CMKConstants.h"
#import "CMKFaqViewController.h"
#import "CMKCircleWithTextView.h"
#import "CMKDonationPopupView.h"
#import "CMKAppDelegate.h"
#import "CMKAnalyticsUtils.h"

#define _TAG (NSStringFromClass([CMKFaqViewController class]))

@interface CMKFaqViewController ()

@property(nonatomic, weak) IBOutlet UIWebView *webView;
@property(nonatomic, weak) IBOutlet CMKCircleWithTextView *rateButton;
@property(nonatomic, weak) IBOutlet CMKCircleWithTextView *donateButton;

- (IBAction)handleRateButtonTapped:(id)sender;

- (IBAction)handleDonateButtonTapped:(id)sender;

@end

@implementation CMKFaqViewController

- (instancetype)init {
  self = [super initWithTitle:FAQ_TITLE_STRING withImageName:FAQ_ICON_IMAGE withScreenName:FAQ_SCREEN];

  if (self) {
  }

  return self;
}

- (void)viewDidLoad {
  NSLog(@"%@ viewDidLoad", _TAG);
  [super viewDidLoad];

  [self.rateButton updateText:NSLocalizedString(@"RATE", nil)];
  [self.rateButton updateBackgroundColor:[CMKColors darkRedColor]];
  [self.rateButton updateTextColor:[CMKColors whiteColor]];
  [self.rateButton updateFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:FAQ_BUTTON_FONT_SIZE_IPHONE]];
  [self.rateButton updateShadow:YES];
  [self.rateButton setNeedsDisplay];

  [self.donateButton updateText:NSLocalizedString(@"DONATE", nil)];
  [self.donateButton updateBackgroundColor:[CMKColors blueColor]];
  [self.donateButton updateTextColor:[CMKColors whiteColor]];
  [self.donateButton updateFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:FAQ_BUTTON_FONT_SIZE_IPHONE]];
  [self.donateButton updateShadow:YES];
  [self.donateButton setNeedsDisplay];

  NSString *path = [[NSBundle mainBundle] pathForResource:@"faq" ofType:@"html"];

  NSString *htmlString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];

  [self.webView loadHTMLString:htmlString baseURL:[[NSBundle mainBundle] bundleURL]];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction

- (IBAction)handleRateButtonTapped:(id)sender {
  NSLog(@"%@ handleRateButtonTapped", _TAG);
  [CMKAnalyticsUtils sendRateButtonClicked:self.tracker];

  NSURL *appStoreUrl =
      [NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@", APP_ID]];

  if ([[UIApplication sharedApplication] canOpenURL:appStoreUrl]) {
    [[UIApplication sharedApplication] openURL:appStoreUrl];
  } else {
    NSURL *appStoreWebsiteUrl =
        [NSURL URLWithString:[NSString stringWithFormat:@"http://itunes.apple.com/app/id%@", APP_ID]];

    if ([[UIApplication sharedApplication] canOpenURL:appStoreWebsiteUrl]) {
      [[UIApplication sharedApplication] openURL:appStoreWebsiteUrl];
    }
  }
}

- (IBAction)handleDonateButtonTapped:(id)sender {
  [CMKAnalyticsUtils sendDonateButtonClicked:self.tracker];
  CMKDonationPopupView *donationPopup =
      [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([CMKDonationPopupView class])
                                     owner:self
                                   options:nil] firstObject];

  // Add popup into window
  CMKAppDelegate *appDelegate = (CMKAppDelegate *)[[UIApplication sharedApplication] delegate];
  donationPopup.frame = appDelegate.window.frame;
  [donationPopup setNeedsLayout];
  [donationPopup layoutIfNeeded];
  [appDelegate.window addSubview:donationPopup];
  [donationPopup transitionIn:self.donateButton];
}

@end
