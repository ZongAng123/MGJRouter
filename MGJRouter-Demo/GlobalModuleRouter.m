//
//  GlobalModuleRouter.m
//  MGJRouter-Demo
//  iOS路由（MGJRouter）
//  Created by 纵昂 on 2019/5/9.
//  Copyright © 2019 GitHub:https://github.com/ZongAng123. All rights reserved.
//

#import "GlobalModuleRouter.h"

@implementation GlobalModuleRouter
// 在load方法中自动注册，在主工程中不用写任何代码。

+ (void)load {
/**  MGJRouter
 MGJRouter就一个单例类，使用前需要通过注册组件，调用方通过URL调用服务方页面，通过路由表的映射关系进行关联，调用方可以传入复 杂的参数、对象等。
 基本跳转主要是注册组件，调用openURl方法，传入参数即可实现。
 **/
    [MGJRouter registerURLPattern:@"LWT://Test1/PushMainVC" toHandler:^(NSDictionary *routerParameters) {
        UINavigationController *navigationVC = routerParameters[MGJRouterParameterUserInfo][@"navigationVC"];
        TestViewController1 *vc = [[TestViewController1 alloc] init];
        [navigationVC pushViewController:vc animated:YES];
    }];
    
/**
 使用一个类来统一管理注册的方法，再load方法中进行注册，就不会到处看到注册的代码，方便管理。
 **/
    
    [MGJRouter registerURLPattern:@"LWT://Test2/PushMainVC" toHandler:^(NSDictionary *routerParameters) {
        UINavigationController *navigationVC = routerParameters[MGJRouterParameterUserInfo][@"navigationVC"];
        NSString *labelText = routerParameters[MGJRouterParameterUserInfo][@"text"];
        TestViewController2 *vc = [[TestViewController2 alloc] init];
        vc.labelText = labelText;
        [navigationVC pushViewController:vc animated:YES];
    }];
    
    [MGJRouter registerURLPattern:@"LWT://Test3/PushMainVC" toHandler:^(NSDictionary *routerParameters) {
        UINavigationController *navigationVC = routerParameters[MGJRouterParameterUserInfo][@"navigationVC"];
        void(^block)(NSString *) = routerParameters[MGJRouterParameterUserInfo][@"block"];
        TestViewController3 *vc = [[TestViewController3 alloc] init];
        vc.clicked = block;
        [navigationVC pushViewController:vc animated:YES];
    }];
    
    
    [MGJRouter registerURLPattern:@"LWT://Test2/getMainVC" toObjectHandler:^id(NSDictionary *routerParameters) {
        NSString *labelText = routerParameters[MGJRouterParameterUserInfo][@"text"];
        TestViewController2 *vc = [[TestViewController2 alloc] init];
        vc.labelText = labelText;
        return vc;
    }];
    
}


@end
