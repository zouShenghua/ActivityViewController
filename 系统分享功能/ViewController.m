//
//  ViewController.m
//  系统分享功能
//
//  Created by 邹 on 16/12/30.
//  Copyright © 2016年 邹. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame=CGRectMake(100, 100, 100, 100);
    btn.backgroundColor=[UIColor redColor];
    [btn setTitle:@"系统分享功能" forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}


-(void)share{
    NSString *text = @"也趣直播QQ分享功能开发测试01";
    
    UIImage *image = [UIImage imageNamed:@"屏幕快照 2016-12-30 上午10.26.45"];
    
    NSURL *url = [NSURL URLWithString:@"http://www.yequtv.cn"];
    
    //数组中放入分享的内容
    
    NSArray *activityItems = @[text,image,url];
    
    // 实现服务类型控制器
    
    UIActivityViewController *activityViewController =
    
    [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    
    [self presentViewController:activityViewController animated:YES completion:nil];
    
    // 分享类型
    [activityViewController setCompletionWithItemsHandler:^(NSString * __nullable activityType, BOOL completed, NSArray * __nullable returnedItems, NSError * __nullable activityError){
        
        //显示选中的分享类型
        NSLog(@"当前选择分享平台 %@",activityType);
        
        if (completed) {
            
            NSLog(@"分享成功");
            
        }else {
            
            NSLog(@"分享失败");
            
        }
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
