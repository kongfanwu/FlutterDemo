//
//  AppDelegate.m
//  my_iOS
//
//  Created by kfw on 2020/9/1.
//  Copyright © 2020 神灯智能. All rights reserved.
//

#import "AppDelegate.h"
// Used to connect plugins (only if you have plugins with iOS platform code).
#import <FlutterPluginRegistrant/GeneratedPluginRegistrant.h>
#import "GeneratedPluginRegistrant.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey, id> *)launchOptions {
    self.flutterEngine = [[FlutterEngine alloc] initWithName:@"my flutter engine"];
    // Runs the default Dart entrypoint with a default Flutter route.
    
    
    //    [self.flutterEngine.navigationChannel invokeMethod:@"setInitialRoute" arguments:@"/second"]; 无效
    
    //  //执行默认的main.dart文件中的main方法进行启动
    [self.flutterEngine run];
    // //指定main.dart中方法名为entry的方法启动
    //    [self.flutterEngine runWithEntrypoint:@"myOtherEntrypoint"];
    
    
    // Used to connect plugins (only if you have plugins with iOS platform code).
    [GeneratedPluginRegistrant registerWithRegistry:self.flutterEngine];
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

//+(FlutterEngine *)initFlutter:(NSString*)entry :(NSString*)dartFile{
//    FlutterEngine *flutterEngine =
//    ((AppDelegate *)UIApplication.sharedApplication.delegate).flutterEngine;
//    if (flutterEngine) {
//        return flutterEngine;
//    }else{
//        flutterEngine = [[FlutterEngine alloc] initWithName:@"my flutter engine"];
//        if(dartFile&&entry){
//            //指定dartFile文件中entry方法启动flutter
//            [flutterEngine runWithEntrypoint:entry libraryURI:dartFile];
//        }else if (entry){
//            //指定main.dart中方法名为entry的方法启动
//            [flutterEngine runWithEntrypoint:entry];
//        }else{
//            //执行默认的main.dart文件中的main方法进行启动
//            [flutterEngine run];
//        }
//        return flutterEngine;
//    }
//}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
