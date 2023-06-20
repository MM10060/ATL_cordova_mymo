package com.idmission.mymo.plugin;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.view.View;
import android.view.inputmethod.InputMethodManager;

import com.idmission.mymo.Client.MainActivity;
import com.idmission.mymo.latin.utils.MyMoSettings;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * This class echoes a string called from JavaScript.
 */
public class MyMo_Cordova_Plugin extends CordovaPlugin {

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        String message = args.optString(0);
        switch (action) {
            case "coolMethod" :
                this.coolMethod(message, callbackContext);
                return true;
            case "enableMyMoInSettings" :
                this.enableMyMoInSettings(message, callbackContext);
                return true;
            case "selectKeyboardOptions" :
                this.selectKeyboardOptions(message, callbackContext);
                return true;
            case "hideKeyboard" :
                this.hideKeyboard(message, callbackContext);
                return true;
            case "showKeyboard" :
                this.showKeyboard(message, callbackContext);
                return true;
            case "enableMyMoToAllowSendMoney" :
                this.enableMyMoToAllowSendMoney(message, callbackContext);
                return true;
            case "disableMyMoToRestrictSendMoney" :
                this.disableMyMoToRestrictSendMoney(message, callbackContext);
                return true;
            default :
                return false;
        }
        // return false;
    }

    private void coolMethod(String message, CallbackContext callbackContext) {
        if (message != null && message.length() > 0) {
            callbackContext.success(message);
        } else {
            callbackContext.error("Expected one non-empty string argument.");
        }
    }

    private void enableMyMoInSettings(String message, CallbackContext callbackContext) {
        Intent enableIntent = new Intent(android.provider.Settings.ACTION_INPUT_METHOD_SETTINGS);
        enableIntent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        cordova.getActivity().startActivity(enableIntent);
    }

    private void selectKeyboardOptions(String message, CallbackContext callbackContext) {
        InputMethodManager imm = (InputMethodManager)  cordova.getActivity().getSystemService(Context.INPUT_METHOD_SERVICE);
        imm.showInputMethodPicker();
    }

    private void disableMyMoToRestrictSendMoney(String message, CallbackContext callbackContext) {
        final MyMoSettings myMoSettings = MyMoSettings.getInstance(cordova.getActivity().getApplicationContext());
        myMoSettings.disableMyMo();
        hideKeyboard( message,callbackContext);
        showKeyboard(message,callbackContext);
    }

    private void enableMyMoToAllowSendMoney(String message, CallbackContext callbackContext){
        try{
            JSONObject requestObj = new JSONObject(message);
            String phoneNumber = requestObj.optString("phNo");
            String customerCode = requestObj.optString("custCode");
            String countryCode = requestObj.optString("countryCode");
            String currencyCode = requestObj.optString("currencyCode");
            String integLoginId = requestObj.optString("loginId");
            String integPassword = requestObj.optString("password");
            String integMerchantId = requestObj.optString("merchantId");
            String language = requestObj.optString("locale");
            String postURL = requestObj.optString("postURL");
            String branchCode = requestObj.optString("branchCode");
            String minAmount = requestObj.optString("minAmt");
            String maxAmount = requestObj.optString("maxAmt");
            String accountNumber = requestObj.optString("bnkAcc");
            String txnSecurityOtp = requestObj.optString("txnSecurity");
            String txnSecurityReceiverPh = requestObj.optString("recPhoneSecurity");

            final MyMoSettings myMoSettings = MyMoSettings.getInstance(cordova.getActivity().getApplicationContext());
            myMoSettings.enableMyMo();
            myMoSettings.setPhoneNumber(phoneNumber);
            myMoSettings.setCustomerCode(customerCode);
            myMoSettings.setCountryCode(countryCode);
            myMoSettings.setCurrencyCode(currencyCode);
            myMoSettings.setIntegLoginId(integLoginId);
            myMoSettings.setIntegPassword(integPassword);
            myMoSettings.setIntegMerchantId(integMerchantId);
            myMoSettings.setMinimumAmount(minAmount);
            myMoSettings.setMaximumAmount(maxAmount);
            myMoSettings.setLanguage(language);
            myMoSettings.setPostURL(postURL);
            myMoSettings.setBranchCode(branchCode);
            myMoSettings.setBankAccountNo(accountNumber);
            myMoSettings.setTxnSecurityOTP(txnSecurityOtp);
            myMoSettings.setTxnSecurityReceiverPhoneNo(txnSecurityReceiverPh);
           /* hideKeyboard( message,callbackContext);
            showKeyboard(message,callbackContext);*/
            callbackContext.success(message);
        }catch (Exception e){

        }
    }

    private  void hideKeyboard(String message, CallbackContext callbackContext) {
        try {
            InputMethodManager imm = (InputMethodManager) cordova.getActivity().getSystemService( cordova.getActivity().INPUT_METHOD_SERVICE);
            View view = cordova.getActivity().getCurrentFocus();
            assert view != null;
            imm.hideSoftInputFromWindow(view.getWindowToken(), 0);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    private  void showKeyboard(String message, CallbackContext callbackContext) {
        try {
            View view = cordova.getActivity().getCurrentFocus();
            InputMethodManager methodManager = (InputMethodManager) cordova.getActivity().getSystemService(Context.INPUT_METHOD_SERVICE);
            assert methodManager != null && view != null;
            methodManager.showSoftInput(view, InputMethodManager.SHOW_IMPLICIT);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

}
