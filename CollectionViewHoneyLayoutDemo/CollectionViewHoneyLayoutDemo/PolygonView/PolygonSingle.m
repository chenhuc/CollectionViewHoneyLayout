//
//  PolygonSingle.m
//  CollectionViewHoneyLayoutDemo
//
//  Created by CHC on 2016/10/21.
//  Copyright © 2016年 CHC. All rights reserved.
//

#import "PolygonSingle.h"

@implementation PolygonSingle

static PolygonSingle *defaultSingle = nil;
+(PolygonSingle *)defaultManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultSingle = [[PolygonSingle alloc]init];
    });
    return defaultSingle;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)setInitNumber:(NSInteger)initNumber
{
    if (initNumber == 0 || !initNumber) {
        _initNumber = [[NSString stringWithFormat:@"%d",3] integerValue];
    }
    else
    {
        _initNumber = initNumber;
    }
}

@end
