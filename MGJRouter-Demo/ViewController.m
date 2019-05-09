//
//  ViewController.m
//  MGJRouter-Demo
//  iOS路由（MGJRouter）
//  Created by 纵昂 on 2019/5/9.
//  Copyright © 2019 GitHub:https://github.com/ZongAng123. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) UIButton *btn;
@property (strong, nonatomic) UIButton *btn1;
@property (strong, nonatomic) UIButton *btn2;
@property (strong, nonatomic) UIButton *btn3;
@end

@implementation ViewController
/**
 最开始想做路由，是因为当时app中有大量与H5之间的交互，原生和H5的跳转操作比较多比较频繁，新增一个跳转又涉及到改代码发版本,为了统一iOS、安卓和H5的跳转，引入了路由。
 **/
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"zongang15@yahoo.com";
    
    self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn.frame = CGRectMake(50, 100, 300, 50);
    [self.btn setTitle:@"我是第一个按钮" forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    self.btn.titleLabel.font = [UIFont systemFontOfSize:20];
    self.btn.backgroundColor = [UIColor cyanColor];
    [self.btn addTarget:self action:@selector(pushTest1ModuleAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
    
    self.btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn1.frame = CGRectMake(50, 200, 300, 50);
    [self.btn1 setTitle:@"我是第二个按钮" forState:UIControlStateNormal];
    [self.btn1 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    self.btn1.titleLabel.font = [UIFont systemFontOfSize:20];
    self.btn1.backgroundColor = [UIColor cyanColor];
    [self.btn1 addTarget:self action:@selector(pushTest2ModuleAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn1];
    
    self.btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn2.frame = CGRectMake(50, 300, 300, 50);
    [self.btn2 setTitle:@"我是第3个按钮" forState:UIControlStateNormal];
    [self.btn2 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    self.btn2.titleLabel.font = [UIFont systemFontOfSize:20];
    self.btn2.backgroundColor = [UIColor cyanColor];
    [self.btn2 addTarget:self action:@selector(pushTest3ModuleAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn2];
    
    self.btn3 = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn3.frame = CGRectMake(50, 250, 300, 50);
    [self.btn3 setTitle:@"我是第4个按钮" forState:UIControlStateNormal];
    [self.btn3 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    self.btn3.titleLabel.font = [UIFont systemFontOfSize:20];
    self.btn3.backgroundColor = [UIColor cyanColor];
    [self.btn3 addTarget:self action:@selector(objectTestAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn3];
    
    
}
/**  作用:
 后来发现路由，还可很多作用。Router就像是个调度中心，各个模块通过路由调度其他模块，模块之间不需要相互引用，调度方式更加统一，更加自由，能够实现解耦的作用，同时也为之后的组件化开发提供了基础。
 **/
-(void)pushTest1ModuleAction:(id)sender{
    NSLog(@"第一个按钮");
    [MGJRouter openURL:@"LWT://Test1/PushMainVC"
          withUserInfo:@{@"navigationVC" : self.navigationController,
                         }
            completion:nil];
}
/** 路由选择
 目前github优秀的路由设计已经有很多，如JLRoutes，MGJRouter，CTMediator。
 JLRoutes提供的功能比较复杂，有很多我个人用不上的功能，所以没有选择。
 CTMediator更适合业务比较复杂的情况，MGJRouter的使用上更加容易上手，功能也比较简单，更加适用于页面跳转这种业务比较多的场景。所以我项目中选择了MGJRouter
 
 **/
-(void)pushTest2ModuleAction:(id)sender{
    NSLog(@"第2个按钮");
    [MGJRouter openURL:@"LWT://Test2/PushMainVC"
          withUserInfo:@{@"navigationVC" : self.navigationController,
                         @"text": @"爱就像蓝天白云晴空万里",
                         }
            completion:nil];
}
//很多人说没有反向传值的方法，其实和我们其他跳转一样，传参数的时候使用block即可解决。
-(void)pushTest3ModuleAction:(id)sender{
    NSLog(@"第3个按钮");
    [MGJRouter openURL:@"LWT://Test3/PushMainVC"
          withUserInfo:@{@"navigationVC" : self.navigationController,
                         @"block":^(NSString * text){
        NSLog(@"%@",text);
    },
                         }
            completion:nil];
    
}
-(void)objectTestAction:(id)sender{
    NSLog(@"第4个按钮");
    [self.navigationController pushViewController:[MGJRouter objectForURL:@"LWT://Test2/getMainVC" withUserInfo:@{@"text" : @"我知道我对你不仅仅是喜欢",}] animated:YES];
}

/**
 
 **/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 
 **/
@end
