package com.ipsmap.cordovaDemo;

import android.app.Application;
import android.graphics.Bitmap;

import com.daoyixun.ipsmap.IpsMapSDK;
import com.daoyixun.ipsmap.ShareToWechatListener;

public class MyApplication extends Application  implements ShareToWechatListener {
    @Override
    public void onCreate() {
        super.onCreate();
        initIPSMAP();
    }

    private void initIPSMAP() {
        IpsMapSDK.init(new IpsMapSDK.Configuration.Builder(getApplicationContext())
                .appKey("1HUC52bXF2")
//                .debug(true)
//                .shareToWechatListener(this)
                .build());

    }

    @Override
    public void shareToWechat(String url, String title, String description, Bitmap bitmap) {
        try {
//            IWXAPI wxApi = WXAPIFactory.createWXAPI(this, "YOUR WECHAT APP_ID");
//            wxApi.registerApp("YOUR WECHAT APP_ID");
//            if (!wxApi.isWXAppInstalled()) {
//                Toast.makeText(this, "未安装微信", Toast.LENGTH_SHORT).show();
//                return;
//            }
//            WXWebpageObject webpage = new WXWebpageObject();
//            webpage.webpageUrl = url;
//            WXMediaMessage msg = new WXMediaMessage(webpage);
//            msg.title = title;
//            msg.description = description;
//            msg.setThumbImage(bitmap);
//            SendMessageToWX.Req req = new SendMessageToWX.Req();
//            req.transaction = buildTransaction("webpage");
//            req.message = msg;
//            req.scene = SendMessageToWX.Req.WXSceneSession;
//            wxApi.sendReq(req);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
