//
//  MoveCollectionViewCell.m
//  CollectionViewHoneyLayoutDemo
//
//  Created by CHC on 2016/11/28.
//  Copyright © 2016年 CHC. All rights reserved.
//

#import "MoveCollectionViewCell.h"


@interface MoveCollectionViewCell ()

@end



@implementation MoveCollectionViewCell
{
    UILongPressGestureRecognizer *mainPress;
}
- (void)setup
{
    for (UIView *cView in self.contentView.subviews) {
        [cView removeFromSuperview];
    }
    self.titleNameLabel.frame = CGRectMake(0, self.contentView.frame.size.height/2 - 10, self.contentView.frame.size.width, 20);
    [self.contentView addSubview:self.titleNameLabel];
    mainPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(mainListViewLongpressClick:)];
    [self.contentView addGestureRecognizer:mainPress];
}

- (void)mainListViewLongpressClick:(UILongPressGestureRecognizer *)cellLongPress
{
    if ([self.delegate respondsToSelector:@selector(mainListViewLongpressClickWithPressState:currentIndex:)]) {
        [self.delegate mainListViewLongpressClickWithPressState:cellLongPress.state currentIndex:self.currentIndex];
    }
}

- (UILabel *)titleNameLabel
{
    if (!_titleNameLabel) {
        _titleNameLabel = [UILabel new];
        _titleNameLabel.textAlignment = NSTextAlignmentCenter;
        _titleNameLabel.textColor = [UIColor blackColor];
        _titleNameLabel.font = [UIFont systemFontOfSize:15];
    }
    return _titleNameLabel;
}


@end
