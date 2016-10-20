//
//  Tools.h
//  CollectionViewHoneyLayoutDemo
//
//  Created by CHC on 2016/10/20.
//  Copyright © 2016年 CHC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Tools : NSObject

/**
 *  根据圆的半径生成圆形图片
 */
+ (UIImage *)imageWithImage:(UIImage *)image radius:(CGFloat)radius;

/**
 *  根据颜色生成图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  根据颜色,尺寸生成图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color Size:(CGSize)size;

/**
 *  随机颜色
 */
+ (UIColor *)randomColor;
@end
