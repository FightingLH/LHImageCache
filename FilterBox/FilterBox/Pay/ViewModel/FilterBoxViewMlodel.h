//
//  FilterBoxViewMlodel.h
//  FilterBox
//
//  Created by feeyo on 2018/5/16.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface FilterBoxViewMlodel : NSObject

/**
 * 获取最原始数据
 */
- (void)getModelFromLocal:(NSDictionary *)paremeter andBlock:(void(^)(id x, NSError *error))responseObject;
@end
