//
//  FilterBoxModel.h
//  FilterBox
//
//  Created by feeyo on 2018/5/16.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FilterBoxThreeModel     : NSObject
@property  (nonatomic, copy)      NSString *title;
@end

@interface FilterBoxSecondaryModel : NSObject
@property  (nonatomic, strong)    NSArray  *threeArray;
@property  (nonatomic, copy)      NSString *title;
@end


@interface FilterBoxModel : NSObject
@property  (nonatomic, strong)    NSArray  *secodArray;
@property  (nonatomic, copy)      NSString *title;
@end
