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
#import "WebViewController.h"

@interface ViewController ()


@end

@implementation ViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(clickResponse)];
}


- (void)clickResponse
{
    NSURL *url = [NSURL URLWithString:
                  @"cmbmobilebank://CMBLS/FunctionJump?action=gofuncid&funcid=200007&serverid= CMBEUserPay&cmb_app_trans_parms_start=here&…"];
    if (![[UIApplication sharedApplication] canOpenURL:url]) {
        //未安装手机银行
        WebViewController *web = [[WebViewController alloc]init];
        [self.navigationController pushViewController:web animated:YES];
    } else {
        //已安装手机银行
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
