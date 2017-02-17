//
//  Model.m
//  CollectionViewHoneyLayoutDemo
//
//  Created by CHC on 2017/2/17.
//  Copyright © 2017年 CHC. All rights reserved.
//

#import "Model.h"

@implementation Model


- (void)modelDataFormatWithDict:(NSDictionary *)dict
{
    if (dict) {
        self.imgUrl = [dict valueForKey:@"card_image"];
        self.content_type = [dict valueForKey:@"content_type"];
        self.desc = [dict valueForKey:@"description"];
        self.item_id = [dict valueForKey:@"item_id"];
        self.like_ct = [dict valueForKey:@"like_ct"];
        self.publisher = [dict valueForKey:@"publisher"];
        self.publisher_avatar = [dict valueForKey:@"publisher_avatar"];
        self.title = [dict valueForKey:@"title"];
        self.type = [dict valueForKey:@"type"];
        NSArray *arr1 = @[@"1",@"2"];
        int number1 = arc4random_uniform(2);
        int number2 = arc4random_uniform(2);
        self.height = [[arr1 objectAtIndex:number1] floatValue];
        self.width = [[arr1 objectAtIndex:number2] floatValue];
    }
}

@end
