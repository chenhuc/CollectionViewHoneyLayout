//
//  BaseViewController.m
//  CollectionViewHoneyLayoutDemo
//
//  Created by CHC on 2016/10/20.
//  Copyright © 2016年 CHC. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()<UITableViewDelegate ,UITableViewDataSource>

@end


static NSString *personIdentifier = @"personListViewIdentifier";


@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self loadSubClassData];
    [self createPersonListView];
}

- (void)loadSubClassData
{
    self.personDataArray = [[NSMutableArray alloc] init];
    self.classDataArray = [[NSMutableArray alloc] init];
    
    [self.personDataArray addObject:@"正六边形居中布局修改间距"];
    [self.classDataArray addObject:@"DemoViewController"];
    
    [self.personDataArray addObject:@"正六边形居中布局旋转"];
    [self.classDataArray addObject:@"Demo1ViewController"];
    
    [self.personDataArray addObject:@"正n边形居中布局"];
    [self.classDataArray addObject:@"Demo2ViewController"];
    
    [self.personDataArray addObject:@"普通CollectionView"];
    [self.classDataArray addObject:@"CollectionViewViewController"];
    
    [self.personDataArray addObject:@"CollectionView瀑布流布局"];
    [self.classDataArray addObject:@"WaterLayoutViewController"];
}

- (void)createPersonListView
{
    self.personTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Device_width, Device_height - 64) style:UITableViewStylePlain];
    self.personTableView.delegate = self;
    self.personTableView.dataSource = self;
    self.personTableView.tableFooterView = [UIView new];
    self.personTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.personTableView.backgroundColor = [UIColor clearColor];
    [self.personTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:personIdentifier];
    [self.view addSubview:self.personTableView];
}

- (void)addPersonListViewMJRefresh
{
    
}

#pragma mark ----- tableview ------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (!self.personDataArray.count) {
        return 10;
    }
    else
    {
        return self.personDataArray.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:personIdentifier];
    cell.imageView.image = [Tools imageWithImage:[Tools imageWithColor:[Tools randomColor] Size:CGSizeMake(30, 30)] radius:15];
    cell.textLabel.text = [self.personDataArray objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"当前选中的第%ld行",(long)indexPath.row);
    UIViewController *VC = [[NSClassFromString(self.classDataArray[indexPath.row]) alloc] init];
    VC.navigationItem.title = self.personDataArray[indexPath.row];
    VC.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:VC animated:YES];
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
