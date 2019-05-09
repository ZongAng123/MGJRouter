//
//  TestViewController3.h
//  MGJRouter-Demo
//  iOS路由（MGJRouter）
//  Created by 纵昂 on 2019/5/9.
//  Copyright © 2019 GitHub:https://github.com/ZongAng123. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef  void(^btnClickBlock)(NSString *);

@interface TestViewController3 : UIViewController

@property (nonatomic, copy)btnClickBlock clicked;

@end

NS_ASSUME_NONNULL_END
