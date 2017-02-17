//
//  WaterLayout.m
//  CollectionViewHoneyLayoutDemo
//
//  Created by CHC on 2017/2/17.
//  Copyright © 2017年 CHC. All rights reserved.
//

#import "WaterLayout.h"

@interface WaterLayout()

/**
 *  列高
 */
@property (nonatomic, strong) NSMutableArray *columnsHeights;

/**
 *  item的数量
 */
@property (nonatomic, assign) NSInteger numberOfItems;

/**
 *  存放每个item的位置信息的数组
 */
@property (nonatomic, strong) NSMutableArray *itemAttributes;

/**
 *  临时存储当前item的x值
 */
@property (nonatomic, assign) CGFloat item_X;

/**
 *  临时存储当前item的Y值
 */
@property (nonatomic, assign) CGFloat item_Y;

/**
 *  最矮列下标
 */

@property (nonatomic, assign) NSInteger shortestIndex;

@end

@implementation WaterLayout

#pragma mark ------- 获取最矮列的下标 ---------

- (NSInteger)getShortestColumnIndex
{
    //最矮列的下标
    NSInteger shortestIndex = 0;
    
    // column 高度
    CGFloat shortestHeight = MAXFLOAT;
    
    // 遍历数组获得最矮列的下标
    for (NSInteger i = 0; i < self.numberOfColumns ; i++) {
        CGFloat currentHeight = [[self.columnsHeights objectAtIndex:i] floatValue];
        if (currentHeight < shortestHeight) {
            shortestHeight = currentHeight;
            shortestIndex = i;
        }
    }
    return shortestIndex;
}

#pragma mark ------- 获取最高列的下标 ---------
- (NSInteger)getHeighestColumnIndex
{
    //最高列的下标
    NSInteger heighestIndex = 0;
    
    // column 高度
    CGFloat heighestHeight = 0;
    
    // 遍历数组获得最高列的下标
    for (NSInteger i = 0; i < self.numberOfColumns ; i++) {
        CGFloat currentHeight = [[self.columnsHeights objectAtIndex:i] floatValue];
        if (currentHeight > heighestHeight) {
            heighestHeight = currentHeight;
            heighestIndex = i;
        }
    }
    return heighestIndex;
}

#pragma mark ------- 添加顶部内边距的值 ---------

- (void)addTopValueForColumn
{
    for (NSInteger i = 0; i < self.numberOfColumns; i++) {
        self.columnsHeights[i] = @(self.sectionInSet.top);
    }
}

#pragma mark ------ 计算每个item的X和Y ------

- (void)getOriginInShortColumn
{
    // 获取最矮列的下标
    self.shortestIndex = [self getShortestColumnIndex];
    
    // 获取最矮列的高度
    CGFloat shortestHeight = [[self.columnsHeights objectAtIndex:self.shortestIndex] floatValue];
    
    // 设置item的X
    self.item_X = self.sectionInSet.left + (self.itemSize.width + self.ItemSpacing)*self.shortestIndex;
    
    // 设置item的Y
    self.item_Y = self.ItemSpacing + shortestHeight;
    
}

#pragma mark ------- 计算width和height --> 生成frame

- (void)setFrame:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *layoutAttribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    // 存放item的高度
    CGFloat itemHeight = 0;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(heightForItemAtIndexPath:)]) {
        
        itemHeight = [self.delegate heightForItemAtIndexPath:indexPath];
    }
    
    layoutAttribute.frame = CGRectMake(self.item_X, self.item_Y, self.itemSize.width, itemHeight);
    
    // 将位置信息加入到数组;
    [self.itemAttributes addObject:layoutAttribute];
    
    // 更新当前列的高度
    self.columnsHeights[self.shortestIndex] = @(self.item_Y + itemHeight);
}

#pragma mark ------- 重写父类的布局方法 ----------

- (void)prepareLayout
{
    [super prepareLayout];
    
    // 为高度数组添加上编剧
    [self addTopValueForColumn];
    
    // 获取item的个数
    self.numberOfItems = [self.collectionView numberOfItemsInSection:0];
    
    // 循环布局
    for (NSInteger i = 0; i < self.numberOfItems; i ++) {
        
        // 计算item的X和Y
        [self getOriginInShortColumn];
        
        // 生成indexPath
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        // 生成frame
        [self setFrame:indexPath];
    }
}

#pragma mark ------ 获取contentView的尺寸 ------

- (CGSize)collectionViewContentSize
{
    // 获取最高的下标
    NSInteger heighestIndex = [self getHeighestColumnIndex];
    
    // 获取最高列高度
    
    CGFloat heighestHeight = [[self.columnsHeights objectAtIndex:heighestIndex] floatValue];
    
    // 构造contentView的size
    CGSize size = self.collectionView.frame.size;
    
    // 修改高度
    size.height = heighestHeight + self.sectionInSet.bottom;
    
    // 返回size
    return size;
}

#pragma mark ------ 返回位置信息的数组

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.itemAttributes;
}


#pragma mark ------- init --------

- (NSMutableArray *)columnsHeights
{
    if (!_columnsHeights) {
        _columnsHeights = [NSMutableArray array];
    }
    return _columnsHeights;
}

- (NSMutableArray *)itemAttributes
{
    if (!_itemAttributes) {
        _itemAttributes = [NSMutableArray array];
    }
    return _itemAttributes;
}



@end
