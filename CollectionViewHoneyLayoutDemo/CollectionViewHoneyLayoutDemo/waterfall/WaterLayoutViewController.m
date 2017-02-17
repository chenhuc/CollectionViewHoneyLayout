//
//  WaterLayoutViewController.m
//  CollectionViewHoneyLayoutDemo
//
//  Created by CHC on 2017/2/17.
//  Copyright © 2017年 CHC. All rights reserved.
//

#import "WaterLayoutViewController.h"
#import "WaterLayout.h"
#import "Model.h"


@interface WaterLayoutViewController ()<WaterLayoutDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

/**
 *  数据源数组
 */
@property (nonatomic, strong) NSMutableArray *dataSource;

/**
 *  集合视图
 */
@property (nonatomic, strong) UICollectionView *collectionView;


@end


static NSString *personIdentifier = @"personListViewIdentifier";

@implementation WaterLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getData];
    [self createMainListView];
}

- (void)getData
{
    self.dataSource = [[NSMutableArray alloc]init];
    NSString *path = [NSString stringWithFormat:@"%@/data.json",[[NSBundle mainBundle] resourcePath]];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSArray *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSArray *array = [dict valueForKey:@"feeds"];
    for (NSDictionary *dic in array)
    {
        Model *model = [[Model alloc] init];
        [model modelDataFormatWithDict:dic];
        [self.dataSource addObject:model];
    }
}

- (void)createMainListView
{
    WaterLayout *layout = [[WaterLayout alloc]init];
    layout.delegate = self;
    layout.itemSize = CGSizeMake((self.view.frame.size.width - 30)/2, (self.view.frame.size.width - 30)/2);
    layout.ItemSpacing = 10;
    layout.sectionInSet = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.numberOfColumns = 2;
    
    
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, Device_width, Device_height - 64) collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:personIdentifier];
    [self.view addSubview:self.collectionView];
}

- (CGFloat)heightForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = (self.view.frame.size.width - 30)/2;
    NSArray *array = @[@"1.2",@"1.0",@"1.35",@"0.75",@"0.85"];
    CGFloat number = arc4random_uniform(5);
    CGFloat height = ceilf([[array objectAtIndex:number] floatValue] *width);
    return height;
}

#pragma mark ------ collection ---------

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:personIdentifier forIndexPath:indexPath];
    for (UIView *cView in cell.contentView.subviews) {
        [cView removeFromSuperview];
    }
    Model *model = [self.dataSource objectAtIndex:indexPath.row];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, (cell.contentView.frame.size.height - 30)/2, cell.contentView.frame.size.width - 20, 30)];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [NSString stringWithFormat:@"%@",model.title];
    [cell.contentView addSubview:label];
    cell.backgroundColor = [UIColor lightGrayColor];
    cell.backgroundColor = [Tools randomColor];
    [cell layoutIfNeeded];
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
