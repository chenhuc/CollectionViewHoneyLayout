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
 *  根据颜色生成图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  随机颜色
 */
+ (UIColor *)randomColor;
@end
