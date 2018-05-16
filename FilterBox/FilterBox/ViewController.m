//
//  ViewController.m
//  FilterBox
//
//  Created by feeyo on 2018/5/16.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import "ViewController.h"
#import "FilterBoxViewMlodel.h"
#import "FilterBoxView.h"

@interface ViewController ()

@property  (nonatomic,  strong) FilterBoxViewMlodel *ViewModel;
@property  (nonatomic,  strong) FilterBoxView       *boxView;

@end

@implementation ViewController

- (FilterBoxViewMlodel *)ViewModel
{
    if (nil ==  _ViewModel) {
        _ViewModel = [[FilterBoxViewMlodel alloc]init];
    }
    return _ViewModel;
}


- (FilterBoxView *)boxView
{
    if (nil == _boxView) {
        _boxView = [[FilterBoxView alloc]init];
    }
    return _boxView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(clickResponse)];
    [self clickResponse];
}


- (void)clickResponse
{
    
    [self.ViewModel getModelFromLocal:@{@"paremeter":@"test"} andBlock:^(id x, NSError *error) {
        NSLog(@"%@",x);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
