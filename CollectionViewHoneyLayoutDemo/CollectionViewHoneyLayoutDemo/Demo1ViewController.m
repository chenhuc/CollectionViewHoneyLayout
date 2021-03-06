//
//  Demo1ViewController.m
//  CollectionViewHoneyLayoutDemo
//
//  Created by CHC on 2016/10/20.
//  Copyright © 2016年 CHC. All rights reserved.
//

#import "Demo1ViewController.h"
#import "HoneyViewCell.h"
#import "HoneyViewLayout2.h"

@interface Demo1ViewController ()<UICollectionViewDelegate ,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,HoneyViewCellDelegate>

@end


static NSString *Identifier = @"ListViewIdentifier";


@implementation Demo1ViewController

{
    BOOL isRotation;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.arrayData = [NSMutableArray arrayWithObjects:@"0", @"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12", nil];
    [self configureNavigationItem];
    [self createMainListView];
}

- (void)configureNavigationItem
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"旋转" style:UIBarButtonItemStyleDone target:self action:@selector(rotationClick)];
}

- (void)rotationClick
{
    if (!isRotation) {
        isRotation = YES;
    }
    else
    {
        isRotation = NO;
    }
    [self.mainCollectionView reloadData];
}

- (void)createMainListView
{
    HoneyViewLayout2 *mainFlowLayout = [[HoneyViewLayout2 alloc]init];
    mainFlowLayout.itemCount = self.arrayData.count;
    // 两种模式下的间距不一致
    mainFlowLayout.margin = 0;
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
    cell.isRotation = isRotation;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
