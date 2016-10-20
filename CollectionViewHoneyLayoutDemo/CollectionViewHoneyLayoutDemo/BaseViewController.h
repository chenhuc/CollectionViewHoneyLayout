//
//  BaseViewController.h
//  CollectionViewHoneyLayoutDemo
//
//  Created by CHC on 2016/10/20.
//  Copyright © 2016年 CHC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

/**
 *  <#Description#>
 */
@property (nonatomic ,strong) UITableView *personTableView;

/**
 *  <#Description#>
 */
@property (nonatomic ,strong) NSMutableArray *personDataArray;

/**
 *  <#Description#>
 */
@property (nonatomic ,strong) NSMutableArray *classDataArray;




@end
