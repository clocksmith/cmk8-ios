//
//  CMKAdjustAttributeView.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/27/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKColors.h"
#import "CMKCircleWithTextView.h"
#import "CMKAdjustAttributeView.h"
#import "CMKStatsModel.h"
#import "CMKUiUtils.h"

#define _TAG (NSStringFromClass([CMKAdjustAttributeView class]))

@interface CMKAdjustAttributeView ()

@property (nonatomic, weak) IBOutlet UILabel *attributeLabel;
@property (nonatomic, weak) IBOutlet CMKCircleWithTextView *decrementButton;
@property (nonatomic, weak) IBOutlet UISlider *slider;
@property (nonatomic, weak) IBOutlet CMKCircleWithTextView *incrementButton;

@end

@implementation CMKAdjustAttributeView {
  CMKAttribute _attribute;

  UIView *_contentView;
  CMKCircleWithTextView *_thumbView;
  CMKCircleWithTextView *_growDecrementButtonCircle;
  CMKCircleWithTextView *_growIncrementButtonCircle;

  BOOL _removeGrowCircles;
  BOOL _isThumbPressed;
}

static float const _SLIDER_VALUE_CHANGE_DURATION_S = 0.350;
static float const _BUTTON_SIZE_CHANGE_DURATION_S = 0.175;
static float const _BUTTON_SIZE_PULSE_DURATION_S = 0.075;
static float const _BUTTON_SIZE_SCALE = 1.15;
static NSString *const _DECREMENT_LABEL = @"-";
static NSString *const _INCREMENT_LABEL = @"+";

- (id)initWithFrame:(CGRect)frame {
  NSLog(@"%@ initWithFrame", _TAG);
  self = [super initWithFrame:frame];

  if (self) {
    [self internalInit];
  }

  return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
  NSLog(@"%@ initWithCoder", _TAG);
  self = [super initWithCoder:aDecoder];

  if (self) {
    NSLog(@"%@ self.subviews.count = %d", _TAG, self.subviews.count);

    if (self.subviews.count == 0) {
      UINib *nib = [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
      _contentView = [[nib instantiateWithOwner:self options:nil] objectAtIndex:0];
      _contentView.frame = self.bounds;
      [self addSubview:_contentView];
    }
  }

  return self;
}

- (void)awakeFromNib {
  NSLog(@"%@ awakeFromNib", _TAG);
  [super awakeFromNib];

  [self internalInit];
}

- (void)layoutSubviews {
  [super layoutSubviews];
  _contentView.frame = self.bounds;

  [self updateThumb];
}

- (void)internalInit {
  // Setup the decrement and increment buttons.
  [self.decrementButton updateBackgroundColor:[CMKColors grayColor]];
  [self.decrementButton updateTextColor:[CMKColors whiteColor]];
  [self.decrementButton updateText:_DECREMENT_LABEL];
  [self.decrementButton setNeedsDisplay];
  [self.incrementButton updateBackgroundColor:[CMKColors grayColor]];
  [self.incrementButton updateTextColor:[CMKColors whiteColor]];
  [self.incrementButton updateText:_INCREMENT_LABEL];
  [self.incrementButton setNeedsDisplay];

  // Setup the slider.
  self.slider.minimumValue = 0;
  self.slider.maximumValue = 100;
  self.slider.value = 0;
  self.slider.minimumTrackTintColor = [CMKColors blueColor];
}

- (IBAction)buttonTapped:(CMKCircleWithTextView *)sender {
  if (sender == self.decrementButton) {
    NSLog(@"%@ decrementButton", _TAG);
    self.slider.value--;
  } else if (sender == self.incrementButton) {
    NSLog(@"%@ incrementButton", _TAG);
    self.slider.value++;
  }

  [self updateThumb];

  // To animate this button we have to add a copy behind it so the constraints don't go nuts.
  CMKCircleWithTextView *largeCircle = [[CMKCircleWithTextView alloc] initWithFrame:sender.frame];
  [largeCircle updateBackgroundColor:[CMKColors grayColor]];
  [largeCircle updateTextColor:[CMKColors whiteColor]];
  [largeCircle updateText:@""];
  [largeCircle setNeedsDisplay];
  [_contentView insertSubview:largeCircle belowSubview:sender];

  CGAffineTransform transform = CGAffineTransformMakeScale(_BUTTON_SIZE_SCALE, _BUTTON_SIZE_SCALE);

  [UIView animateWithDuration:_BUTTON_SIZE_PULSE_DURATION_S
                   animations: ^{
                     largeCircle.transform = transform;
                   }

                   completion: ^(BOOL finished) {
                     [UIView  animateWithDuration:_BUTTON_SIZE_PULSE_DURATION_S
                      animations: ^{
                        largeCircle.transform = CGAffineTransformIdentity;
                     }

                      completion: ^(BOOL finished) {
                        [largeCircle removeFromSuperview];
                     }];
                   }];
}

- (IBAction)thumbPressed:(UISlider *)sender {
  _isThumbPressed = YES;
  _removeGrowCircles = NO;

  _growDecrementButtonCircle = [[CMKCircleWithTextView alloc] initWithFrame:self.decrementButton.frame];
  [_growDecrementButtonCircle updateBackgroundColor:[CMKColors grayColor]];
  [_growDecrementButtonCircle updateTextColor:[CMKColors whiteColor]];
  [_growDecrementButtonCircle updateText:@""];
  [_growDecrementButtonCircle setNeedsDisplay];
  [_contentView insertSubview:_growDecrementButtonCircle belowSubview:self.decrementButton];

  _growIncrementButtonCircle = [[CMKCircleWithTextView alloc] initWithFrame:self.incrementButton.frame];
  [_growIncrementButtonCircle updateBackgroundColor:[CMKColors grayColor]];
  [_growIncrementButtonCircle updateTextColor:[CMKColors whiteColor]];
  [_growIncrementButtonCircle updateText:@""];
  [_growIncrementButtonCircle setNeedsDisplay];
  [_contentView insertSubview:_growIncrementButtonCircle belowSubview:self.decrementButton];

  CGAffineTransform transform = CGAffineTransformMakeScale(_BUTTON_SIZE_SCALE, _BUTTON_SIZE_SCALE);

  [UIView animateWithDuration:_BUTTON_SIZE_CHANGE_DURATION_S
                   animations: ^{
                     _growDecrementButtonCircle.transform = transform;
                     _growIncrementButtonCircle.transform = transform;
                   }];
}

- (IBAction)thumbReleased:(UISlider *)sender {
  _isThumbPressed = NO;
  _removeGrowCircles = YES;

  [self.decrementButton updateText:_DECREMENT_LABEL];
  [self.incrementButton updateText:_INCREMENT_LABEL];


  [UIView animateWithDuration:_BUTTON_SIZE_CHANGE_DURATION_S
                   animations: ^{
                     _growDecrementButtonCircle.transform = CGAffineTransformIdentity;
                     _growIncrementButtonCircle.transform = CGAffineTransformIdentity;
                   }

                   completion: ^(BOOL finished) {
                     if (_removeGrowCircles) {
                     [_growDecrementButtonCircle removeFromSuperview];
                     [_growIncrementButtonCircle removeFromSuperview];
                     }
                   }];
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
  NSString *valueString = [NSString stringWithFormat:@"%d", (int)(self.slider.value + 0.5)];

  if (_isThumbPressed) {
    [self.decrementButton updateText:valueString];
    [self.decrementButton setNeedsDisplay];
    [self.incrementButton updateText:valueString];
    [self.incrementButton setNeedsDisplay];
  }

  [self updateThumb];

  id <CMKAdjustAttributeViewDelegate> strongDelegate = self.delegate;

  if (strongDelegate && [strongDelegate respondsToSelector:@selector(didChangeSliderValue)]) {
    [strongDelegate didChangeSliderValue];
  }
}

- (void)updateAttribute:(CMKAttribute)attribute {
  _attribute = attribute;
  self.attributeLabel.text = [CMKStatsModel displayNameForIndex:[NSNumber numberWithInt:attribute]];
}

- (void)updateAttributeValue:(float)value {
  [UIView animateWithDuration:_SLIDER_VALUE_CHANGE_DURATION_S
                   animations: ^{
                     [self.slider
                      setValue:value
                      animated:YES];
                     [self updateThumb];
                   }];
}

- (float)attributeValue {
  return lroundf(self.slider.value);
}

- (void)updateThumb {
  _thumbView = [[CMKCircleWithTextView alloc] initWithFrame:self.decrementButton.frame];
  [_thumbView updateBackgroundColor:[CMKColors blueColor]];
  [_thumbView updateTextColor:[CMKColors whiteColor]];
  [_thumbView updateText:[NSString stringWithFormat:@"%d", (int)(self.slider.value + 0.5)]];
  [self.slider setThumbImage:[CMKUiUtils imageWithView:_thumbView] forState:UIControlStateNormal];
  [self.slider setThumbImage:[CMKUiUtils imageWithView:_thumbView] forState:UIControlStateHighlighted];
  [_thumbView setNeedsDisplay];
}

@end
