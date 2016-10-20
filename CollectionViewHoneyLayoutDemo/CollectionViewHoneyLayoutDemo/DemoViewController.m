//
//  ViewController.m
//  CollectionViewHoneyLayoutDemo
//
//  Created by CHC on 2016/10/20.
//  Copyright © 2016年 CHC. All rights reserved.
//

#import "DemoViewController.h"
#import "HoneyViewCell.h"
#import "HoneyViewLayout.h"

@interface DemoViewController ()<UICollectionViewDelegate ,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,HoneyViewCellDelegate>

@end


static NSString *Identifier = @"ListViewIdentifier";


@implementation DemoViewController
{
    BOOL isChange;
    HoneyViewLayout *mainFlowLayout;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.arrayData = [NSMutableArray arrayWithObjects:@"0", @"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12", nil];
    mainFlowLayout.margin = 5;
    [self configureNavigationItem];
    [self createMainListView];
}
- (void)configureNavigationItem
{
    UIBarButtonItem *rightItem1 = [[UIBarButtonItem alloc]initWithTitle:@"+" style:UIBarButtonItemStyleDone target:self action:@selector(addMargin)];
    UIBarButtonItem *rightItem2 = [[UIBarButtonItem alloc]initWithTitle:@"-" style:UIBarButtonItemStyleDone target:self action:@selector(changeMargin)];
    self.navigationItem.rightBarButtonItems = @[rightItem1,rightItem2];
}

- (void)addMargin
{
    if (mainFlowLayout.margin < 30 && mainFlowLayout.margin >= 0) {
        mainFlowLayout.margin ++;
    }
    else
    {
        mainFlowLayout.margin = 30;
        return ;
    }
    [self.mainCollectionView reloadData];
}

- (void)changeMargin
{
    if (mainFlowLayout.margin <= 30 && mainFlowLayout.margin > 0) {
        mainFlowLayout.margin --;
    }
    else
    {
        mainFlowLayout.margin = 0;
        return ;
    }
    [self.mainCollectionView reloadData];
}

- (void)createMainListView
{
    mainFlowLayout = [[HoneyViewLayout alloc]init];
    mainFlowLayout.itemCount = self.arrayData.count;
    mainFlowLayout.TopMargin = 80;
    
    self.mainCollectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:mainFlowLayout];
    self.mainCollectionView.delegate = self;
    self.mainCollectionView.dataSource = self;
    self.mainCollectionView.backgroundColor = [UIColor whiteColor];
    [self.mainCollectionView registerClass:[HoneyViewCell class] forCellWithReuseIdentifier:Identifier];
    [self.view addSubview:self.mainCollectionView];
}

#pragma mark ------ collection ---------
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.arrayData.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(2*mm, 2*CC(mm));
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HoneyViewCell *cell = (HoneyViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:Identifier forIndexPath:indexPath];
    cell.delegate = self;
    cell.currentPath = indexPath;
    cell.backgroundColor = [Tools randomColor];
    [cell.msgButton setTitle:[self.arrayData objectAtIndex:indexPath.item] forState:UIControlStateNormal];
    cell.tipImageView.image = [Tools imageWithColor:[Tools randomColor]];
    return cell;
}

- (void)didSelectItemAtCurrentPath:(NSIndexPath *)currentPath
{
    NSLog(@"当前点击的第%ld组 第%ld个",(long)currentPath.section,(long)currentPath.item);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
