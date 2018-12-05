//
//  IpsmapSDKPlugin.m
//  cordovaDemo
//
//  Created by zhangty on 2018/12/3.
//

#import "IpsmapSDKPlugin.h"
#import <IpsmapSDK/IpsmapSDK.h>
#import "APIKey.h"
#import "IpsLocationShareHandle.h"
#import <Cordova/CDVAppDelegate.h>
#import "ExampleLocationViewController.h"

@implementation IpsmapSDKPlugin

- (void)showMap:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = nil;
    @try {
        //显示地图
        [IpsShareConfig showSharePlatforms:@[@(IpsShareTypeWeChat), @(IpsShareTypeQQ), @(IpsShareTypeSMS)]];
        
        IpsMapViewController *vc = [[IpsMapViewController alloc] initWithMapId:(NSString *)MapId];
        vc.locationShareDelegate = [IpsLocationShareHandle sharedInstance];
        
        //可以使用其他方式弹出界面，如navigationController
        CDVAppDelegate* delegate = [UIApplication sharedApplication].delegate;
        [delegate.window.rootViewController presentViewController:vc animated:true completion:nil];
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"showMap ok"];
    } @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
    
- (void)naviTo:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = nil;
    @try {
        //导航到具体地点
        NSString *targetName = @"";
        NSString *targetId = @"";
        if (command.arguments.count >= 2) {
            targetName = command.arguments[0];
            targetId = command.arguments[1];
        }
        
        IpsMapViewController *vc = [[IpsMapViewController alloc] initWithMapId:(NSString *)MapId targetName:targetName targetId:targetId];
        vc.locationShareDelegate = [IpsLocationShareHandle sharedInstance];
        
        //可以使用其他方式弹出界面，如navigationController
        CDVAppDelegate* delegate = [UIApplication sharedApplication].delegate;
        [delegate.window.rootViewController presentViewController:vc animated:true completion:nil];
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"naviTo ok"];
    } @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)location:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = nil;
    @try {
        //定位示例
        ExampleLocationViewController *vc = [[ExampleLocationViewController alloc] init];
        
        //可以使用其他方式弹出界面，如navigationController
        CDVAppDelegate* delegate = [UIApplication sharedApplication].delegate;
        [delegate.window.rootViewController presentViewController:vc animated:true completion:nil];
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"location ok"];
    } @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
