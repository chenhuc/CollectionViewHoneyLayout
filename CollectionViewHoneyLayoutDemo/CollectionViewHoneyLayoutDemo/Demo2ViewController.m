//
//  Demo2ViewController.m
//  CollectionViewHoneyLayoutDemo
//
//  Created by CHC on 2016/10/21.
//  Copyright © 2016年 CHC. All rights reserved.
//

#import "Demo2ViewController.h"
#import "PolygonViewCell.h"
#import "PolygonViewLayout.h"

@interface Demo2ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end


static NSString *demo2Identifier = @"demo2ListViewIdentifier";


@implementation Demo2ViewController
{
    BOOL isAdd;
    PolygonViewLayout *mainFlowLayout;
    NSString *valueStr;
    NSNotificationCenter *defaultCenter;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.arrayData = [NSMutableArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21", nil];
    defaultCenter = [NSNotificationCenter defaultCenter];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self createMainListView];
    [self configureNavigationItem];
}
- (void)configureNavigationItem
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"n边行" style:UIBarButtonItemStyleDone target:self action:@selector(numberClickAction)];
}

- (void)numberClickAction
{
    if (!isAdd) {
        if (mainFlowLayout.number < 12 && mainFlowLayout.number >= 3) {
            mainFlowLayout.number ++;
        }
        else
        {
            mainFlowLayout.number = 12;
            isAdd = YES;
        }
    }
    else
    {
        if (mainFlowLayout.number <= 12 && mainFlowLayout.number > 3) {
            mainFlowLayout.number --;
            
        }
        else
        {
            mainFlowLayout.number = 3;
            isAdd = NO;
        }
    }
    //发送消息
    valueStr = [NSString stringWithFormat:@"%ld",(long)mainFlowLayout.number];
    [defaultCenter postNotificationName:@"number" object:valueStr userInfo:nil];
    
    [self.mainCollectionView reloadData];
}
- (void)createMainListView
{
    mainFlowLayout = [[PolygonViewLayout alloc]init];
    mainFlowLayout.TopMargin = 80;
    mainFlowLayout.number = 3;
    mainFlowLayout.margin = 1;
    //发送消息 第一次采用通知中心发送number 失败 后采用单例进行第一次传值
/**
    valueStr = [NSString stringWithFormat:@"%ld",(long)mainFlowLayout.number];
    [defaultCenter postNotificationName:@"number" object:valueStr userInfo:nil];
*/
    [[PolygonSingle defaultManager] setInitNumber:mainFlowLayout.number];
    
    
    self.mainCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, Device_width, Device_height - 64) collectionViewLayout:mainFlowLayout];
    self.mainCollectionView.delegate = self;
    self.mainCollectionView.dataSource = self;
    self.mainCollectionView.backgroundColor = [UIColor whiteColor];
    [self.mainCollectionView registerClass:[PolygonViewCell class] forCellWithReuseIdentifier:demo2Identifier];
    [self.view addSubview:self.mainCollectionView];
}

- (void)addMainListViewMJRefresh
{
    
}

#pragma mark ------ collection ---------
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.arrayData.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PolygonViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:demo2Identifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
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
