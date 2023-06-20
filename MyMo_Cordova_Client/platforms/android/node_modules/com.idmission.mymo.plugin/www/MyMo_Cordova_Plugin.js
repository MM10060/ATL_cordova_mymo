var exec = require('cordova/exec');

exports.coolMethod = function (arg0, success, error) {
    exec(success, error, 'MyMo_Cordova_Plugin', 'coolMethod', [arg0]);
};

/*exports.testing = function (arg0, success, error) {
    exec(success, error, 'MyMo_Cordova_Plugin', 'testing', [arg0]);
};*/
exports.enableMyMoInSettings = function (arg0, success, error) {
    exec(success, error, 'MyMo_Cordova_Plugin', 'enableMyMoInSettings', [arg0]);
};

exports.selectKeyboardOptions = function (arg0, success, error) {
    exec(success, error, 'MyMo_Cordova_Plugin', 'selectKeyboardOptions', [arg0]);
};

exports.showKeyboard = function (arg0, success, error) {
    exec(success, error, 'MyMo_Cordova_Plugin', 'showKeyboard', [arg0]);
};

exports.hideKeyboard = function (arg0, success, error) {
    exec(success, error, 'MyMo_Cordova_Plugin', 'hideKeyboard', [arg0]);
};

exports.enableMyMoToAllowSendMoney = function (arg0, success, error) {
    exec(success, error, 'MyMo_Cordova_Plugin', 'enableMyMoToAllowSendMoney', [arg0]);
};

exports.disableMyMoToRestrictSendMoney = function (arg0, success, error) {
    exec(success, error, 'MyMo_Cordova_Plugin', 'disableMyMoToRestrictSendMoney', [arg0]);
};
