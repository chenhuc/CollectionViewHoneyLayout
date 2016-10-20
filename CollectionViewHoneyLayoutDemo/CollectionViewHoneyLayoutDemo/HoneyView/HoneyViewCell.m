//
//  HoneyViewCell.m
//  MercedesBenz
//
//  Created by CHC on 2016/10/19.
//  Copyright © 2016年 BM. All rights reserved.
//

#import "HoneyViewCell.h"

@implementation HoneyViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.msgButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.msgButton addTarget:self action:@selector(msgButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//        self.msgButton.userInteractionEnabled = YES;
        [self.contentView addSubview:self.msgButton];
        self.backView = [UIImageView new];
        self.backView.userInteractionEnabled = YES;
        [self.contentView addSubview:self.backView];
        self.tipImageView = [UIImageView new];
        self.tipImageView.userInteractionEnabled = YES;
        [self.contentView addSubview:self.tipImageView];
        
    }
    return self;
}

- (void)msgButtonClick:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(didSelectItemAtCurrentPath:)]) {
        [self.delegate didSelectItemAtCurrentPath:self.currentPath];
    }
    else
    {
        NSLog(@"点击事件");
    }
}

- (void)setIsRotation:(BOOL)isRotation
{
    _isRotation = isRotation;
    if (isRotation) {
        self.transform = CGAffineTransformMakeRotation(M_PI/2);
        for (UIView *bView in self.contentView.subviews) {
            bView.transform = CGAffineTransformMakeRotation(-M_PI/2);
        }
    }
    else
    {
        self.transform = CGAffineTransformMakeRotation(M_PI*0);
        for (UIView *bView in self.contentView.subviews) {
            bView.transform = CGAffineTransformMakeRotation(M_PI*0);
        }
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGPoint point = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    bezierPath.lineCapStyle = kCGLineCapRound;
    bezierPath.lineJoinStyle = kCGLineCapRound;
    
    [bezierPath moveToPoint: CGPointMake(point.x - CS(mm) , point.y + CC(mm))];
    [bezierPath addLineToPoint: CGPointMake(point.x + CS(mm), point.y + CC(mm))];
    [bezierPath addLineToPoint: CGPointMake(point.x + mm, point.y )];
    [bezierPath addLineToPoint: CGPointMake(point.x + CS(mm), point.y - CC(mm))];
    [bezierPath addLineToPoint: CGPointMake(point.x - CS(mm), point.y - CC(mm))];
    [bezierPath addLineToPoint: CGPointMake(point.x - mm, point.y)];
    [bezierPath addLineToPoint: CGPointMake(point.x - CS(mm) , point.y + CC(mm))];
    [bezierPath closePath];
    
    // step 2: 根据路径生成蒙板
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = [bezierPath CGPath];
    
    // step 3: 给cell添加模版
    self.layer.mask = maskLayer;
    self.msgButton.frame = self.bounds;
    self.tipImageView.frame = CGRectMake((self.contentView.frame.size.width - 20)/2, 0, 20, 20);
}

@end
