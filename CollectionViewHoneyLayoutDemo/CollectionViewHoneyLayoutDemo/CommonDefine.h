//
//  CommonDefine.h
//  CollectionViewHoneyLayoutDemo
//
//  Created by CHC on 2016/10/20.
//  Copyright © 2016年 CHC. All rights reserved.
//

#ifndef CommonDefine_h
#define CommonDefine_h

#define Device_width    [UIScreen mainScreen].bounds.size.width

#define Device_height   [UIScreen mainScreen].bounds.size.height


#define ChangePolygonNumber  "PolygonNumber"

#define mm (Device_width - 100)/5

#define CC(b)           cos(M_PI *30/180)*(b)
#define CS(b)           sin(M_PI *30/180)*(b)
#define CST(a)          sin(M_PI*90/180)*(a)
#define COS(a)          cos(M_PI *a/180)
#define SIN(a)          sin(M_PI *a/180)
#endif /* CommonDefine_h */
