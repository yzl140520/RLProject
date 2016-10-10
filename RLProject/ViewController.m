//
//  ViewController.m
//  RLProject
//
//  Created by yzl on 16/10/9.
//  Copyright © 2016年 RLProject. All rights reserved.
//

#import "ViewController.h"
#import "GetShoolDetailInfo.h"
#import "ZTHSchoolDetailInfoResult.h"
#import "YTKBaseRequest+ZTRequest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton* send = [[UIButton alloc]initWithFrame:CGRectMake(10, 50, 100, 45)];
    [send setBackgroundColor:[UIColor redColor]];
    [send setTitle:@"发送" forState:UIControlStateNormal];
    [send addTarget:self action:@selector(send:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:send];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)send:(UIButton*)sender{

    GetShoolDetailInfo* api = [[GetShoolDetailInfo alloc]initWithSchoolId:@"vE7Z48ptN75viDCtAKX"];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        SchoolDetailInfoResult* result = [request result];
        
        NSString* ssstrl;
        
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
    }];
}
@end
