package cordovaPluginIpsmapSDK;


import com.daoyixun.ipsmap.IpsMapSDK;
import com.orhanobut.logger.Logger;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * This class echoes a string called from JavaScript.
 */
public class cordovaPluginIpsmapSDK extends CordovaPlugin {

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
//        if (action.equals("coolMethod")) {
//            String message = args.getString(0);
//            this.coolMethod(message, callbackContext);
//            return true;
//        }

        if (action.equals("showMap")) {
            showMap("",callbackContext);
            return true;
        }


        if (action.equals("naviTo")) {
            if (args.length() >=2){
                String targetId = args.getString(2);
                Logger.d("targetId "+targetId);
                naviTo(targetId,callbackContext);
                return true;
            }

        }

        if (action.equals("location")) {
            location(callbackContext);
            return true;
        }


        return false;
    }

//    private void coolMethod(String message, CallbackContext callbackContext) {
//        if (message != null && message.length() > 0) {
//            callbackContext.success(message);
//        } else {
//            callbackContext.error("Expected one non-empty string argument.");
//        }
//    }
    private void showMap(String message, CallbackContext callbackContext) {
        final String map_id = "lGaWCUtqoj";
        IpsMapSDK.openIpsMapActivity(this.cordova.getActivity(), map_id);
        callbackContext.success("showMap");
    }


    private void naviTo(String targetId, CallbackContext callbackContext) {
        final String map_id = "lGaWCUtqoj";
        IpsMapSDK.openIpsMapActivity(this.cordova.getActivity(), map_id,targetId);
        callbackContext.success("naviTo:"+targetId);
    }
    private void location( CallbackContext callbackContext) {
        Logger.d("未实现此方法");
    }
}
