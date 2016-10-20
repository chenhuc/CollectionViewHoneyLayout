//
//  HoneyViewCell.h
//  MercedesBenz
//
//  Created by CHC on 2016/10/19.
//  Copyright © 2016年 BM. All rights reserved.
//

#import <UIKit/UIKit.h>


@class HoneyViewCell;

@protocol HoneyViewCellDelegate <NSObject>

@optional

- (void)didSelectItemAtCurrentPath:(NSIndexPath *)currentPath;

@end




@interface HoneyViewCell : UICollectionViewCell


/**
 *  message
 */
@property (nonatomic ,strong) UIButton *msgButton;

/**
 *  tipMessage
 */
@property (nonatomic ,strong) UIImageView *tipImageView;


/**
 *  backView
 */
@property (nonatomic ,strong) UIImageView *backView;

/**
 *  item标识
 */
@property (nonatomic ,strong) NSIndexPath *currentPath;


/**
 *  rotation
 */
@property (nonatomic ,assign) BOOL isRotation;


/**
 *  delegate
 */
@property (nonatomic ,weak) id <HoneyViewCellDelegate>delegate;


@end
