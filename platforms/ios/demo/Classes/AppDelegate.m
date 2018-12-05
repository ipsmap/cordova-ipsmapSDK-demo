/*
 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.
 */

//
//  AppDelegate.m
//  demo
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import <IpsmapSDK/IpsmapSDK.h>
#import "APIKey.h"
#import "WXApi.h"
#import "IpsLocationShareHandle.h"

@interface AppDelegate ()<WXApiDelegate>
    
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{
    [WXApi registerApp:wxAppID];
    //初始化Ipsmap
    [IpsmapServices setAppKey:(NSString *)APIKey];
    
    //检测位置共享口令是否存在
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ipsReceiveShareInfo:) name:IpsReceiveShareInfoNotification object:nil];
    [[IpsmapServices sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
    
    //登录成功后或者获取到用户信息后调用
    IpsUserInfo *userInfo = [IpsUserInfo new];
    userInfo.name = @"张三";
    userInfo.phoneNumber = @"13888888888";
    [IpsmapServices sharedInstance].userInfo = userInfo;
    
    self.viewController = [[MainViewController alloc] init];
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}
    
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    if ([url.scheme isEqualToString:wxAppID]) {
        return [WXApi handleOpenURL:url delegate:self];
    } else if ([url.scheme isEqualToString:IpsScheme])
    return [[IpsmapServices sharedInstance] application:application openURL:url delegate:[IpsLocationShareHandle sharedInstance]];
    return YES;
}
    
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {
    if ([url.scheme isEqualToString:wxAppID]) {
        return [WXApi handleOpenURL:url delegate:self];
    } else if ([url.scheme isEqualToString:IpsScheme])
    return [[IpsmapServices sharedInstance] application:app openURL:url delegate:[IpsLocationShareHandle sharedInstance]];
    return YES;
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    [[IpsmapServices sharedInstance] applicationWillEnterForeground:application];
}

- (void)ipsReceiveShareInfo:(NSNotification *)noti {
    if (noti.object == nil || ![noti.object isKindOfClass:[UIView class]]) {
        return;
    }
    
    UIView *viewJoin = (UIView *)noti.object;
    //有分享口令
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [viewJoin performSelector:@selector(showInView:) withObject:[UIApplication sharedApplication].keyWindow];
    });
}

@end
