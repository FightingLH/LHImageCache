//
//  FilterBoxView.m
//  FilterBox
//
//  Created by feeyo on 2018/5/16.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import "FilterBoxView.h"


@interface FilterBoxView()

@end

@implementation FilterBoxView


+ (FilterBoxView *)showBoxWithModel:(id)model
{
    FilterBoxView *boxView = [[FilterBoxView alloc]init];
    boxView.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 100);
    boxView.backgroundColor = [UIColor blueColor];
    return boxView;
}
@end
