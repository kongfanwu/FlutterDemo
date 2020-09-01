//
//  ViewController.m
//  my_iOS
//
//  Created by kfw on 2020/9/1.
//  Copyright © 2020 神灯智能. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "SceneDelegate.h"
@import Flutter;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"native 首页";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"push Flutter" forState:UIControlStateNormal];
    [button setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pushClick:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake((self.view.frame.size.width - 60) / 2, 100, 100, 44);
    button.layer.borderColor = UIColor.grayColor.CGColor;
    button.layer.borderWidth = 1;
    [self.view addSubview:button];
    
}

- (void)pushClick:(UIButton *)sender {
    NSArray *array =[[[UIApplication sharedApplication] connectedScenes] allObjects];
    UIWindowScene *windowScene = (UIWindowScene *)array[0];
    SceneDelegate *delegate =(SceneDelegate *)windowScene.delegate;

    FlutterEngine *flutterEngine = ((AppDelegate *)UIApplication.sharedApplication.delegate).flutterEngine;
    FlutterViewController *flutterViewController = [[FlutterViewController alloc] initWithEngine:flutterEngine nibName:nil bundle:nil];
    flutterViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:flutterViewController animated:YES completion:nil];

    
    FlutterMethodChannel* batteryChannel = [FlutterMethodChannel methodChannelWithName:@"samples.flutter.dev/battery" binaryMessenger:flutterViewController.binaryMessenger];
    __weak typeof(self) weakSelf = self;
    [batteryChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
      NSLog(@"请求参数 = %@", call.arguments);
      if ([@"getBatteryLevel" isEqualToString:call.method]) {
        int batteryLevel = [weakSelf getBatteryLevel];

        if (batteryLevel == -1) {
          result([FlutterError errorWithCode:@"UNAVAILABLE"
                                     message:@"Battery info unavailable"
                                     details:nil]);
        } else {
          result(@(batteryLevel));
        }
      } else {
        result(FlutterMethodNotImplemented);
      }
    }];
    
    [batteryChannel invokeMethod:@"getUserId" arguments:@{@"name" : @"kong"} result:^(id  _Nullable result) {
        NSLog(@"返回参数 = %@", result);
    }];
    
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3ull * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
//        [flutterViewController pushRoute:@"second"]; 无效
//
//    });
    
}

- (int)getBatteryLevel {
    return 100;
}

@end
