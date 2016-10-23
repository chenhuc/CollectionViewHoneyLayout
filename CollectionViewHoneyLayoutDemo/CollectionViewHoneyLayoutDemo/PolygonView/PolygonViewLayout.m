//
//  PolygonViewLayout.m
//  CollectionViewHoneyLayoutDemo
//
//  Created by CHC on 2016/10/21.
//  Copyright © 2016年 CHC. All rights reserved.
//

#import "PolygonViewLayout.h"


@implementation PolygonViewLayout
{
    NSMutableArray * _attributeAttay;
}

- (void)prepareLayout
{
    [super prepareLayout];
    _itemCount = [self.collectionView numberOfItemsInSection:0];
    _attributeAttay = [[NSMutableArray alloc]init];
    for (int i = 0 ; i < _itemCount; i ++) {
        //设置第一个正六边形的中心位置
        CGFloat X = self.collectionView.frame.size.width*0.5;
        CGFloat Y = self.TopMargin;
        int num = i%3 == 2? -1:i%3;
        int num2 = i%3 == 2? 1:i%3;
        X += CST(-num)*([self judgeYWithNumber:self.number]);
        Y += ([self judgeSizeWithNumber:self.number].height + self.margin)*(i/3) + CST(num2)*([self judgeSizeWithNumber:self.number].height/2)+self.margin;
        UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        // 设置每隔item的大小
        attribute.size = [self judgeSizeWithNumber:self.number];
        // 设置每隔item的圆心
        // 计算每个item的中心坐标
        attribute.center = CGPointMake(X, Y);
        [_attributeAttay addObject:attribute];
    }
}

- (CGFloat)judgeYWithNumber:(NSInteger)xNumber
{
    if (xNumber == 3 ) {
        return mm + self.margin - COS(360/xNumber)*mm;
    }
    else if (xNumber == 4)
    {
        return mm + self.margin + COS(360/xNumber)*mm;
    }
    else if (xNumber == 5)
    {
        return mm + self.margin + SIN(360/xNumber)*mm - 5;
    }
    else if (xNumber == 6)
    {
        return mm + self.margin + COS(360/xNumber)*mm;
    }
    else if (xNumber == 7)
    {
        return mm + self.margin + SIN(360/xNumber)*mm;
    }
    else
    {
        return 2*mm + self.margin ;
    }
}

- (CGSize)judgeSizeWithNumber:(NSInteger)sNumber
{
    if (sNumber == 3 || sNumber == 6 ) {
        return CGSizeMake(2*mm,2*SIN(360/sNumber)*mm);
    }
    else
    {
        return CGSizeMake(2*(mm),2*mm);
    }
}

//设置内容区域的大小
-(CGSize)collectionViewContentSize
{
    CGFloat hh = [self judgeSizeWithNumber:self.number].height;
    CGFloat height = (hh+self.margin)*(self.itemCount/3 + 1) + self.TopMargin + 20;
    if (height > Device_height) {
        height = height;
    }
    else
    {
        height = Device_height;
    }
    
    return CGSizeMake(Device_width, height);
}

//返回设置数组
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return _attributeAttay;
}

@end
