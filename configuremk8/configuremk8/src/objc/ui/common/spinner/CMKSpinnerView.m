//
//  CMKSpinner.m
//  configuremk8
//
//  Created by Anthony Robledo on 8/22/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKColors.h"
#import "CMKSpinnerView.h"
#import "CMKSpinnerListViewCell.h"
#import "CMKConstants.h"

#define _TAG (NSStringFromClass([CMKSpinnerView class]))

@interface CMKSpinnerView () <UITableViewDataSource, UITableViewDelegate>

- (void)open;
- (void)close;

@end

@implementation CMKSpinnerView {
  BOOL _isOpen;
  id <CMKSpinnerItem> _selectedItem;
  NSArray *_items;

  UIView *_superview;
  UIView *_contentView;
  UIView *_listViewContainer;
  UITableView *_listViewContent;
  UIView *_tapToCloseView;

  Class _tableViewCellClass;
}

static const float _DEFAULT_LIST_TOP_MARGIN = 2;
static const float _DEFAULT_LIST_BOTTOM_MARGIN = 8;
static const float _OPEN_ANIMATION_DURATION_S = 0.140;
static const float _CLOSE_ANIMATION_DURATION_S = 0.140;
static const float _TRANSFORMATION_SCALE = 0.8;

- (id)initWithFrame:(CGRect)frame withSuperview:(UIView *)superview {
  self = [super initWithFrame:frame];

  if (self) {
    _superview = superview;
    [self internalInit];
  }

  return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];

  if (self) {
    if (self.subviews.count == 0) {
      UINib *nib = [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
      _contentView = [[nib instantiateWithOwner:self options:nil] objectAtIndex:0];
      [self addSubview:_contentView];
    }
  }

  return self;
}

- (void)awakeFromNib {
  [super awakeFromNib];
  _superview = [self superview];
  [self internalInit];
}

- (void)layoutSubviews {
  [super layoutSubviews];
  _contentView.frame = self.bounds;
}

- (void)internalInit {
  NSLog(@"%@ internalInit ", _TAG);
  _isOpen = NO;

  self.listTopMargin = _DEFAULT_LIST_TOP_MARGIN;
  self.listBottomMargin = _DEFAULT_LIST_BOTTOM_MARGIN;
  self.selectedItemlabel.font = [UIFont systemFontOfSize:IS_IPAD ? DEFAULT_SPINNER_FONT_SIZE_IPAD
                                                        :DEFAULT_SPINNER_FONT_SIZE_IPHONE];

  self.userInteractionEnabled = YES;
  [_contentView addGestureRecognizer:
   [[UITapGestureRecognizer alloc]       initWithTarget:self
                                                 action:@selector(handleTapped:)]];

  self.selectedItemIcon.contentMode = UIViewContentModeScaleAspectFit;

  _listViewContainer = [[UIView alloc] init];
  _listViewContainer.backgroundColor = [UIColor whiteColor];
  _listViewContainer.layer.cornerRadius = 2;
  _listViewContainer.layer.shadowRadius = 4;
  _listViewContainer.layer.shadowOffset = CGSizeMake(0, 3.5);
  _listViewContainer.layer.shadowOpacity = 0.8;


  _listViewContent = [[UITableView alloc] init];
  _tableViewCellClass = [CMKSpinnerListViewCell class];
  [_listViewContent registerClass:_tableViewCellClass
           forCellReuseIdentifier:NSStringFromClass(_tableViewCellClass)];
  _listViewContent.delegate = self;
  _listViewContent.dataSource = self;
  _listViewContent.clipsToBounds = YES;
  _listViewContent.separatorInset = UIEdgeInsetsZero;
  _listViewContent.showsHorizontalScrollIndicator = NO;
  _listViewContent.bounces = NO;
}

- (void)updateSelectedItem:(id <CMKSpinnerItem> )item {
  _selectedItem = item;
  self.selectedItemlabel.text = [(id < CMKSpinnerItem >) item displayText];

  if ([_selectedItem respondsToSelector:@selector(icon)]) {
    self.selectedItemIcon.image = [_selectedItem icon];
  } else {
    self.selectedItemIcon.frame = CGRectZero;
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.selectedItemlabel
                                                     attribute:NSLayoutAttributeLeading
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeading
                                                    multiplier:1.0
                                                      constant:0.0]];
    [self updateConstraints];
    [self layoutIfNeeded];
  }
}

- (void)updateItems:(NSArray *)items {
  _items = items;
}

- (void)open {
  _isOpen = YES;

  _tapToCloseView = [[UIView alloc] initWithFrame:_superview.frame];
  _tapToCloseView.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  _tapToCloseView.backgroundColor = [UIColor clearColor];
  _tapToCloseView.userInteractionEnabled = YES;
  UITapGestureRecognizer *tapGestureRecognizer =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
  tapGestureRecognizer.cancelsTouchesInView = NO;
  [_tapToCloseView addGestureRecognizer:tapGestureRecognizer];
  [_superview addSubview:_tapToCloseView];

  [_listViewContent reloadData];

  float newListViewWidth = MAX(self.minimumListViewWidth,
                               _contentView.frame.size.width - self.pullDownTriangle.frame.size.width);

  CGRect contentViewFrameRelativeToSuperview = [_superview convertRect:_contentView.frame fromView:_contentView];
  float listViewContainerY = contentViewFrameRelativeToSuperview.origin.y +
    _contentView.bounds.size.height +
    self.listTopMargin;
  float listViewContentHeight = _listViewContent.contentSize.height;
  float newListViewHeight = MIN(_superview.bounds.size.height - listViewContainerY - self.listBottomMargin,
                                listViewContentHeight);

  float listViewContainerX;

  if (contentViewFrameRelativeToSuperview.origin.x > _superview.frame.size.width - newListViewWidth) {
    listViewContainerX = contentViewFrameRelativeToSuperview.origin.x +
      contentViewFrameRelativeToSuperview.size.width - newListViewWidth;
  } else {
    listViewContainerX = contentViewFrameRelativeToSuperview.origin.x;
  }

  _listViewContainer.frame = CGRectMake(listViewContainerX,
                                        listViewContainerY,
                                        newListViewWidth,
                                        newListViewHeight);
  _listViewContent.frame = CGRectMake(0,
                                      0,
                                      newListViewWidth,
                                      newListViewHeight);
  _listViewContainer.alpha = 0.0f;

  [_superview insertSubview:_listViewContainer aboveSubview:_tapToCloseView];
  [_listViewContainer addSubview:_listViewContent];

  _listViewContainer.transform = CGAffineTransformMake(_TRANSFORMATION_SCALE,
                                                       0,
                                                       0,
                                                       _TRANSFORMATION_SCALE,
                                                       0,
                                                       newListViewHeight * (_TRANSFORMATION_SCALE - 1) / 2);

  [UIView animateWithDuration:_OPEN_ANIMATION_DURATION_S
                   animations: ^{
                     _listViewContainer.transform = CGAffineTransformIdentity;
                     _listViewContainer.alpha = 1.0f;
                   }];
}

- (void)close {
  _isOpen = NO;
  float finalHeight = _listViewContainer.frame.size.height;
  [UIView animateWithDuration:_CLOSE_ANIMATION_DURATION_S
                   animations: ^{
                     _listViewContainer.transform = CGAffineTransformMake(0.8,
                                                         0,
                                                         0,
                                                         0.8,
                                                         0,
                                                         finalHeight * -0.1);
                     _listViewContainer.alpha = 0.0f;
                   }

                   completion: ^(BOOL finished) {
                     _listViewContainer.transform = CGAffineTransformIdentity;
                     [_tapToCloseView removeFromSuperview];
                     [_listViewContent removeFromSuperview];
                     [_listViewContainer removeFromSuperview];
                   }];
}

- (void)handleTapped:(UITapGestureRecognizer *)tapGestureRecognizer {
  if (!_isOpen) {
    [self open];
  } else {
    [self close];
  }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [_items count] - self.hideFirstItem;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  CMKSpinnerListViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(_tableViewCellClass)
                                    forIndexPath:indexPath];

  id <CMKSpinnerItem> item = _items[indexPath.row + self.hideFirstItem];

  cell.textLabel.text = [item displayText];
  cell.textLabel.textColor = [item respondsToSelector:@selector(displayColor)] ?
    [item displayColor] : [CMKColors darkGrayColor];
  cell.textLabel.font = self.listItemFont;

  if ([item respondsToSelector:@selector(icon)]) {
    cell.iconPadding = 8;
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    cell.imageView.image = [item icon];
  }

  cell.textLabel.font = self.listItemFont;

  return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  id <CMKSpinnerViewDelegate> strongDelegate = self.delegate;
  id <CMKSpinnerItem> item = _items[indexPath.row + self.hideFirstItem];

  if (strongDelegate &&
      [strongDelegate respondsToSelector:@selector(spinner:didSelectItem:)]) {
    [strongDelegate spinner:self didSelectItem:item];
  }

  [self close];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return self.cellHeight == 0 ? 44 : self.cellHeight;
}

@end
