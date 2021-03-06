//
//  HoneyViewLayout.m
//  MercedesBenz
//
//  Created by CHC on 2016/10/19.
//  Copyright © 2016年 BM. All rights reserved.
//

#import "HoneyViewLayout.h"

@implementation HoneyViewLayout
{
    NSMutableArray * _attributeAttay;
}

- (void)prepareLayout
{
    [super prepareLayout];
    _itemCount = [self.collectionView numberOfItemsInSection:0];
    _attributeAttay = [[NSMutableArray alloc]init];
    
    // 设置每个item的大小和半径
    for (int i = 0 ; i < _itemCount; i ++) {
        //设置第一个正六边形的中心位置
        CGFloat X = self.collectionView.frame.size.width*0.5;
        CGFloat Y = self.TopMargin;
        int num = i%3 == 2? -1:i%3;
        int num2 = i%3 == 2? 1:i%3;
        X += CST(-num)*(1.5*mm + self.margin/2+CC(self.margin/2));
        Y += (CC(mm)*2 + self.margin)*(i/3) + CST(num2)*(CC(mm)+self.margin/2);
        UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        // 设置每隔item的大小
        attribute.size = CGSizeMake(2*mm,2*CC(mm));
        // 设置每隔item的圆心
        // 计算每个item的中心坐标
        attribute.center = CGPointMake(X, Y);
        [_attributeAttay addObject:attribute];
    }
}

//设置内容区域的大小
-(CGSize)collectionViewContentSize
{
    CGFloat height = (2*(CC(mm))+self.margin)*(self.itemCount/3 + 1) + self.TopMargin + 20;
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
