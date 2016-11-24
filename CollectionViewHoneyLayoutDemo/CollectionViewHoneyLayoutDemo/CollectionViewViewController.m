//
//  CollectionViewViewController.m
//  CollectionViewHoneyLayoutDemo
//
//  Created by CHC on 2016/11/23.
//  Copyright © 2016年 CHC. All rights reserved.
//

#import "CollectionViewViewController.h"

@interface CollectionViewViewController ()

@end


static NSString *mainIndetifier = @"mainViewIdentifier";


@implementation CollectionViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
    
- (void)createMainListView
    {
        UICollectionViewFlowLayout *mainFlowLayout = [[UICollectionViewFlowLayout alloc]init];
        mainFlowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        mainFlowLayout.itemSize = CGSizeMake((Device_width - 15)/2, (Device_width - 15)/2 + 20);
        mainFlowLayout.minimumLineSpacing = 5;
        mainFlowLayout.minimumInteritemSpacing = 5;
        mainFlowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        
        self.mainListView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, Device_width, Device_height - 64 - 49) collectionViewLayout:mainFlowLayout];
        self.mainListView.delegate = self;
        self.mainListView.dataSource = self;
        self.mainListView.prefetchDataSource = self;
        self.mainListView.backgroundColor = [UIColor whiteColor];
        [self.mainListView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:mainIndetifier];
        [self.view addSubview:self.mainListView];
    }
    
- (void)addMainListViewMJRefresh
    {
        
    }
    
#pragma mark ------ collection ---------
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
    {
        return 20;
    }
    
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
    {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:mainIndetifier forIndexPath:indexPath];
        cell.backgroundColor = [UIColor purpleColor];
        return cell;
    }
    
- (void)collectionView:(UICollectionView *)collectionView prefetchItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths
    {
        
    }
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
    {
        NSLog(@"当前点击的是%lditem",(long)indexPath.item);
    }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
