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
        Logger.e("cordovaPluginIpsmapSDK.....execute");
//        final String map_id = "lGaWCUtqoj";
//        IpsMapSDK.openIpsMapActivity(this.cordova.getActivity(), map_id);
        if (action.equals("coolMethod")) {
            String message = args.getString(0);
            this.coolMethod(message, callbackContext);
            return true;
        }

        Logger.e(action);

        if (action.equals("showMap")) {
//            String message = args.getString(0);
            this.showMap(action, callbackContext);
            return true;
        }
        return false;
    }

    private void coolMethod(String message, CallbackContext callbackContext) {
        if (message != null && message.length() > 0) {
            callbackContext.success(message);
        } else {
            callbackContext.error("Expected one non-empty string argument.");
        }
    }

    private void showMap(String message, CallbackContext callbackContext) {
        final String map_id = "lGaWCUtqoj";
        IpsMapSDK.openIpsMapActivity(this.cordova.getActivity(), map_id);
//        if (message != null && message.length() > 0) {
//            callbackContext.success(message);
//        } else {
//            callbackContext.error("Expected one non-empty string argument.");
//        }
    }
}
