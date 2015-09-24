//
//  CMKPartGroupChooserView.h
//  configuremk8
//
//  Created by Anthony Robledo on 8/14/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMKPartGroupModel.h"
#import "CMKPartImageView.h"

@class CMKPartGroupChooserView;

@protocol CMKPartGroupChooserViewDelegate<NSObject>

- (void)partGroupChooserView:(CMKPartGroupChooserView *)partGroupChooserView
          didSelectPartGroup:(CMKPartGroupModel *)partGroup;

@end

@interface CMKPartGroupChooserView : UIView<UIScrollViewDelegate>

@property(nonatomic, weak) id<CMKPartGroupChooserViewDelegate> delegate;

- (void)drawPartGroups:(CMKOrderedDictionary *)partGroups;

- (void)selectPartGroup:(CMKPartGroupModel *)partGroup isAnimated:(BOOL)animated;

@end
