# cordova 引入 ipsmapSDK 简介

cordova-ipsmapSDK-demo 是一套面向 cordova 开发者使用ipsmapSDK的demo工程，里面包含一个自定义插件cordova-plugin-ipsmapSDK（目前插件暂未上传cordova），
开发者可自行引用该插件轻松实现地图展示、导航至具体poi等功能

## 获取AppKey
请填写
**[申请表](https://github.com/ipsmap/IpsmapSDK-iOS/blob/master/Readme.asset/道一循公司医院客户应用申请表.xlsx)** 
给dev@ipsmap.com邮件联系获取appKey、mapId、scheme（分享用）


## 插件引用
拷贝插件文件夹cordova-plugin-ipsmapSDK至项目目录 (相对路径)
```
cordova plugin add ./cordova-plugin-ipsmapSDK
```
如果已经添加cordova-plugin-ipsmapSDK,请先移除,在进行添加
```
cordova plugin remove cordova-plugin-ipsmapSDK
cordova plugin add ./cordova-plugin-ipsmapSDK
```



## 进入 IOS 和 Android 平台查看相关的 README 进行设置

 #### **[iOS README](https://github.com/ipsmap/cordova-ipsmapSDK-demo/blob/master/platforms/ios/README.md)**
 #### **[Android README](https://github.com/ipsmap/cordova-ipsmapSDK-demo/blob/master/platforms/android/README.md)** 


### 参考文档如下

 #### http://www.cnblogs.com/cnshen/p/4128120.html
 #### https://cloud.tencent.com/developer/article/1190017
 #### https://www.w3cschool.cn/cordova/
 #### https://blog.csdn.net/u012805816/article/details/78551623
