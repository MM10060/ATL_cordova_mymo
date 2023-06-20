cordova.define('cordova/plugin_list', function(require, exports, module) {
  module.exports = [
    {
      "id": "com.idmission.mymo.plugin.MyMo_Cordova_Plugin",
      "file": "plugins/com.idmission.mymo.plugin/www/MyMo_Cordova_Plugin.js",
      "pluginId": "com.idmission.mymo.plugin",
      "clobbers": [
        "cordova.plugins.MyMo_Cordova_Plugin"
      ]
    }
  ];
  module.exports.metadata = {
    "cordova-plugin-whitelist": "1.3.4",
    "com.idmission.mymo.plugin": "0.0.1"
  };
});