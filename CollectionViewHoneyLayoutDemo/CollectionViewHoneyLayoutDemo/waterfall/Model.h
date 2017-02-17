//
//  Model.h
//  CollectionViewHoneyLayoutDemo
//
//  Created by CHC on 2017/2/17.
//  Copyright © 2017年 CHC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject


/**
 *  高度
 */
@property (nonatomic ,assign) CGFloat height;

/**
 *  宽度
 */
@property (nonatomic ,assign) CGFloat width;

/**
 *  图片地址
 */
@property (nonatomic ,strong) NSString *imgUrl;

/**
 *  content_type
 */
@property (nonatomic ,strong) NSString *content_type;

/**
 *  description
 */
@property (nonatomic ,strong) NSString *desc;

/**
 *  item_id
 */
@property (nonatomic ,strong) NSString *item_id;

/**
 *  like_ct
 */
@property (nonatomic ,strong) NSString *like_ct;

/**
 *  publisher
 */
@property (nonatomic ,strong) NSString *publisher;

/**
 *  publisher_avatar
 */
@property (nonatomic ,strong) NSString *publisher_avatar;

/**
 *  title
 */
@property (nonatomic ,strong) NSString *title;

/**
 *  type
 */
@property (nonatomic ,strong) NSString *type;

- (void)modelDataFormatWithDict:(NSDictionary *)dict;


@end
