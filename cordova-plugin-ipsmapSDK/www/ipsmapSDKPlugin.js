var exec = require('cordova/exec');

exports.showMap = function ( success, error) {
    exec(success, error, 'cordova-plugin-ipsmapSDK', 'showMap');
};
               
exports.naviTo = function (mapId, targetName, targetId, success, error) {
    exec(success, error, 'cordova-plugin-ipsmapSDK', 'naviTo', [targetName, targetId] );
};
