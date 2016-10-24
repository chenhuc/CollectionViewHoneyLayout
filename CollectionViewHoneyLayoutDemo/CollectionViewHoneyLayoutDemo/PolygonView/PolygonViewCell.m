//
//  PolygonViewCell.m
//  CollectionViewHoneyLayoutDemo
//
//  Created by CHC on 2016/10/21.
//  Copyright © 2016年 CHC. All rights reserved.
//

#import "PolygonViewCell.h"

@interface PolygonViewCell()

/**
 *  titleLabel
 */
@property (nonatomic ,strong) UILabel *titleLabel;

    
@end


@implementation PolygonViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel = [UILabel new];
        self.titleLabel.tintColor = [UIColor whiteColor];
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.text = @"12";
        self.number = [PolygonSingle defaultManager].initNumber;
        [self.contentView addSubview:self.titleLabel];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notice:) name:@"number" object:nil];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    // step 1: 绘制正n变形
    CGFloat X = self.contentView.frame.size.width  * 0.5;
    CGFloat Y = self.contentView.frame.size.height * 0.5;
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    bezierPath.lineCapStyle = kCGLineCapRound;
    bezierPath.lineJoinStyle = kCGLineCapRound;
    CGFloat angle = labs(360/self.number);
    [bezierPath moveToPoint: CGPointMake(X - mm , Y)];
    for (int i = 0; i < self.number - 1; i ++) {
        CGFloat angle1 = angle *(i + 1);
        CGFloat XX = X + (mm * (COS(angle1)))*(-1);
        CGFloat YY = Y + mm * (SIN(angle1));
        [bezierPath addLineToPoint: CGPointMake(XX, YY)];
    }
    [bezierPath addLineToPoint: CGPointMake(X - mm , Y)];
    // step 2: 根据路径生成蒙板
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = [bezierPath CGPath];
    
    self.backgroundColor = [UIColor redColor];
    // step 3: 给cell添加模版
    self.layer.mask = maskLayer;
    self.titleLabel.frame = self.bounds;
}

-(void)notice:(NSNotification *)nsno{
    NSLog(@"%@ === %@ === %@", nsno.object, nsno.userInfo, nsno.name);
    self.number = [nsno.object integerValue];
    [self setNeedsLayout];
}

- (void)setTitleName:(NSString *)titleName
{
    if (!titleName || titleName == nil) {
        _titleName = @"";
    }
    else
    {
        _titleName = titleName;
    }
    self.titleLabel.text = _titleName;
}

- (void)setBackColor:(UIColor *)backColor
{
    if (backColor == nil || !backColor) {
        _backColor = [UIColor lightGrayColor];
    }
    else
    {
        _backColor = backColor;
    }
    self.contentView.backgroundColor = _backColor;
}


@end

