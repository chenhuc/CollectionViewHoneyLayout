//
//  MoveCollectionViewCell.h
//  CollectionViewHoneyLayoutDemo
//
//  Created by CHC on 2016/11/28.
//  Copyright © 2016年 CHC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MoveCollectionViewCellDelegate <NSObject>
@optional
- (void)mainListViewLongpressClickWithPressState:(UIGestureRecognizerState)pressState  currentIndex:(NSIndexPath *)currentIndex;


@end



@interface MoveCollectionViewCell : UICollectionViewCell

/**  uilabel  */
@property (nonatomic ,strong)   UILabel *titleNameLabel;

/**  index  */
@property (nonatomic ,strong)   NSIndexPath *currentIndex;

/**
 *  delegate
 */
@property (nonatomic ,weak) id <MoveCollectionViewCellDelegate> delegate;

@end
