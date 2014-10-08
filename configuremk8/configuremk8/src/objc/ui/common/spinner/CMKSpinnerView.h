//
//  CMKSpinner.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/22/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CMKSpinnerView;

@protocol CMKSpinnerItem <NSObject>

@required

- (NSString *)displayText;

@optional

- (UIColor *) displayColor;
- (UIImage *) icon;

@end


@protocol CMKSpinnerViewDelegate <NSObject>

@required

- (void)      spinner:(CMKSpinnerView *)spinner didSelectItem:(id <CMKSpinnerItem> )item;

@end


@interface CMKSpinnerView : UIView

@property (nonatomic, weak) IBOutlet UIImageView *selectedItemIcon;
@property (nonatomic, weak) IBOutlet UILabel *selectedItemlabel;
@property (nonatomic, weak) IBOutlet UIView *bottomBar;
@property (nonatomic, weak) IBOutlet UIView *pullDownTriangle;

@property (nonatomic, weak) id <CMKSpinnerViewDelegate> delegate;

@property (nonatomic) BOOL hideFirstItem;
@property (nonatomic) float listTopMargin;
@property (nonatomic) float listBottomMargin;
@property (nonatomic) float cellHeight;
@property (nonatomic) float cellIconWidth;
@property (nonatomic) float minimumListViewWidth;
@property (nonatomic, weak) UIFont *listItemFont;

- (void)updateSelectedItem:(id <CMKSpinnerItem> )item;

- (void)updateItems:(NSArray *)items;

@end
