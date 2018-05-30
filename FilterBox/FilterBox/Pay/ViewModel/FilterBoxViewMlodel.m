//
//  FilterBoxViewMlodel.m
//  FilterBox
//
//  Created by feeyo on 2018/5/16.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import "FilterBoxViewMlodel.h"
#import "FilterBoxModel.h"

@implementation FilterBoxViewMlodel


- (void)getModelFromLocal:(NSDictionary *)paremeter andBlock:(void (^)(id, NSError *))responseObject
{
    if (responseObject) {
        responseObject([self getSimulationAllData],nil);
    }
}


- (NSArray *)getSimulationAllData
{
    NSMutableArray *localArray = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i < arc4random() % 15; i ++)
    {
        FilterBoxModel *model = [[FilterBoxModel alloc]init];
        model.title = [NSString stringWithFormat:@"第一级第%@个模型",@(i)];
        model.secodArray = [self getSimulationSeconderModel];
        [localArray addObject:model];
    }
    return localArray.copy;
}

- (NSArray *)getSimulationSeconderModel
{
    NSMutableArray *secondArray = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i < arc4random() %10; i++) {
        FilterBoxSecondaryModel *model = [[FilterBoxSecondaryModel alloc]init];
        model.title = [NSString stringWithFormat:@"第二级第%@个模型",@(i)];
        model.threeArray = [self getSimulationThreeModel];
        [secondArray addObject:model];
    }
    return secondArray.copy;
}

- (NSArray *)getSimulationThreeModel
{
    NSMutableArray *threeArray = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i < arc4random() %10; i++) {
        FilterBoxThreeModel *model = [[FilterBoxThreeModel alloc]init];
        model.title = [NSString stringWithFormat:@"第三级第%@个模型",@(i)];
        [threeArray addObject:model];
    }
    return threeArray.copy;
}

@end
