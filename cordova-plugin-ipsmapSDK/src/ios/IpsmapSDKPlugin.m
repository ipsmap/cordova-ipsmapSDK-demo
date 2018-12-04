//
//  IpsmapSDKPlugin.m
//  cordovaDemo
//
//  Created by zhangty on 2018/12/3.
//

#import "IpsmapSDKPlugin.h"

@implementation IpsmapSDKPlugin

- (void)showMap:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = nil;
    //显示地图
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"wer"];
//    if (echo != nil && [echo length] > 0) {
//        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
//    } else {
//        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
//    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
