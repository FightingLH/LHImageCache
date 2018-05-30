//
//  WebViewController.m
//  FilterBox
//
//  Created by feeyo on 2018/5/18.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>

@interface WebViewController ()<UIWebViewDelegate,WKUIDelegate,WKNavigationDelegate>

@property  (nonatomic, strong)  UIWebView  *webView;
@property  (nonatomic, strong)  WKWebView  *wkWebView;
@property  (nonatomic, assign)  BOOL       needLoadJSPOST;
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self testWkWebView];
    [self testWebView];
}


#warning mark -- wkwebview
- (void)testWkWebView
{
    self.needLoadJSPOST = YES;
    self.wkWebView = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //设置代理
    self.wkWebView.navigationDelegate = self;
    self.wkWebView.UIDelegate = self;
    // 获取JS所在的路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"JSPOST" ofType:@"html"];
    // 获得html内容
    NSString *html = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    // 加载js
    [self.wkWebView loadHTMLString:html baseURL:[[NSBundle mainBundle] bundleURL]];
    // 将WKWebView添加到当前View
    [self.view addSubview:self.wkWebView];
}

// 加载完成的代理方法
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    // 判断是否需要加载（仅在第一次加载）
    if (self.needLoadJSPOST) {
        // 调用使用JS发送POST请求的方法
        [self postRequestWithJS];
        // 将Flag置为NO（后面就不需要加载了）
        self.needLoadJSPOST = NO;
    }
}

// 调用JS发送POST请求
- (void)postRequestWithJS {
    // 发送POST的参数
    // 请求的页面地址
    NSString *urlStr = @"http://121.15.180.66:801/netpayment/BaseHttp.dll?MB_EUserPay";
    // 拼装成调用JavaScript的字符串
    
    NSString *jscript = [NSString stringWithFormat:@"post('%@', '%@');", urlStr,[self payJson]];
    
    //
    NSLog(@"Javascript: %@", jscript);
    // 调用JS代码
    [self.wkWebView evaluateJavaScript:jscript completionHandler:^(id object, NSError * _Nullable error) {
        self.needLoadJSPOST = NO;
    }];
    
}

- (NSString *)paremeterJson
{
    return @"";
}
#warning mark --webview

/**----- 测试通过 -----*/
- (void)testWebView
{
    self.webView = [[UIWebView alloc]init];
    self.webView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) ;
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
    
    NSString *payUrl = @"http://121.15.180.66:801/netpayment/BaseHttp.dll?MB_EUserPay";
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:payUrl]];
    
    [request setHTTPMethod:@"POST"];
    NSString *jsonRequestData = [NSString stringWithFormat:@"jsonRequestData=%@",[self payJson]];
    NSData *data = [jsonRequestData dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:data];
    [self.webView loadRequest:request];
}


- (NSString *)payJson
{
    NSDictionary *dic =  @{
        @"version":@"1.0",
        @"charset":@"UTF-8",
        @"sign":@"见签名处理章节",
        @"signType":@"SHA-256",
        @"reqData":@{
            @"dateTime":@"20180522112230",
            @"branchNo":@"0755",
            @"merchantNo":@"000054",
            @"date":@"20180522",
            @"orderNo":@"9999000001",
            @"amount":@"0.01",
            @"expireTimeSpan":@"1000000",
            @"payNoticeUrl":@"http://www.merchant.com/path/payNotice.do",
            @"payNoticePara":@"12345678|ABCDEFG|HIJKLM",
            @"returnUrl":@"http://www.merchant.com/path/return.do",
            @"clientIP":@"99.12.38.165",
            @"cardType":@"A",
            @"agrNo":@"12345678901234567890",
            @"merchantSerialNo":@"2016062014308888",
            @"userID":@"2016062388888",
            @"mobile":@"18202532653",
            @"lon":@"30.949505",
            @"lat":@"50.949506",
            @"riskLevel":@"",
            @"signNoticeUrl":@"http://www.merchant.com/path/signNotice.do",
            @"signNoticePara":@"12345678|ABCDEFG|HIJKLM",
            @"extendInfo":@"FC7788996853803BB6981F406BA84939CE96B8D57FFB20B653078B181FA9691D7CFF00D1D3EF21E6B338A3FD33690CAF12078BE885BB49F6016CF5A0314D21BF49738629F8386CB437A76A8DBE1E7E932DBDB18B7C69A8D10900FB8A3C98CB48833B5800A541DD6B5A12F65508C3BCD1D51B32DD02CCE362BB5CE4D95E5D29921E603BBE3CA5B650652589011304CC2969E2A1046F91A1849B70001FE23EA8592560BE4FB7994D51BC7E7F5F5E08474F7090A44D635F2BFD7353B081DF80613817FD357CD472392A2EFEB1DA52D72DADD3BD5725FE42FA9D4B19",
            @"extendInfoEncrypType":@"RC4"
        }
        };
   
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
