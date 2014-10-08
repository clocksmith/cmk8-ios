//
//  CMKSpinnerDropdownCell.m
//  configuremk8
//
//  Created by Anthony Robledo on 9/13/14.
//  Copyright (c) 2014 Blunka. All rights reserved.
//

#import "CMKSpinnerListViewCell.h"

@implementation CMKSpinnerListViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

  if (self) {
    // Initialization code
  }

  return self;
}

- (void)awakeFromNib {
  // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  [super setSelected:selected animated:animated];

  // Configure the view for the selected state
}

- (void)layoutSubviews {
  [super layoutSubviews];

  if (self.iconPadding != 0) {
    self.imageView.frame = CGRectMake(self.iconPadding,
                                      self.iconPadding,
                                      self.imageView.frame.size.width - 2 * self.iconPadding,
                                      self.imageView.frame.size.height - 2 * self.iconPadding);
  }

  self.textLabel.frame = CGRectMake(self.imageView.frame.origin.x +
                                    self.imageView.frame.size.width +
                                    12,
                                    self.textLabel.frame.origin.y,
                                    self.textLabel.frame.size.width,
                                    self.textLabel.frame.size.height);
}

@end
