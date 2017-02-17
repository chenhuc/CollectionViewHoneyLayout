//
//  WaterLayout.h
//  CollectionViewHoneyLayoutDemo
//
//  Created by CHC on 2017/2/17.
//  Copyright © 2017年 CHC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WaterLayoutDelegate <NSObject>

@optional

/**
 *  获取单元格尺寸
 *  @param indexPath 下标
 *  @return item高度
 */
- (CGFloat)heightForItemAtIndexPath:(NSIndexPath *)indexPath;

@end


@interface WaterLayout : UICollectionViewLayout

/**
 *  单元格尺寸
 */
@property (nonatomic ,assign) CGSize itemSize;

/**
 *  列数
 */
@property (nonatomic ,assign) NSInteger numberOfColumns;

/**
 *  内边距
 */
@property (nonatomic ,assign) UIEdgeInsets sectionInSet;

/**
 *  item间隔
 */
@property (nonatomic ,assign) CGFloat ItemSpacing;

/**
 *  代理人属性
 */
@property (nonatomic ,weak) id<WaterLayoutDelegate> delegate;

@end
