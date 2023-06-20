//
//  KeyboardViewController.swift
//  MyMo
//
//  Created by MCB-Air-036 on 19/10/20.
//

import UIKit
import KeyboardSDK

class KeyboardViewController: KeyboardParentViewController {

    var userDefaults = UserDefaults(suiteName: "group.bancatlan.sp05")

    override func viewDidLoad() {
        super.viewDidLoad()

        /* Image Configuration Dictionary Value*/
        let ImagePath_For_BankLogo = userDefaults?.string(forKey: "ImagePath_For_BankLogo") ?? ""
        let ImagePath_For_SelectionArrow = userDefaults?.string(forKey: "ImagePath_For_SelectionArrow") ?? ""
        let ImagePath_For_Contact = userDefaults?.string(forKey: "ImagePath_For_Contact") ?? ""
        let ImagePath_For_Processing = userDefaults?.string(forKey: "ImagePath_For_Processing") ?? ""
        let ImagePath_For_TransactionSuccess = userDefaults?.string(forKey: "ImagePath_For_TransactionSuccess") ?? ""
        let ImagePath_For_ErrorAlert = userDefaults?.string(forKey: "ImagePath_For_ErrorAlert") ?? ""

        /* Text Configuration Dictionary Value*/
        let Text_For_SendMoney_Button = userDefaults?.string(forKey: "Text_For_Send_Money") ?? ""
        let Text_For_SendToATM_Button = userDefaults?.string(forKey: "Text_For_Send_To_ATM") ?? ""
        let Text_For_History_Button = userDefaults?.string(forKey: "Text_For_History") ?? ""
        let Text_For_Send_Button = userDefaults?.string(forKey: "Text_For_Send") ?? ""
        let Text_For_Transaction_SuccessMessage = userDefaults?.string(forKey: "Text_For_Transaction_SuccessMessage") ?? ""

        /* Color Configuration Dictionary Value*/
        let HexColor_For_Keyboard_Header = userDefaults?.string(forKey: "HexColor_For_Keyboard_Header") ?? ""
        let HexColor_For_Header_Button = userDefaults?.string(forKey: "HexColor_For_Header_Button") ?? ""
        let HexColor_For_Header_Button_Text = userDefaults?.string(forKey: "HexColor_For_Header_Button_Text") ?? ""
        let HexColor_For_AmountText = userDefaults?.string(forKey: "HexColor_For_AmountText") ?? ""
        let HexColor_For_AmountBackgroundColor = userDefaults?.string(forKey: "HexColor_For_AmountBackgroundColor") ?? ""
        let HexColor_For_Transaction_SuccessMessage = userDefaults?.string(forKey: "HexColor_For_Transaction_SuccessMessage") ?? ""
        let HexColor_For_Transaction_SuccessAmount = userDefaults?.string(forKey: "HexColor_For_Transaction_SuccessAmount") ?? ""
        let HexColor_For_AlerMessage = userDefaults?.string(forKey: "HexColor_For_AlerMessage") ?? ""
        let HexColor_For_HistoryList_Header = userDefaults?.string(forKey: "HexColor_For_HistoryList_Header") ?? ""
        let HexColor_For_ConfirmTransaction_CofirmButton = userDefaults?.string(forKey: "HexColor_For_ConfirmTransaction_CofirmButton") ?? ""
        let HexColor_For_ConfirmTransaction_CancelButton = userDefaults?.string(forKey: "HexColor_For_ConfirmTransaction_CancelButton") ?? ""
        let HexColor_For_CancelTransaction_CancelTransactionButton = userDefaults?.string(forKey: "HexColor_For_CancelTransaction_CancelTransactionButton") ?? ""
        let HexColor_For_CancelTransaction_CloseButton = userDefaults?.string(forKey: "HexColor_For_CancelTransaction_CloseButton") ?? ""
        let HexColor_For_CancelTransactionConfirmation_YESButton = userDefaults?.string(forKey: "HexColor_For_CancelTransactionConfirmation_YESButton") ?? ""
        let HexColor_For_CancelTransactionConfirmation_NOButton = userDefaults?.string(forKey: "HexColor_For_CancelTransactionConfirmation_NOButton") ?? ""
        let HexColor_For_Calendar_SelectDateButton = userDefaults?.string(forKey: "HexColor_For_Calendar_SelectDateButton") ?? ""
        let HexColor_For_Calendar_CancelButton = userDefaults?.string(forKey: "HexColor_For_Calendar_CancelButton") ?? ""
        let HexColor_For_Calendar_Button_Text = userDefaults?.string(forKey: "HexColor_For_Calendar_Button_Text") ?? ""
        let HexColor_For_LoadMore_Button_Text = userDefaults?.string(forKey: "HexColor_For_LoadMore_Button_Text") ?? ""

        /* ErrorCode Messages Configuration Dictionary Value*/
        let Text_For_ErrorCode_016 = userDefaults?.string(forKey: "Text_For_ErrorCode_016") ?? ""
        let Text_For_ErrorCode_224 = userDefaults?.string(forKey: "Text_For_ErrorCode_224") ?? ""
        let Text_For_ErrorCode_236 = userDefaults?.string(forKey: "Text_For_ErrorCode_236") ?? ""
        let Text_For_ErrorCode_358 = userDefaults?.string(forKey: "Text_For_ErrorCode_358") ?? ""
        let Text_For_ErrorCode_370 = userDefaults?.string(forKey: "Text_For_ErrorCode_370") ?? ""
        let Text_For_ErrorCode_428 = userDefaults?.string(forKey: "Text_For_ErrorCode_428") ?? ""
        let Text_For_ErrorCode_501 = userDefaults?.string(forKey: "Text_For_ErrorCode_501") ?? ""
        let Text_For_ErrorCode_604 = userDefaults?.string(forKey: "Text_For_ErrorCode_604") ?? ""
        let Text_For_ErrorCode_888 = userDefaults?.string(forKey: "Text_For_ErrorCode_888") ?? ""
//        let Text_For_ErrorCode_999 = userDefaults?.string(forKey: "Text_For_ErrorCode_999") ?? ""
        let Text_For_ErrorCode_1003 = userDefaults?.string(forKey: "Text_For_ErrorCode_1003") ?? ""
        let Text_For_ErrorCode_2054 = userDefaults?.string(forKey: "Text_For_ErrorCode_2054") ?? ""
        let Text_For_ErrorCode_2071 = userDefaults?.string(forKey: "Text_For_ErrorCode_2071") ?? ""
        let Text_For_ErrorCode_2077 = userDefaults?.string(forKey: "Text_For_ErrorCode_2077") ?? ""
        let Text_For_ErrorCode_2080 = userDefaults?.string(forKey: "Text_For_ErrorCode_2080") ?? ""
        let Text_For_ErrorCode_2082 = userDefaults?.string(forKey: "Text_For_ErrorCode_2082") ?? ""
        let Text_For_ErrorCode_2084 = userDefaults?.string(forKey: "Text_For_ErrorCode_2084") ?? ""
        let Text_For_ErrorCode_2086 = userDefaults?.string(forKey: "Text_For_ErrorCode_2086") ?? ""
        let Text_For_ErrorCode_2087 = userDefaults?.string(forKey: "Text_For_ErrorCode_2087") ?? ""
        let Text_For_ErrorCode_2589 = userDefaults?.string(forKey: "Text_For_ErrorCode_2589") ?? ""
        let Text_For_ErrorCode_3059 = userDefaults?.string(forKey: "Text_For_ErrorCode_3059") ?? ""
        let Text_For_ErrorCode_5000 = userDefaults?.string(forKey: "Text_For_ErrorCode_5000") ?? ""
        let Text_For_ErrorCode_5010 = userDefaults?.string(forKey: "Text_For_ErrorCode_5010") ?? ""
        let Text_For_Validation_001 = userDefaults?.string(forKey: "Text_For_Validation_001") ?? ""
        let Text_For_Validation_002 = userDefaults?.string(forKey: "Text_For_Validation_002") ?? ""
        let Text_For_Validation_003 = userDefaults?.string(forKey: "Text_For_Validation_003") ?? ""
        let Text_For_Validation_004 = userDefaults?.string(forKey: "Text_For_Validation_004") ?? ""
        let Text_For_Validation_005 = userDefaults?.string(forKey: "Text_For_Validation_005") ?? ""
        let Text_For_Validation_006 = userDefaults?.string(forKey: "Text_For_Validation_006") ?? ""
        let Text_For_Validation_007 = userDefaults?.string(forKey: "Text_For_Validation_007") ?? ""
        let Text_For_Validation_008 = userDefaults?.string(forKey: "Text_For_Validation_008") ?? ""
        let Text_For_Validation_009 = userDefaults?.string(forKey: "Text_For_Validation_009") ?? ""
        let Text_For_Validation_010 = userDefaults?.string(forKey: "Text_For_Validation_010") ?? ""
        let Text_For_Validation_011 = userDefaults?.string(forKey: "Text_For_Validation_011") ?? ""
        let Text_For_Validation_012 = userDefaults?.string(forKey: "Text_For_Validation_012") ?? ""

        /* Prpare Dictionary to Pass Configurable Values in Keyboard SDK*/
        let UI_Dictionary = ["ImagePath_OF_BankLogo" : ImagePath_For_BankLogo,
                             "ImagePath_OF_SelectionArrow" : ImagePath_For_SelectionArrow,
                             "ImagePath_OF_Contact" : ImagePath_For_Contact,
                             "ImagePath_OF_Processing" : ImagePath_For_Processing,
                             "ImagePath_OF_TransactionSuccess" : ImagePath_For_TransactionSuccess,
                             "ImagePath_OF_ErrorAlert" : ImagePath_For_ErrorAlert,

                             "Text_OF_SendMoney_Button" : Text_For_SendMoney_Button,
                             "Text_OF_SendToATM_Button" : Text_For_SendToATM_Button,
                             "Text_OF_History_Button" : Text_For_History_Button,
                             "Text_OF_Send_Button" : Text_For_Send_Button,
                             "Text_OF_Transaction_SuccessMessage" : Text_For_Transaction_SuccessMessage,

                             "HexColor_OF_Keyboard_Header": HexColor_For_Keyboard_Header,
                             "HexColor_OF_Header_Button": HexColor_For_Header_Button,
                             "HexColor_OF_Header_Button_Text": HexColor_For_Header_Button_Text,
                             "HexColor_OF_AmountText": HexColor_For_AmountText,
                             "HexColor_OF_AmountBackgroundColor": HexColor_For_AmountBackgroundColor,
                             "HexColor_OF_Transaction_SuccessMessage": HexColor_For_Transaction_SuccessMessage,
                             "HexColor_OF_Transaction_SuccessAmount": HexColor_For_Transaction_SuccessAmount,
                             "HexColor_OF_AlerMessage": HexColor_For_AlerMessage,
                             "HexColor_OF_HistoryList_Header": HexColor_For_HistoryList_Header,
                             "HexColor_OF_ConfirmTransaction_CofirmButton": HexColor_For_ConfirmTransaction_CofirmButton,
                             "HexColor_OF_ConfirmTransaction_CancelButton": HexColor_For_ConfirmTransaction_CancelButton,
                             "HexColor_OF_CancelTransaction_CancelTransactionButton": HexColor_For_CancelTransaction_CancelTransactionButton,
                             "HexColor_OF_CancelTransaction_CloseButton": HexColor_For_CancelTransaction_CloseButton,
                             "HexColor_OF_CancelTransactionConfirmation_YESButton": HexColor_For_CancelTransactionConfirmation_YESButton,
                             "HexColor_OF_CancelTransactionConfirmation_NOButton": HexColor_For_CancelTransactionConfirmation_NOButton,
                             "HexColor_OF_Calendar_SelectDateButton": HexColor_For_Calendar_SelectDateButton,
                             "HexColor_OF_Calendar_CancelButton": HexColor_For_Calendar_CancelButton,
                             "HexColor_OF_Calendar_Button_Text": HexColor_For_Calendar_Button_Text,
                             "HexColor_OF_LoadMore_Button_Text": HexColor_For_LoadMore_Button_Text,

                             "Text_OF_ErrorCode_016":Text_For_ErrorCode_016,
                             "Text_OF_ErrorCode_224":Text_For_ErrorCode_224,
                             "Text_OF_ErrorCode_236":Text_For_ErrorCode_236,
                             "Text_OF_ErrorCode_358":Text_For_ErrorCode_358,
                             "Text_OF_ErrorCode_370":Text_For_ErrorCode_370,
                             "Text_OF_ErrorCode_428":Text_For_ErrorCode_428,
                             "Text_OF_ErrorCode_501":Text_For_ErrorCode_501,
                             "Text_OF_ErrorCode_604":Text_For_ErrorCode_604,
                             "Text_OF_ErrorCode_888":Text_For_ErrorCode_888,
//                             "Text_OF_ErrorCode_999":Text_For_ErrorCode_999,
                             "Text_OF_ErrorCode_1003":Text_For_ErrorCode_1003,
                             "Text_OF_ErrorCode_2054":Text_For_ErrorCode_2054,
                             "Text_OF_ErrorCode_2071":Text_For_ErrorCode_2071,
                             "Text_OF_ErrorCode_2077":Text_For_ErrorCode_2077,
                             "Text_OF_ErrorCode_2080":Text_For_ErrorCode_2080,
                             "Text_OF_ErrorCode_2082":Text_For_ErrorCode_2082,
                             "Text_OF_ErrorCode_2084":Text_For_ErrorCode_2084,
                             "Text_OF_ErrorCode_2086":Text_For_ErrorCode_2086,
                             "Text_OF_ErrorCode_2087":Text_For_ErrorCode_2087,
                             "Text_OF_ErrorCode_2589":Text_For_ErrorCode_2589,
                             "Text_OF_ErrorCode_3059":Text_For_ErrorCode_3059,
                             "Text_OF_ErrorCode_5000":Text_For_ErrorCode_5000,
                             "Text_OF_ErrorCode_5010":Text_For_ErrorCode_5010,
                             "Text_OF_Validation_001":Text_For_Validation_001,
                             "Text_OF_Validation_002":Text_For_Validation_002,
                             "Text_OF_Validation_003":Text_For_Validation_003,
                             "Text_OF_Validation_004":Text_For_Validation_004,
                             "Text_OF_Validation_005":Text_For_Validation_005,
                             "Text_OF_Validation_006":Text_For_Validation_006,
                             "Text_OF_Validation_007":Text_For_Validation_007,
                             "Text_OF_Validation_008":Text_For_Validation_008,
                             "Text_OF_Validation_009":Text_For_Validation_009,
                             "Text_OF_Validation_010":Text_For_Validation_010,
                             "Text_OF_Validation_011":Text_For_Validation_011,
                             "Text_OF_Validation_012":Text_For_Validation_012] as NSMutableDictionary
                
        initKeyboardSDK(enableMyMo: userDefaults?.string(forKey: "isEnable_MyMO") ?? "",
                        showSendMoney: userDefaults?.string(forKey: "isShowSendMoney") ?? "",
                        showSendToATM: userDefaults?.string(forKey: "isShowSendToATM") ?? "",
                        showHistory: userDefaults?.string(forKey: "isShowHistory") ?? "",
                        applicationCode: userDefaults?.string(forKey: "Application_Code") ?? "",
                        senderName: userDefaults?.string(forKey: "Sender_Name") ?? "",
                        loginID: userDefaults?.string(forKey: "Login_Id") ?? "",
                        Password: userDefaults?.string(forKey: "Login_Password") ?? "",
                        MerchantID: userDefaults?.string(forKey: "Merchant_Id") ?? "",
                        PhoneNumber: userDefaults?.string(forKey: "Phone_Number") ?? "",
                        IdNumber: userDefaults?.string(forKey: "ID_Number") ?? "",
                        CustomerCode: userDefaults?.string(forKey: "Customer_Code") ?? "",
                        CountryCode: userDefaults?.string(forKey: "Country_Code") ?? "",
                        CurrencyCode: userDefaults?.string(forKey: "Currency_Code") ?? "",
                        CurrencySymbol: userDefaults?.string(forKey: "Currency_Symbol") ?? "",
                        minimumAmount: userDefaults?.string(forKey: "Minimum_Amount") ?? "",
                        maximumAmount: userDefaults?.string(forKey: "Maximum_Amount") ?? "",
                        apiURL: userDefaults?.string(forKey: "Url") ?? "",
                        bankUserName: userDefaults?.string(forKey: "Bank_User_Name") ?? "",
                        bankBranchCode: userDefaults?.string(forKey: "Bank_Branch_Code") ?? "",
                        bankAccountNumber: userDefaults?.string(forKey: "Bank_Account_No") ?? "",
                        bankAccountType: userDefaults?.string(forKey: "Bank_Account_Type") ?? "",
                        additional_information: userDefaults?.string(forKey: "Additional_Information") ?? "",
                        receiversPhoneRequired: userDefaults?.string(forKey: "PhoneNo_Security_Required") ?? "",
                        receiverPhoneNumberLength: userDefaults?.string(forKey: "Phone_Number_Length") ?? "",
                        OTPSecurityRequired: userDefaults?.string(forKey: "OTP_Security_Required") ?? "",
                        PINSecurityRequired: userDefaults?.string(forKey: "PIN_Security_Required") ?? "",
                        PINValidationAt: userDefaults?.string(forKey: "PIN_Validate_At") ?? "",
                        CustomerSecurityPIN: userDefaults?.string(forKey: "Customer_Security_PIN") ?? "",
                        CustomerSecurityPINLength: userDefaults?.string(forKey: "PIN_Length") ?? "",
                        UIImageConfigurationDictionary: (UI_Dictionary as! [String : Any]))
        
    }
}
