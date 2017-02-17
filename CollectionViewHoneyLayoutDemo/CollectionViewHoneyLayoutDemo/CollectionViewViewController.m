//
//  CollectionViewViewController.m
//  CollectionViewHoneyLayoutDemo
//
//  Created by CHC on 2016/11/23.
//  Copyright © 2016年 CHC. All rights reserved.
//

#import "CollectionViewViewController.h"

@interface CollectionViewViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIGestureRecognizerDelegate>
@end


static NSString *mainIndetifier = @"mainViewIdentifier";


@implementation CollectionViewViewController
{
    UILongPressGestureRecognizer *mainPress;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self createMainListView];
}
    
- (void)createMainListView
{
    UICollectionViewFlowLayout *mainFlowLayout = [[UICollectionViewFlowLayout alloc]init];
    mainFlowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    mainFlowLayout.itemSize = CGSizeMake((Device_width - 2.25)/2, (Device_width - 2.25)/2 + 20);
    mainFlowLayout.minimumLineSpacing = 0.75;
    mainFlowLayout.minimumInteritemSpacing = 0.75;
    mainFlowLayout.sectionInset = UIEdgeInsetsMake(0, 0.75, 0, 0.75);
    
    self.mainListView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, Device_width, Device_height - 64) collectionViewLayout:mainFlowLayout];
    self.mainListView.delegate = self;
    self.mainListView.dataSource = self;
    self.mainListView.backgroundColor = [UIColor whiteColor];
    [self.mainListView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:mainIndetifier];
    [self.view addSubview:self.mainListView];
}
#pragma mark ------ collection ---------
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}
    
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:mainIndetifier forIndexPath:indexPath];
    for (UIView *cView in cell.contentView.subviews) {
        [cView removeFromSuperview];
    }
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, (cell.contentView.frame.size.height - 20)/2, cell.contentView.frame.size.width, 20)];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [NSString stringWithFormat:@"%ld",(long)indexPath.item];
    [cell.contentView addSubview:label];
    cell.backgroundColor = [UIColor lightGrayColor];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"当前点击的是%lditem",(long)indexPath.item);
}

#pragma mark -------- collectionMenuView ----------
// 是否显示菜单
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

// 菜单中哪些编辑操作可以显示
- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender
{
    if (indexPath.item == 2 || indexPath.item == 3) {
        return YES;
    }
    return NO;
}
// 对于显示的编辑操作怎么执行
- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender
{
    if (action == @selector(cut:)) {
        NSLog(@"点击的是剪切***Cut");
    }
    else if (action == @selector(copy:)) {
        NSLog(@"点击的是赋值***Copy");
    }
    else  {
        NSLog(@"点击的是粘贴***Paste");
    }
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
