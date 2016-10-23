//
//  PolygonViewCell.h
//  CollectionViewHoneyLayoutDemo
//
//  Created by CHC on 2016/10/21.
//  Copyright © 2016年 CHC. All rights reserved.
//  正多边形cell (基于圆形)

#import <UIKit/UIKit.h>

@interface PolygonViewCell : UICollectionViewCell
    

/**
 *  titleName
 */
@property (nonatomic ,strong) NSString *titleName;


/**
 *  backGroundColor
 */
@property (nonatomic ,strong) UIColor *backColor;

/**
 *  正n边形
 */
@property (nonatomic ,assign) NSInteger number;

@end
