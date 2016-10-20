//
//  Tools.m
//  CollectionViewHoneyLayoutDemo
//
//  Created by CHC on 2016/10/20.
//  Copyright © 2016年 CHC. All rights reserved.
//

#import "Tools.h"

@implementation Tools

/**
 *  根据圆的半径生成圆形图片
 */
+ (UIImage *)imageWithImage:(UIImage *)image radius:(CGFloat)radius
{
    CGFloat w = image.size.width;
    CGFloat h = image.size.height;
    CGFloat scale = [UIScreen mainScreen].scale;
    if (radius < 0) {
        radius = 0;
    }
    else if(radius > MIN(w,h))
    {
        radius  = MIN(w, h)/2;
    }
    UIImage *tempImage = nil;
    CGRect imageFrame = CGRectMake(0, 0, w, h);
    UIGraphicsBeginImageContextWithOptions(image.size, NO, scale);
    [[UIBezierPath bezierPathWithRoundedRect:imageFrame cornerRadius:radius] addClip];
    [image drawInRect:imageFrame];
    tempImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tempImage;
}

/**
 *  根据颜色生成图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color
{
    return [self imageWithColor:color Size:CGSizeMake(1, 1)];
}
/**
 *  根据颜色,尺寸生成图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color Size:(CGSize)size
{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 *  随机颜色
 */
+ (UIColor *)randomColor
{
    NSInteger aRedValue = arc4random()%255;
    NSInteger aGreenValue = arc4random()%255;
    NSInteger aBlueValue = arc4random()%255;
    UIColor *randColor = [UIColor colorWithRed:aRedValue / 255.0f green:aGreenValue / 255.0f blue:aBlueValue / 255.0f alpha:1.0f];
    return randColor;
}
@end
