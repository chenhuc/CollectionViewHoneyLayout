//
//  PolygonViewLayout.h
//  CollectionViewHoneyLayoutDemo
//
//  Created by CHC on 2016/10/21.
//  Copyright © 2016年 CHC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PolygonViewLayout : UICollectionViewLayout
/**
 *  这个int值存储有多少个item
 */
@property(nonatomic,assign) NSInteger itemCount;

/**
 *  item间距
 */
@property(nonatomic,assign) NSInteger margin;
/**
 *  item顶部间距 ,最小为64（带导航栏）
 */
@property(nonatomic,assign) NSInteger TopMargin;

/**
 *  偏移量
 */
@property(nonatomic,assign) NSInteger contentSizeY;

/**
 *  正n边形
 */
@property (nonatomic ,assign) NSInteger number;


@end
