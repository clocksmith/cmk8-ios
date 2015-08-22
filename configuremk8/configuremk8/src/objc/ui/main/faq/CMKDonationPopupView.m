//
//  CMKDonationPopupView.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/31/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <Google/Analytics.h>
#import <StoreKit/StoreKit.h>

#import "CMKAppDelegate.h"
#import "CMKDonationPopupView.h"
#import "CMKCircleWithTextView.h"
#import "CMKConstants.h"
#import "CMKColors.h"

#define _TAG (NSStringFromClass([CMKDonationPopupView class]))

@interface CMKDonationPopupView ()

@property(weak, nonatomic) IBOutlet UIView *backgroundView;
@property(weak, nonatomic) IBOutlet UIView *contentView;
@property(weak, nonatomic) IBOutlet UILabel *likeThisAppLabel;
@property(weak, nonatomic) IBOutlet UILabel *viaITunesLabel;
@property(weak, nonatomic) IBOutlet UIView *oneDollarDonationButton;
@property(weak, nonatomic) IBOutlet UIView *threeDollarDonationButton;
@property(weak, nonatomic) IBOutlet UIView *fiveDollarDonationButton;
@property(weak, nonatomic) IBOutlet UILabel *orViaBitcoinLabel;
@property(weak, nonatomic) IBOutlet UIView *bitcoinDonationButton;
@property(weak, nonatomic) IBOutlet UILabel *thankYouLabel;

@end

@implementation CMKDonationPopupView {
  id<GAITracker> _tracker;
  CGPoint _initialOrigin;
  CGSize _initialSize;
  NSArray *_finalViews;
  NSArray *_viewTexts;
  NSMutableArray *_finalOrigins;
  NSMutableArray *_finalSizes;
  NSMutableArray *_transitionViews;
}

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];

  if (self) {
    [self internalInit];
  }

  return self;
}

- (void)awakeFromNib {
  [self internalInit];
}

- (void)internalInit {
  _tracker = [[GAI sharedInstance] defaultTracker];
  self.backgroundColor = [UIColor clearColor];
  self.backgroundView.alpha = 0.0f;
  self.backgroundView.backgroundColor = [UIColor blackColor];
  self.contentView.alpha = 0.0f;
  self.contentView.layer.masksToBounds = NO;
  self.contentView.layer.cornerRadius = POPUP_CONTENT_CORNER_RADIUS;
  self.contentView.layer.shadowRadius = POPUP_CONTENT_SHADOW_RADIUS;
  self.contentView.layer.shadowOffset = CGSizeMake(0, 0);
  self.contentView.layer.shadowOpacity = POPUP_SHADOW_OPACITY;

  self.likeThisAppLabel.text =
      [NSLocalizedString(@"LikeThisAppMessage", nil) stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
  self.viaITunesLabel.text = NSLocalizedString(@"via iTunes:", nil);
  self.orViaBitcoinLabel.text = NSLocalizedString(@"or via Bitcoin:", nil);
  self.thankYouLabel.text = NSLocalizedString(@"Thank you!", nil);

  _finalViews = @[
    self.oneDollarDonationButton,
    self.threeDollarDonationButton,
    self.fiveDollarDonationButton,
    self.bitcoinDonationButton
  ];
  _viewTexts = @[ @"$1", @"$3", @"$5", @"BTC" ];
  _finalOrigins = [[NSMutableArray alloc] init];
  _finalSizes = [[NSMutableArray alloc] init];
  _transitionViews = [[NSMutableArray alloc] init];

  self.userInteractionEnabled = YES;
  UITapGestureRecognizer *mainTapGestureRecognizer =
      [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
  [mainTapGestureRecognizer setCancelsTouchesInView:NO];
  [self addGestureRecognizer:mainTapGestureRecognizer];

  [_tracker set:kGAIScreenName value:DONATION_POPUP_SCREEN];
  [_tracker send:[[GAIDictionaryBuilder createAppView] build]];
}

- (void)transitionIn:(UIView *)anchorImageView {
  _initialOrigin = [anchorImageView.superview convertPoint:anchorImageView.frame.origin toView:nil];
  _initialSize = anchorImageView.frame.size;

  int index = 0;

  for (CMKCircleWithTextView *finalView in _finalViews) {
    [_finalOrigins
        addObject:[NSValue valueWithCGPoint:[finalView.superview convertPoint:finalView.frame.origin toView:nil]]];
    [_finalSizes addObject:[NSValue valueWithCGSize:finalView.frame.size]];
    CMKCircleWithTextView *transitionView = [[CMKCircleWithTextView alloc]
        initWithFrame:CGRectMake(_initialOrigin.x, _initialOrigin.y, _initialSize.width, _initialSize.height)];
    [transitionView updateBackgroundColor:[CMKColors blueColor]];
    [transitionView updateTextColor:[CMKColors whiteColor]];
    [transitionView updateFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:FAQ_BUTTON_FONT_SIZE_IPHONE]];
    [transitionView updateText:_viewTexts[index]];
    transitionView.userInteractionEnabled = YES;
    [_transitionViews addObject:transitionView];
    [self addSubview:transitionView];

    index++;
  }

  [_transitionViews[0]
      addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self
                                                                   action:@selector(handleOneDollarButtonTapped)]];

  [_transitionViews[1]
      addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self
                                                                   action:@selector(handleThreeDollarButtonTapped)]];

  [_transitionViews[2]
      addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self
                                                                   action:@selector(handleFiveDollarButtonTapped)]];

  [_transitionViews[3]
      addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self
                                                                   action:@selector(handleBitcoinButtonTapped)]];

  [UIView animateWithDuration:POPUP_TRANSITION_DURAION_S
      animations:^{
        self.backgroundView.alpha = POPUP_SHADE_ALPHA;
        self.contentView.alpha = 1.0f;

        for (int index = 0; index < [_finalViews count]; index++) {
          ((CMKCircleWithTextView *)_transitionViews[index]).frame =
              CGRectMake([_finalOrigins[index] CGPointValue].x, [_finalOrigins[index] CGPointValue].y,
                         [_finalSizes[index] CGSizeValue].width, [_finalSizes[index] CGSizeValue].height);
        }
      }

      completion:^(BOOL finished){
      }];
}

- (void)close {
  CGRect initialFrame = CGRectMake(_initialOrigin.x, _initialOrigin.y, _initialSize.width, _initialSize.height);

  [UIView animateWithDuration:POPUP_TRANSITION_DURAION_S
      animations:^{
        self.backgroundView.alpha = 0.0f;
        self.contentView.alpha = 0.0f;

        for (int index = 0; index < [_finalViews count]; index++) {
          ((CMKCircleWithTextView *)_transitionViews[index]).frame = initialFrame;
        }
      }

      completion:^(BOOL finished) {
        [self removeFromSuperview];
      }];
}

- (void)handleOneDollarButtonTapped {
  NSLog(@"%@ handleOneDollarButtonTapped", _TAG);

  [self close];
}

- (void)handleThreeDollarButtonTapped {
  NSLog(@"%@ handleThreeDollarButtonTapped", _TAG);
  [self close];
}

- (void)handleFiveDollarButtonTapped {
  NSLog(@"%@ handleFiveDollarButtonTapped", _TAG);
  [self close];
}

- (void)handleBitcoinButtonTapped {
  NSLog(@"%@ handleBitcoinButtonTapped", _TAG);
  NSString *bitcoinAddressCopiedString = NSLocalizedString(@"BitcoinAddressCopied", nil);

  if ([self.thankYouLabel.text isEqualToString:bitcoinAddressCopiedString]) {
    [self close];
  } else {
    NSURL *bitcoinUrl = [NSURL URLWithString:[NSString stringWithFormat:@"bitcoin:%@", BITCOIN_ADDRESS]];

    if ([[UIApplication sharedApplication] canOpenURL:bitcoinUrl]) {
      [[UIApplication sharedApplication] openURL:bitcoinUrl];
    } else {
      UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
      pasteboard.string = BITCOIN_ADDRESS;
      // TODO(clocksmith): Toast.
      self.thankYouLabel.text = bitcoinAddressCopiedString;
    }
  }
}

@end
