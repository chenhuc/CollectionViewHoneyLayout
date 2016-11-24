//
//  CollectionViewViewController.h
//  CollectionViewHoneyLayoutDemo
//
//  Created by CHC on 2016/11/23.
//  Copyright © 2016年 CHC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewViewController : UIViewController

    
/**  collection  */
@property (nonatomic ,strong) UICollectionView *mainListView;
/**  dataArray  */
@property (nonatomic ,strong) NSMutableArray *mainDataArray;
@end
