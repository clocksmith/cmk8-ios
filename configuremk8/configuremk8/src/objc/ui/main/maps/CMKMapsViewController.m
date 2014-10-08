//
//  CMKMapsViewController.m
//  configuremk8
//
//  Created by Anthony Robledo on 9/9/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKConstants.h"
#import "CMKMapsViewController.h"
#import "CMKMapsModel.h"
#import "CMKUserDefaultslUtils.h"
#import "CMKSpinnerView.h"
#import "CMKCourses.h"
#import "CMKCupModel.h"
#import "CMKCourseModel.h"
#import "CMKUiUtils.h"
#import "CMKMainTabBarController.h"

#define _TAG (NSStringFromClass([CMKMapsViewController class]))

@interface CMKMapsViewController () <UIScrollViewDelegate,
                                     CMKSpinnerViewDelegate>

@property (nonatomic, weak) IBOutlet CMKSpinnerView *cupSpinnerView;
@property (nonatomic, weak) IBOutlet CMKSpinnerView *courseSpinnerView;
@property (nonatomic, weak) IBOutlet UIImageView *upwardTriangle;
@property (nonatomic, weak) IBOutlet UIScrollView *mapChooserView;
@property (nonatomic, weak) IBOutlet UIImageView *downwardTriangle;

@end

@implementation CMKMapsViewController {
  CMKMapsModel *_model;
  NSMutableArray *_mapPlaceholderImages;
  NSMutableArray *_mapImageViews;
  NSMutableArray *_fullMapsLoaded;
  BOOL _mapChooserViewInitialized;
}

static int const PLACEHOLDER_MAP_DIMEN = 64;
static int const ACTUAL_MAP_DIMEN = 512;

- (instancetype)init {
  self = [super initWithTitle:MAPS_TITLE_STRING withImageName:MAPS_ICON_IMAGE];

  if (self) {
    _model = [CMKUserDefaultslUtils loadMapsModel];

    if (_model == nil) {
      _model = [CMKMapsModel init];
      [CMKUserDefaultslUtils saveMapsModel:_model];
    }

    _mapPlaceholderImages = [[NSMutableArray alloc] init];
    _mapImageViews = [[NSMutableArray alloc] init];
    _fullMapsLoaded = [[NSMutableArray alloc] init];

    for (int i = 0; i < [[CMKCourses courses] count]; i++) {
      _fullMapsLoaded[i] = @NO;
    }
  }

  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  self.mapChooserView.pagingEnabled = YES;
  self.mapChooserView.clipsToBounds = YES;
  self.mapChooserView.showsHorizontalScrollIndicator = NO;
  self.mapChooserView.showsVerticalScrollIndicator = NO;

  CGSize placeholderSize = CGSizeMake(PLACEHOLDER_MAP_DIMEN, PLACEHOLDER_MAP_DIMEN);

  for (CMKCourseModel *course in[CMKCourses courses]) {
    UIImage *mapViewImage = [CMKUiUtils imageWithImage:[UIImage imageNamed:course.mapImageName]
                                          scaledToSize:placeholderSize];
    NSLog(@"%@ course.mapImageName %@", _TAG, course.mapImageName);
    [_mapPlaceholderImages addObject:mapViewImage];
  }

  NSLog(@"%@ _mapImages count: %d", _TAG, [_mapPlaceholderImages count]);
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];

  // Setup the cup spinner view.
  self.cupSpinnerView.delegate = self;
  [self.cupSpinnerView updateItems:[CMKCourses cups]];
  CMKMainTabBarController *mainTabBarController = ((CMKMainTabBarController *)self.parentViewController);
  float tabBarHeight = mainTabBarController.tabBar.frame.size.height;
  self.cupSpinnerView.listBottomMargin += tabBarHeight;
  self.cupSpinnerView.cellHeight = self.cupSpinnerView.frame.size.height;
  self.cupSpinnerView.listItemFont = [UIFont systemFontOfSize:DEFAULT_SPINNER_FONT_SIZE];

  // Setup the course spinner view.
  self.courseSpinnerView.delegate = self;
  CMKCupModel *cup = [CMKCourses cups][_model.courseIndex / NUM_COURSES_PER_CUP];
  [self.courseSpinnerView updateItems:cup.courses];
  self.courseSpinnerView.listBottomMargin += tabBarHeight;
  self.courseSpinnerView.cellHeight = IS_IPAD ? COURSE_SPINNER_DROPDOWN_ITEM_HEIGHT_IPAD :
    COURSE_SPINNER_DROPDOWN_ITEM_HEIGHT_IPHONE;
  self.courseSpinnerView.listItemFont =
    [UIFont systemFontOfSize:IS_IPAD ?
           DEFAULT_SPINNER_FONT_SIZE:COURSE_SPINNER_LIST_VIEW_FONT_SIZE_IPHONE];

  if (IS_IPAD) {
    self.courseSpinnerView.minimumListViewWidth = self.courseSpinnerView.frame.size.width * 1.3;
  }

  // Setup the map chooser view.
  if (!_mapChooserViewInitialized) {
    self.mapChooserView.delegate = self;
    int scrollViewWidth = self.mapChooserView.frame.size.width;
    int scrollViewHeight = self.mapChooserView.frame.size.height;
    self.mapChooserView.contentSize = CGSizeMake(scrollViewWidth,
                                                 scrollViewHeight * [_mapPlaceholderImages count]);

    int mapViewIndex = 0;

    for (UIImage *mapImage in _mapPlaceholderImages) {
      CGRect mapImageViewFrame = CGRectMake(0,
                                            0,
                                            scrollViewWidth,
                                            scrollViewHeight);
      UIImageView *mapImageView = [[UIImageView alloc] initWithImage:mapImage];
      mapImageView.frame = mapImageViewFrame;
      mapImageView.contentMode = UIViewContentModeScaleAspectFit;

      CGRect subScrollViewFrame = CGRectMake(0,
                                             mapViewIndex * scrollViewHeight,
                                             scrollViewWidth,
                                             scrollViewHeight);
      UIScrollView *subScrollView = [[UIScrollView alloc] initWithFrame:subScrollViewFrame];
      subScrollView.delegate = self;
      [subScrollView addSubview:mapImageView];
      subScrollView.maximumZoomScale = 2.0;
      subScrollView.minimumZoomScale = 1.0;

      [self.mapChooserView addSubview:subScrollView];
      [_mapImageViews addObject:mapImageView];
      mapViewIndex++;
    }

    _mapChooserViewInitialized = YES;
  }

  [self updateAllViews];
}

- (void)didReceiveMemoryWarning {
  NSLog(@"%@ didReceiveMemoryWarning", _TAG);
  [super didReceiveMemoryWarning];

  int pageIndex = (int)self.mapChooserView.contentOffset.y / self.mapChooserView.frame.size.height;
  CGSize placeholderSize = CGSizeMake(PLACEHOLDER_MAP_DIMEN, PLACEHOLDER_MAP_DIMEN);

  for (int mapIndex = 0; mapIndex < [_mapImageViews count]; mapIndex++) {
    if (mapIndex < pageIndex - 1 || mapIndex > pageIndex + 1) {
      CMKCourseModel *course = [CMKCourses courses][mapIndex];
      ((UIImageView *)_mapImageViews[mapIndex]).image =
        [CMKUiUtils imageWithImage:[UIImage imageNamed:course.mapImageName]
                      scaledToSize:placeholderSize];
      _fullMapsLoaded[mapIndex] = @NO;
      NSLog(@"%@ Released full map for mapIndex: %d", _TAG, mapIndex);
    }
  }
}

#pragma mark - CMKSpinnerViewDelegate

- (void)spinner:(CMKSpinnerView *)spinner didSelectItem:(id <CMKSpinnerItem> )item {
  if (spinner == self.cupSpinnerView) {
    _model.courseIndex = ((CMKCourseModel *)((CMKCupModel *)item).courses[0]).courseIndex;
    [self updateAllViews];
  } else if (spinner == self.courseSpinnerView) {
    _model.courseIndex = ((CMKCourseModel *)item).courseIndex;
    [self updateCourseSpinnerView];
    [self updateMapChooserView];
    [self updateTriangles];
  } else {
    [NSException raise:@"Invalid CMKSpinnerView"
                format:@"The spinner must be either the cup spinner view or the course spinner view"];
  }

  [CMKUserDefaultslUtils saveMapsModel:_model];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
  if (scrollView == self.mapChooserView) {
    int pageIndex = (int)self.mapChooserView.contentOffset.y / self.mapChooserView.frame.size.height;

    _model.courseIndex = pageIndex;
    [CMKUserDefaultslUtils saveMapsModel:_model];

    [self loadFullMapsForCurrentIndex];
    [self updateCupSpinnerView];
    [self updateCourseSpinnerView];
    [self updateTriangles];
  }
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
  // If the scroll view is not the map chooser view, then it is a subview.
  if (scrollView != self.mapChooserView) {
    int pageIndex = (int)self.mapChooserView.contentOffset.y / self.mapChooserView.frame.size.height;
    return _mapImageViews[pageIndex];
  } else {
    return self.mapChooserView;
  }
}

#pragma mark - CMKConfigureViewController Views

- (void)updateAllViews {
  [self updateCupSpinnerView];
  [self updateCourseSpinnerView];
  [self updateMapChooserView];
  [self updateTriangles];
}

- (void)updateCupSpinnerView {
  NSLog(@"%@ updateCupSpinnerView", _TAG);
  [self.cupSpinnerView
   updateSelectedItem:
   [CMKCourses cups][_model.courseIndex / NUM_COURSES_PER_CUP]];
}

- (void)updateCourseSpinnerView {
  NSLog(@"%@ updateCourseSpinnerView", _TAG);
  [self.courseSpinnerView
   updateItems:
   ((CMKCupModel *)[CMKCourses cups][_model.courseIndex / NUM_COURSES_PER_CUP]).courses];
  [self.courseSpinnerView
   updateSelectedItem:[CMKCourses courses][_model.courseIndex]];
}

- (void)updateMapChooserView {
  NSLog(@"%@ updateMapChooserView", _TAG);
  [self.mapChooserView
   setContentOffset:CGPointMake(0, _model.courseIndex * self.mapChooserView.frame.size.height)
           animated:YES];
  [self loadFullMapsForCurrentIndex];
}

- (void)updateTriangles {
  _upwardTriangle.hidden = _model.courseIndex == 0;
  _downwardTriangle.hidden = _model.courseIndex == ([[CMKCourses courses] count] - 1);
}

#pragma mark - Helper methods

- (void)loadFullMapsForCurrentIndex {
  // Load the map to the left.
  if (_model.courseIndex > 0) {
    [self loadMapForIndex:_model.courseIndex - 1];
  }

  // Load the current map.
  [self loadMapForIndex:_model.courseIndex];

  // Load the map to the right.
  if (_model.courseIndex < [[CMKCourses courses] count] - 1) {
    [self loadMapForIndex:_model.courseIndex + 1];
  }
}

- (void)loadMapForIndex:(int)index {
  NSLog(@"%@ loadMapForIndex", _TAG);

  if (![_fullMapsLoaded[index] boolValue]) {
    NSLog(@"%@ loading full map: %d", _TAG, index);
    CGSize actualSize = CGSizeMake(ACTUAL_MAP_DIMEN, ACTUAL_MAP_DIMEN);
    UIImage *fullMapViewImage = [CMKUiUtils imageWithImage:
                                 [UIImage imageNamed:
                                  ((CMKCourseModel *)[CMKCourses courses][index]).mapImageName]
                                              scaledToSize:actualSize];
    ((UIImageView *)_mapImageViews[index]).image = fullMapViewImage;
    _fullMapsLoaded[index] = [NSNumber numberWithBool:YES];
  }
}

@end
