package com.idmission.mymo.plugin;

// import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Base64;
import android.view.View;
import android.view.inputmethod.InputMethodManager;

//import com.idmission.mymo.Client.MainActivity;
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
        callbackContext.success(message);
    }

    private void enableMyMoToAllowSendMoney(String message, CallbackContext callbackContext){
        try{
            JSONObject requestObj = new JSONObject(message);
            String phoneNumber = requestObj.optString("phNo");
            String senderName = requestObj.optString("senderName");
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
            String banksdropdown = requestObj.optString("banksdropdown");
            String bankUserName = requestObj.optString("bankUserName");

            String txnSecurityOtp = requestObj.optString("txnSecurity");
            String txnSecurityReceiverPh = requestObj.optString("recPhoneSecurity");
            String txnSecurityPin = requestObj.optString("txnSecurityPin");
            String PinValidateAtIDM = requestObj.optString("PinValidateAtIDM");
            String customerSecurityPin = requestObj.optString("customerSecurityPin");
            String customerPinLength = requestObj.optString("customerPinLength");

            String textColor = requestObj.optString("textColor");

            String headerPayTxtClr = requestObj.optString("headerPayTxtClr");
            String headerPayBackClr = requestObj.optString("headerPayBackClr");

            //String textColorSelected = requestObj.optString("textColorSelected");
           // String buttonColor = requestObj.optString("buttonColor");
            String editBoxBackClr = requestObj.optString("editBoxBackClr");
            String histHeaderBackClr = requestObj.optString("histHeaderBackClr");
            String txnSuccessTxtClr = requestObj.optString("txnSuccessTxtClr");
            String alertTxtClr = requestObj.optString("alertTxtClr");
            String txnSuccessAmountTxtClr = requestObj.optString("txnSuccessAmountTxtClr");
            String calandarBtnTxtClr = requestObj.optString("calandarBtnTxtClr");
            String loadMoreBtnTxtClr = requestObj.optString("loadMoreBtnTxtClr");

            String confirmTxnYesBtnClr = requestObj.optString("confirmTxnYesBtnClr");
            String confirmTxnNoBtnClr = requestObj.optString("confirmTxnNoBtnClr");

            String closeBtnClr = requestObj.optString("closeBtnClr");
            String confirmCancelTxnBtnClr = requestObj.optString("confirmCancelTxnBtnClr");

            String confirmCancelYesBtnClr = requestObj.optString("confirmCancelYesBtnClr");
            String confirmCancelNoBtnClr = requestObj.optString("confirmCancelNoBtnClr");

            String sendMoneyLbl = requestObj.optString("sendMoneyLbl");
            String atmLbl = requestObj.optString("atmLbl");
            String historyLbl = requestObj.optString("historyLbl");
            String payLbl = requestObj.optString("payLbl");
            String TransactionSuccessLbl = requestObj.optString("TransactionSuccessLbl");


            String mymoIconImg = requestObj.optString("mymoIconImg");
            String arrowIcon = requestObj.optString("arrowIcon");
            String txnSuccessIcon = requestObj.optString("txnSuccessIcon");
            String alertIcon = requestObj.optString("alertIcon");
            String contactIcon = requestObj.optString("contactIcon");
            String processingIcon = requestObj.optString("processingIcon");

            String phoneLength = requestObj.optString("phoneLength");
            String currencySymbol = requestObj.optString("currencySymbol");

            // configurable error/success msgs:
            String textOfErrorCode016 = requestObj.optString("textOfErrorCode016");
            String textOfErrorCode224 = requestObj.optString("textOfErrorCode224");
            String textOfErrorCode236 = requestObj.optString("textOfErrorCode236");
            String textOfErrorCode358 = requestObj.optString("textOfErrorCode358");
            String textOfErrorCode370 = requestObj.optString("textOfErrorCode370");
            String textOfErrorCode428 = requestObj.optString("textOfErrorCode428");
            String textOfErrorCode501 = requestObj.optString("textOfErrorCode501");
            String textOfErrorCode604 = requestObj.optString("textOfErrorCode604");
            String textOfErrorCode888 = requestObj.optString("textOfErrorCode888");
            String textOfErrorCode999 = requestObj.optString("textOfErrorCode999");
            String textOfErrorCode1003 = requestObj.optString("textOfErrorCode1003");
            String textOfErrorCode2054 = requestObj.optString("textOfErrorCode2054");
            String textOfErrorCode2071 = requestObj.optString("textOfErrorCode2071");
            String textOfErrorCode2077 = requestObj.optString("textOfErrorCode2077");
            String textOfErrorCode2080 = requestObj.optString("textOfErrorCode2080");
            String textOfErrorCode2082 = requestObj.optString("textOfErrorCode2082");
            String textOfErrorCode2084 = requestObj.optString("textOfErrorCode2084");
            String textOfErrorCode2086 = requestObj.optString("textOfErrorCode2086");
            String textOfErrorCode2087 = requestObj.optString("textOfErrorCode2087");
            String textOfErrorCode2589 = requestObj.optString("textOfErrorCode2589");
            String textOfErrorCode5000 = requestObj.optString("textOfErrorCode5000");
            String textOfErrorCode5010 = requestObj.optString("textOfErrorCode5010");
            String textOfErrorCode3059 = requestObj.optString("textOfErrorCode3059");
            String textOfValidation001 = requestObj.optString("textOfValidation001");
            String textOfValidation002 = requestObj.optString("textOfValidation002");
            String textOfValidation003 = requestObj.optString("textOfValidation003");
            String textOfValidation004 = requestObj.optString("textOfValidation004");
            String textOfValidation005 = requestObj.optString("textOfValidation005");
            String textOfValidation006 = requestObj.optString("textOfValidation006");
            String textOfValidation007 = requestObj.optString("textOfValidation007");
            String textOfValidation008 = requestObj.optString("textOfValidation008");
            String textOfValidation009 = requestObj.optString("textOfValidation009");
            String textOfValidation011 = requestObj.optString("textOfValidation011");
            String textOfValidation012 = requestObj.optString("textOfValidation012");


            final MyMoSettings myMoSettings = MyMoSettings.getInstance(cordova.getActivity().getApplicationContext());
            myMoSettings.enableMyMo();
            myMoSettings.setPhoneNumber(phoneNumber);
            if(!"".equals(senderName)){
                myMoSettings.setSenderName(senderName);
            }
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

            myMoSettings.setBankSenderName(bankUserName);
            myMoSettings.setBranchCode(branchCode);
            myMoSettings.setBankAccountNo(accountNumber);
            myMoSettings.setBankAccountType(banksdropdown);

            myMoSettings.setTxnSecurityOTP(txnSecurityOtp);
            myMoSettings.setTxnSecurityReceiverPhoneNo(txnSecurityReceiverPh);
            myMoSettings.setTxnSecurityPIN(txnSecurityPin);
            myMoSettings.setPinValidateAtIDM(PinValidateAtIDM);
            myMoSettings.setCustomerSecurityPIN(customerSecurityPin.trim());
            myMoSettings.setPinLength(customerPinLength.trim());
            myMoSettings.setPhoneNumberLength(phoneLength.trim());
            myMoSettings.setCurrencySymbol(currencySymbol.trim());

            // UI ICONS changes
            Bitmap mymoIconbitmap = convertBase64StringToBitMap(mymoIconImg);
            myMoSettings.setMyMoBitmapDrawable(mymoIconbitmap);

            Bitmap arrowIconBitMap = convertBase64StringToBitMap(arrowIcon);
            myMoSettings.setDownArrowBitmapDrawable(arrowIconBitMap);

            Bitmap txnSuccessIconBitMap = convertBase64StringToBitMap(txnSuccessIcon);
            myMoSettings.setTxnSuccessIconBitmapDrawable(txnSuccessIconBitMap);

            Bitmap alertIconBitMap = convertBase64StringToBitMap(alertIcon);
            myMoSettings.setAlertIconBitmapDrawable(alertIconBitMap);

            Bitmap contactIconBitMap = convertBase64StringToBitMap(contactIcon);
            myMoSettings.setContactIconBitmapDrawable(contactIconBitMap);

            Bitmap processingIconBitMap = convertBase64StringToBitMap(processingIcon);
            myMoSettings.setProcessingIconBitmapDrawable(processingIconBitMap);

            // UI Color changes
             myMoSettings.setTextColor(textColor.trim());
             myMoSettings.setEditboxBackgroundColor(editBoxBackClr.trim());
             myMoSettings.setHistoryListHeaderColor(histHeaderBackClr);
             myMoSettings.setSuccessMsgTextColor(txnSuccessTxtClr);
             myMoSettings.setAlertMsgTextColor(alertTxtClr);
             myMoSettings.setSendMoneyAmtTextColor(txnSuccessAmountTxtClr);
            myMoSettings.setCalenderAndDateColor(calandarBtnTxtClr);
            myMoSettings.setLoadMoreTextColor(loadMoreBtnTxtClr);

            myMoSettings.setConfirmTxnYesButtonColor(confirmTxnYesBtnClr);
            myMoSettings.setConfirmTxnNoButtonColor(confirmTxnNoBtnClr);

            myMoSettings.setCancelTxnCloseButtonColor(closeBtnClr);
            myMoSettings.setCancelTxnConfirmButtonColor(confirmCancelTxnBtnClr);

            myMoSettings.setConfirmCancelTxnYesButtonColor(confirmCancelYesBtnClr);
            myMoSettings.setConfirmCancelTxnNoButtonColor(confirmCancelNoBtnClr);

            //header and pay button text color
            myMoSettings.setHeaderBtnTextColor(headerPayTxtClr.trim());

            //header and pay button background color
            myMoSettings.setHeaderButtonBackgroundColor(headerPayBackClr.trim());

            // UI Strings/Label changes
             myMoSettings.setSendMoneyLabel(sendMoneyLbl.trim());
             myMoSettings.setSendToAtmLabel(atmLbl.trim());
             myMoSettings.setHistoryLabel(historyLbl.trim());
             myMoSettings.setPayLabel(payLbl.trim());
             myMoSettings.setSuccessMsgTextLabel(TransactionSuccessLbl);

            // configurable error/success msgs:
            myMoSettings.setTextOFErrorCode016(textOfErrorCode016.trim());
            myMoSettings.setTextOFErrorCode224(textOfErrorCode224.trim());
            myMoSettings.setTextOFErrorCode236(textOfErrorCode236.trim());
            myMoSettings.setTextOFErrorCode358(textOfErrorCode358.trim());
            myMoSettings.setTextOFErrorCode370(textOfErrorCode370.trim());
            myMoSettings.setTextOFErrorCode428(textOfErrorCode428.trim());
            myMoSettings.setTextOFErrorCode501(textOfErrorCode501.trim());
            myMoSettings.setTextOFErrorCode604(textOfErrorCode604.trim());
            myMoSettings.setTextOFErrorCode888(textOfErrorCode888.trim());
            myMoSettings.setTextOFErrorCode999(textOfErrorCode999.trim());
            myMoSettings.setTextOFErrorCode1003(textOfErrorCode1003.trim());
            myMoSettings.setTextOFErrorCode2054(textOfErrorCode2054.trim());
            myMoSettings.setTextOFErrorCode2071(textOfErrorCode2071.trim());
            myMoSettings.setTextOFErrorCode2077(textOfErrorCode2077.trim());
            myMoSettings.setTextOFErrorCode2080(textOfErrorCode2080.trim());
            myMoSettings.setTextOFErrorCode2082(textOfErrorCode2082.trim());
            myMoSettings.setTextOFErrorCode2084(textOfErrorCode2084.trim());
            myMoSettings.setTextOFErrorCode2086(textOfErrorCode2086.trim());
            myMoSettings.setTextOFErrorCode2087(textOfErrorCode2087.trim());
            myMoSettings.setTextOFErrorCode2589(textOfErrorCode2589.trim());
            myMoSettings.setTextOFErrorCode5000(textOfErrorCode5000.trim());
            myMoSettings.setTextOFErrorCode5010(textOfErrorCode5010.trim());
            myMoSettings.setTextOFErrorCode3059(textOfErrorCode3059.trim());

            myMoSettings.setTextOfValidation001(textOfValidation001.trim());
            myMoSettings.setTextOfValidation002(textOfValidation002.trim());
            myMoSettings.setTextOfValidation003(textOfValidation003.trim());
            myMoSettings.setTextOfValidation004(textOfValidation004.trim());
            myMoSettings.setTextOfValidation005(textOfValidation005.trim());
            myMoSettings.setTextOfValidation006(textOfValidation006.trim());
            myMoSettings.setTextOfValidation007(textOfValidation007.trim());
            myMoSettings.setTextOfValidation008(textOfValidation008.trim());
            myMoSettings.setTextOfValidation009(textOfValidation009.trim());
            myMoSettings.setTextOfValidation011(textOfValidation011.trim());
            myMoSettings.setTextOfValidation012(textOfValidation012.trim());


            myMoSettings.setShowSendMoneyEnabled("Y");
            myMoSettings.setShowSendToATMEnabled("Y");
            myMoSettings.setShowHistoryEnabled("Y");

           /* hideKeyboard( message,callbackContext);
            showKeyboard(message,callbackContext);*/
            callbackContext.success(message);
        }catch (Exception e){

        }
    }


    private Bitmap convertBase64StringToBitMap(String base64String){

        String encodedImage = base64String;
        final String pureBase64Encoded = encodedImage.substring(encodedImage.indexOf(",")  + 1);
        if(null!=pureBase64Encoded) {
            byte[] decodedString = Base64.decode(pureBase64Encoded, Base64.DEFAULT);
            Bitmap decodedByte = BitmapFactory.decodeByteArray(decodedString, 0, decodedString.length);
            return decodedByte;
        }
        return null;
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
