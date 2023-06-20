/********* MyMo_Cordova_Plugin.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import "MainViewController.h"

@interface MyMo_Cordova_Plugin : CDVPlugin {
  // Member variables go here.
}

- (void)coolMethod:(CDVInvokedUrlCommand*)command;
- (void)enableMyMoInSettings:(CDVInvokedUrlCommand*)command;
- (void)selectKeyboardOptions:(CDVInvokedUrlCommand*)command;
- (void)showKeyboard:(CDVInvokedUrlCommand*)command;
- (void)hideKeyboard:(CDVInvokedUrlCommand*)command;
- (void)enableMyMoToAllowSendMoney:(CDVInvokedUrlCommand*)command;
- (void)disableMyMoToRestrictSendMoney:(CDVInvokedUrlCommand*)command;
@end

@implementation MyMo_Cordova_Plugin

- (void)coolMethod:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];

    if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)enableMyMoInSettings:(CDVInvokedUrlCommand*)command
{
    NSLog(@"MyMo_Cordova_Plugin.m enableMyMoInSettings");
    NSURL *keboardURL = [NSURL URLWithString: @"App-Prefs:root=General&path=Keyboard/KEYBOARDS"];
    [[UIApplication sharedApplication] openURL:keboardURL];
}

- (void)selectKeyboardOptions:(CDVInvokedUrlCommand*)command
{
    NSLog(@"MyMo_Cordova_Plugin.m selectKeyboardOptions");
}

- (void)showKeyboard:(CDVInvokedUrlCommand*)command
{
    NSLog(@"MyMo_Cordova_Plugin.m showKeyboard");
}

- (void)hideKeyboard:(CDVInvokedUrlCommand*)command
{
    NSLog(@"MyMo_Cordova_Plugin.m hideKeyboard");
}

- (void)enableMyMoToAllowSendMoney:(CDVInvokedUrlCommand*)command
{
    NSLog(@"MyMo_Cordova_Plugin.m enableMyMoToAllowSendMoney");
    NSDictionary* commandJsonString = [command.arguments objectAtIndex:0];

    //MARK:- Get Values From UI
    NSString *branchCode = [commandJsonString objectForKey:@"branchCode"];
    NSString *bnkAcc = [commandJsonString objectForKey:@"bnkAcc"];
    NSString *bnkType = [commandJsonString objectForKey:@"banksdropdown"];
    NSString *countryCode = [commandJsonString objectForKey:@"countryCode"];
    NSString *currencyCode = [commandJsonString objectForKey:@"currencyCode"];
    NSString *currencySymbol = [commandJsonString objectForKey:@"currencySymbol"];
    NSString *custCode = [commandJsonString objectForKey:@"custCode"];
    NSString *locale = [commandJsonString objectForKey:@"locale"];
    NSString *loginId = [commandJsonString objectForKey:@"loginId"];
    NSString *maxAmt = [commandJsonString objectForKey:@"maxAmt"];
    NSString *merchantId = [commandJsonString objectForKey:@"merchantId"];
    NSString *minAmt = [commandJsonString objectForKey:@"minAmt"];
    NSString *password = [commandJsonString objectForKey:@"password"];
    NSString *phNo = [commandJsonString objectForKey:@"phNo"];
    NSString *postURL = [commandJsonString objectForKey:@"postURL"];
    NSString *recPhoneSecurity = [commandJsonString objectForKey:@"recPhoneSecurity"];
    NSString *recPhoneLength = [commandJsonString objectForKey:@"phoneLength"];
    NSString *txnSecurity = [commandJsonString objectForKey:@"txnSecurity"];
    NSString *txnSecurityPin = [commandJsonString objectForKey:@"txnSecurityPin"];
    NSString *PinValidateAtIDM = [commandJsonString objectForKey:@"PinValidateAtIDM"];
    NSString *customerSecurityPin = [commandJsonString objectForKey:@"customerSecurityPin"];
    NSString *customerPinLength = [commandJsonString objectForKey:@"customerPinLength"];
    NSString *senderName = [commandJsonString objectForKey:@"senderName"];

    //MARK: Get Image
    NSString *mymoIconImgPath = [self getImagepath_From:commandJsonString with_ImageName:@"mymoIconImg"];
    NSString *arrowIconPath = [self getImagepath_From:commandJsonString with_ImageName:@"arrowIcon"];
    NSString *contactIconPath = [self getImagepath_From:commandJsonString with_ImageName:@"contactIcon"];
    NSString *processingIconPath = [self getImagepath_From:commandJsonString with_ImageName:@"processingIcon"];
    NSString *successIconPath = [self getImagepath_From:commandJsonString with_ImageName:@"txnSuccessIcon"];
    NSString *errorIconPath = [self getImagepath_From:commandJsonString with_ImageName:@"alertIcon"];

    //MARK: Get Configurable Text
    NSString *sendMoney_Text = [commandJsonString objectForKey:@"sendMoneyLbl"];
    NSString *sendToATM_Text = [commandJsonString objectForKey:@"atmLbl"];
    NSString *History_Text = [commandJsonString objectForKey:@"historyLbl"];
    NSString *Send_Text = [commandJsonString objectForKey:@"payLbl"];
    NSString *TransactionSuccess_Text = [commandJsonString objectForKey:@"TransactionSuccessLbl"];

    //MARK: Get Configurable Color
    NSString *hexColor_HeaderBackground = [commandJsonString objectForKey:@"headerBackgroundColor"];
    NSString *hexColor_HeaderButton = [commandJsonString objectForKey:@"headerPayBackClr"];
    NSString *hexColor_HeaderButton_Text = [commandJsonString objectForKey:@"headerPayTxtClr"];
    NSString *hexColor_AmountText = [commandJsonString objectForKey:@"textColor"];
    NSString *hexColor_AmountBackground = [commandJsonString objectForKey:@"editBoxBackClr"];
    NSString *HexColor_SuccessMessage = [commandJsonString objectForKey:@"txnSuccessTxtClr"];
    NSString *HexColor_SuccessAmount = [commandJsonString objectForKey:@"txnSuccessAmountTxtClr"];
    NSString *HexColor_AlerMessage = [commandJsonString objectForKey:@"alertTxtClr"];
    NSString *HexColor_HistoryList_Header = [commandJsonString objectForKey:@"histHeaderBackClr"];
    NSString *HexColor_ConfirmTransaction_CofirmButton = [commandJsonString objectForKey:@"confirmTxnYesBtnClr"];
    NSString *HexColor_ConfirmTransaction_CancelButton = [commandJsonString objectForKey:@"confirmTxnNoBtnClr"];
    NSString *HexColor_CancelTransaction_CancelTransactionButton = [commandJsonString objectForKey:@"confirmCancelTxnBtnClr"];
    NSString *HexColor_CancelTransaction_CloseButton = [commandJsonString objectForKey:@"closeBtnClr"];
    NSString *HexColor_CancelTransactionConfirmation_YESButton = [commandJsonString objectForKey:@"confirmCancelYesBtnClr"];
    NSString *HexColor_CancelTransactionConfirmation_NOButton = [commandJsonString objectForKey:@"confirmCancelNoBtnClr"];
    NSString *HexColor_Calendar_SelectDateButton = [commandJsonString objectForKey:@"confirmCancelYesBtnClr"];
    NSString *HexColor_Calendar_CancelButton = [commandJsonString objectForKey:@"confirmCancelNoBtnClr"];
    NSString *hexColor_CalendarButton_Text = [commandJsonString objectForKey:@"calandarBtnTxtClr"];
    NSString *hexColor_LoadMoreButton_Text = [commandJsonString objectForKey:@"loadMoreBtnTxtClr"];

    NSString *textOfErrorCode016 = [commandJsonString objectForKey:@"textOfErrorCode016"];
    NSString *textOfErrorCode224 = [commandJsonString objectForKey:@"textOfErrorCode224"];
    NSString *textOfErrorCode236 = [commandJsonString objectForKey:@"textOfErrorCode236"];
    NSString *textOfErrorCode358 = [commandJsonString objectForKey:@"textOfErrorCode358"];
    NSString *textOfErrorCode370 = [commandJsonString objectForKey:@"textOfErrorCode370"];
    NSString *textOfErrorCode428 = [commandJsonString objectForKey:@"textOfErrorCode428"];
    NSString *textOfErrorCode501 = [commandJsonString objectForKey:@"textOfErrorCode501"];
    NSString *textOfErrorCode604 = [commandJsonString objectForKey:@"textOfErrorCode604"];
    NSString *textOfErrorCode888 = [commandJsonString objectForKey:@"textOfErrorCode888"];
    NSString *textOfErrorCode999 = [commandJsonString objectForKey:@"textOfErrorCode999"];
    NSString *textOfErrorCode1003 = [commandJsonString objectForKey:@"textOfErrorCode1003"];
    NSString *textOfErrorCode2054 = [commandJsonString objectForKey:@"textOfErrorCode2054"];
    NSString *textOfErrorCode2071 = [commandJsonString objectForKey:@"textOfErrorCode2071"];
    NSString *textOfErrorCode2077 = [commandJsonString objectForKey:@"textOfErrorCode2077"];
    NSString *textOfErrorCode2080 = [commandJsonString objectForKey:@"textOfErrorCode2080"];
    NSString *textOfErrorCode2082 = [commandJsonString objectForKey:@"textOfErrorCode2082"];
    NSString *textOfErrorCode2084 = [commandJsonString objectForKey:@"textOfErrorCode2084"];
    NSString *textOfErrorCode2086 = [commandJsonString objectForKey:@"textOfErrorCode2086"];
    NSString *textOfErrorCode2087 = [commandJsonString objectForKey:@"textOfErrorCode2087"];
    NSString *textOfErrorCode2589 = [commandJsonString objectForKey:@"textOfErrorCode2589"];
    NSString *textOfErrorCode3059 = [commandJsonString objectForKey:@"textOfErrorCode3059"];
    NSString *textOfErrorCode5000 = [commandJsonString objectForKey:@"textOfErrorCode5000"];
    NSString *textOfErrorCode5010 = [commandJsonString objectForKey:@"textOfErrorCode5010"];
    NSString *textOfValidation001 = [commandJsonString objectForKey:@"textOfValidation001"];
    NSString *textOfValidation002 = [commandJsonString objectForKey:@"textOfValidation002"];
    NSString *textOfValidation003 = [commandJsonString objectForKey:@"textOfValidation003"];
    NSString *textOfValidation004 = [commandJsonString objectForKey:@"textOfValidation004"];
    NSString *textOfValidation005 = [commandJsonString objectForKey:@"textOfValidation005"];
    NSString *textOfValidation006 = [commandJsonString objectForKey:@"textOfValidation006"];
    NSString *textOfValidation007 = [commandJsonString objectForKey:@"textOfValidation007"];
    NSString *textOfValidation008 = [commandJsonString objectForKey:@"textOfValidation008"];
    NSString *textOfValidation009 = [commandJsonString objectForKey:@"textOfValidation009"];
    NSString *textOfValidation010 = [commandJsonString objectForKey:@"textOfValidation010"];
    NSString *textOfValidation011 = [commandJsonString objectForKey:@"textOfValidation011"];
    NSString *textOfValidation012 = [commandJsonString objectForKey:@"textOfValidation012"];

    //MARK:- Set Values In UserDefault/SharedPreferences
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.bancatlan.sp05"];
    [userDefaults setObject:@"Y" forKey:@"Enable_MyMO"];
    [userDefaults setObject:@"CUX" forKey:@"Application_Code"];
    [userDefaults setObject:senderName forKey:@"Sender_Name"];
    [userDefaults setObject:loginId forKey:@"Login_Id"];
    [userDefaults setObject:password forKey:@"Login_Password"];
    [userDefaults setObject:merchantId forKey:@"Merchant_Id"];
    [userDefaults setObject:phNo forKey:@"Phone_Number"];
    [userDefaults setObject:custCode forKey:@"Customer_Code"];
    [userDefaults setObject:countryCode forKey:@"Country_Code"];
    [userDefaults setObject:currencyCode forKey:@"Currency_Code"];
    [userDefaults setObject:currencySymbol forKey:@"Currency_Symbol"];
    [userDefaults setObject:minAmt forKey:@"Minimum_Amount"];
    [userDefaults setObject:maxAmt forKey:@"Maximum_Amount"];
    [userDefaults setObject:locale forKey:@"Language_Code"];
    [userDefaults setObject:postURL forKey:@"Url"];
    [userDefaults setObject:branchCode forKey:@"Bank_Branch_Code"];
    [userDefaults setObject:bnkAcc forKey:@"Bank_Account_No"];
    [userDefaults setObject:bnkType forKey:@"Bank_Account_Type"];
    [userDefaults setObject:recPhoneSecurity forKey:@"PhoneNo_Security_Required"];
    [userDefaults setObject:recPhoneLength forKey:@"Phone_Number_Length"];
    [userDefaults setObject:txnSecurity forKey:@"OTP_Security_Required"];
    [userDefaults setObject:txnSecurityPin forKey:@"PIN_Security_Required"];
    [userDefaults setObject:PinValidateAtIDM forKey:@"PIN_Validate_At"];
    [userDefaults setObject:customerSecurityPin forKey:@"Customer_Security_PIN"];
    [userDefaults setObject:customerPinLength forKey:@"PIN_Length"];

    [userDefaults setObject:mymoIconImgPath forKey:@"ImagePath_For_BankLogo"];
    [userDefaults setObject:arrowIconPath forKey:@"ImagePath_For_SelectionArrow"];
    [userDefaults setObject:contactIconPath forKey:@"ImagePath_For_Contact"];
    [userDefaults setObject:processingIconPath forKey:@"ImagePath_For_Processing"];
    [userDefaults setObject:successIconPath forKey:@"ImagePath_For_TransactionSuccess"];
    [userDefaults setObject:errorIconPath forKey:@"ImagePath_For_ErrorAlert"];

    [userDefaults setObject:sendMoney_Text forKey:@"Text_For_Send_Money"];
    [userDefaults setObject:sendToATM_Text forKey:@"Text_For_Send_To_ATM"];
    [userDefaults setObject:History_Text forKey:@"Text_For_History"];
    [userDefaults setObject:Send_Text forKey:@"Text_For_Send"];
    [userDefaults setObject:TransactionSuccess_Text forKey:@"Text_For_Transaction_SuccessMessage"];

    [userDefaults setObject:hexColor_HeaderBackground forKey:@"HexColor_For_Header_Background"];
    [userDefaults setObject:hexColor_HeaderButton forKey:@"HexColor_For_Header_Button"];
    [userDefaults setObject:hexColor_HeaderButton_Text forKey:@"HexColor_For_Header_Button_Text"];
    [userDefaults setObject:hexColor_AmountText forKey:@"HexColor_For_AmountText"];
    [userDefaults setObject:hexColor_AmountBackground forKey:@"HexColor_For_AmountBackgroundColor"];
    [userDefaults setObject:HexColor_SuccessMessage forKey:@"HexColor_For_Transaction_SuccessMessage"];
    [userDefaults setObject:HexColor_SuccessAmount forKey:@"HexColor_For_Transaction_SuccessAmount"];
    [userDefaults setObject:HexColor_AlerMessage forKey:@"HexColor_For_AlerMessage"];
    [userDefaults setObject:HexColor_HistoryList_Header forKey:@"HexColor_For_HistoryList_Header"];
    [userDefaults setObject:HexColor_ConfirmTransaction_CofirmButton forKey:@"HexColor_For_ConfirmTransaction_CofirmButton"];
    [userDefaults setObject:HexColor_ConfirmTransaction_CancelButton forKey:@"HexColor_For_ConfirmTransaction_CancelButton"];
    [userDefaults setObject:HexColor_CancelTransaction_CancelTransactionButton forKey:@"HexColor_For_CancelTransaction_CancelTransactionButton"];
    [userDefaults setObject:HexColor_CancelTransaction_CloseButton forKey:@"HexColor_For_CancelTransaction_CloseButton"];
    [userDefaults setObject:HexColor_CancelTransactionConfirmation_YESButton forKey:@"HexColor_For_CancelTransactionConfirmation_YESButton"];
    [userDefaults setObject:HexColor_CancelTransactionConfirmation_NOButton forKey:@"HexColor_For_CancelTransactionConfirmation_NOButton"];
    [userDefaults setObject:HexColor_Calendar_SelectDateButton forKey:@"HexColor_For_Calendar_SelectDateButton"];
    [userDefaults setObject:HexColor_Calendar_CancelButton forKey:@"HexColor_For_Calendar_CancelButton"];
    [userDefaults setObject:hexColor_CalendarButton_Text forKey:@"HexColor_For_Calendar_Button_Text"];
    [userDefaults setObject:hexColor_LoadMoreButton_Text forKey:@"HexColor_For_LoadMore_Button_Text"];

    [userDefaults setObject:textOfErrorCode016 forKey:@"Text_For_ErrorCode_016"];
    [userDefaults setObject:textOfErrorCode224 forKey:@"Text_For_ErrorCode_224"];
    [userDefaults setObject:textOfErrorCode236 forKey:@"Text_For_ErrorCode_236"];
    [userDefaults setObject:textOfErrorCode358 forKey:@"Text_For_ErrorCode_358"];
    [userDefaults setObject:textOfErrorCode370 forKey:@"Text_For_ErrorCode_370"];
    [userDefaults setObject:textOfErrorCode428 forKey:@"Text_For_ErrorCode_428"];
    [userDefaults setObject:textOfErrorCode501 forKey:@"Text_For_ErrorCode_501"];
    [userDefaults setObject:textOfErrorCode604 forKey:@"Text_For_ErrorCode_604"];
    [userDefaults setObject:textOfErrorCode888 forKey:@"Text_For_ErrorCode_888"];
    [userDefaults setObject:textOfErrorCode999 forKey:@"Text_For_ErrorCode_999"];
    [userDefaults setObject:textOfErrorCode1003 forKey:@"Text_For_ErrorCode_1003"];
    [userDefaults setObject:textOfErrorCode2054 forKey:@"Text_For_ErrorCode_2054"];
    [userDefaults setObject:textOfErrorCode2071 forKey:@"Text_For_ErrorCode_2071"];
    [userDefaults setObject:textOfErrorCode2077 forKey:@"Text_For_ErrorCode_2077"];
    [userDefaults setObject:textOfErrorCode2080 forKey:@"Text_For_ErrorCode_2080"];
    [userDefaults setObject:textOfErrorCode2082 forKey:@"Text_For_ErrorCode_2082"];
    [userDefaults setObject:textOfErrorCode2084 forKey:@"Text_For_ErrorCode_2084"];
    [userDefaults setObject:textOfErrorCode2086 forKey:@"Text_For_ErrorCode_2086"];
    [userDefaults setObject:textOfErrorCode2087 forKey:@"Text_For_ErrorCode_2087"];
    [userDefaults setObject:textOfErrorCode2589 forKey:@"Text_For_ErrorCode_2589"];
    [userDefaults setObject:textOfErrorCode3059 forKey:@"Text_For_ErrorCode_3059"];
    [userDefaults setObject:textOfErrorCode5000 forKey:@"Text_For_ErrorCode_5000"];
    [userDefaults setObject:textOfErrorCode5010 forKey:@"Text_For_ErrorCode_5010"];
    [userDefaults setObject:textOfValidation001 forKey:@"Text_For_Validation_001"];
    [userDefaults setObject:textOfValidation002 forKey:@"Text_For_Validation_002"];
    [userDefaults setObject:textOfValidation003 forKey:@"Text_For_Validation_003"];
    [userDefaults setObject:textOfValidation004 forKey:@"Text_For_Validation_004"];
    [userDefaults setObject:textOfValidation005 forKey:@"Text_For_Validation_005"];
    [userDefaults setObject:textOfValidation006 forKey:@"Text_For_Validation_006"];
    [userDefaults setObject:textOfValidation007 forKey:@"Text_For_Validation_007"];
    [userDefaults setObject:textOfValidation008 forKey:@"Text_For_Validation_008"];
    [userDefaults setObject:textOfValidation009 forKey:@"Text_For_Validation_009"];
    [userDefaults setObject:textOfValidation010 forKey:@"Text_For_Validation_010"];
    [userDefaults setObject:textOfValidation011 forKey:@"Text_For_Validation_011"];
    [userDefaults setObject:textOfValidation012 forKey:@"Text_For_Validation_012"];

    CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[NSString stringWithFormat:@" Dictionary : %@", commandJsonString]];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];

}

- (void)disableMyMoToRestrictSendMoney:(CDVInvokedUrlCommand*)command
{
    NSLog(@"MyMo_Cordova_Plugin.m disableMyMoToRestrictSendMoney");

    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.bancatlan.sp05"];
    [userDefaults setObject:@"N" forKey:@"Enable_MyMO"];
}


//MARK:- Image Scaling
-(UIImage*)getScaledImage_ForImage:(UIImage*)image imageName:(NSString*)imgName{

    if ([imgName isEqualToString:@"arrowIcon"]) {
        UIImage* scaleImage = [self scaleToSize:CGSizeMake(20, 10) image:image];
        return scaleImage;
    } else if ([imgName isEqualToString:@"contactIcon"]) {
        UIImage* scaleImage = [self scaleToSize:CGSizeMake(36, 36) image:image];
        return scaleImage;
    }  else if ([imgName isEqualToString:@"mymoIconImg"]) {
        UIImage* scaleImage = [self scaleToSize:CGSizeMake(45, 45) image:image];
        return scaleImage;
    } else if ([imgName isEqualToString:@"txnSuccessIcon"] || [imgName isEqualToString:@"alertIcon"]) {
        UIImage* scaleImage = [self scaleToSize:CGSizeMake(50, 50) image:image];
        return scaleImage;
    } else if ([imgName isEqualToString:@"processingIcon"]) {
        UIImage* scaleImage = [self scaleToSize:CGSizeMake(80, 80) image:image];
        return scaleImage;
    } else {
        UIImage* scaleImage = [self scaleToSize:CGSizeMake(100, 40) image:image];
        return scaleImage;
    }
}

-(UIImage*)scaleToSize:(CGSize)size image:(UIImage*)imageToScale
{
  // Create a bitmap graphics context
  // This will also set it as the current context
  UIGraphicsBeginImageContext(size);

  // Draw the scaled image in the current context
  [imageToScale drawInRect:CGRectMake(0, 0, size.width, size.height)];

  // Create a new image from current context
  UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();

  // Pop the current context from the stack
  UIGraphicsEndImageContext();

  // Return our new scaled image
  return scaledImage;
}

//MARK:- get Image Path From Following Method
- (NSString*)getImagepath_From:(NSDictionary*)commandJsonString with_ImageName:(NSString*)imageName {

    // Check in Images.xcassets folder for image name
    // If Present : Execute If condition
    // If Not Present : Execute else condition
    NSString *ImagePath = @"";
    if ([UIImage imageNamed: imageName]) {
        UIImage *image = [self getScaledImage_ForImage:[UIImage imageNamed: imageName] imageName:imageName];
        NSData *imageData = UIImagePNGRepresentation(image);
        ImagePath = [self getDocumentPath_For_ImageName:imageName imageData:imageData];
    } else if ([[commandJsonString objectForKey:imageName] length] != 0){
       NSString* mymoIconImg_base64 = [commandJsonString objectForKey:imageName];
       ImagePath = [self getImagepath_For_ImageName:imageName imageBase64String:mymoIconImg_base64];;
    }

    return ImagePath;
}

// 1. Get Base64Image String from Dictionary
// 2. Convert Base64Image String Into UIImage.
// 3. Store Created UIImage In Group-Container
// 4. Get Group-Container Image Path
- (NSString*)getImagepath_For_ImageName:(NSString*)imageName imageBase64String:(NSString*)image_Base64_String {

    if (![image_Base64_String isEqualToString:@""]) {

        // 1.Prepare ImageData From base64 String & Image-Name
        NSString *base64String = [image_Base64_String stringByReplacingOccurrencesOfString:@"data:image/png;base64," withString:@""];
        base64String = [base64String stringByReplacingOccurrencesOfString:@"data:image/jpeg;base64," withString:@""];

        NSData *data = [[NSData alloc] initWithBase64EncodedString:base64String options:0];
        UIImage *image = [UIImage imageWithData:data];
        image = [self getScaledImage_ForImage:image imageName:imageName];

        NSData *imageData = UIImagePNGRepresentation(image);
        return [self getDocumentPath_For_ImageName:imageName imageData:imageData];

    } else {
        return @"";
    }
}

- (NSString*)getDocumentPath_For_ImageName:(NSString*)imageName imageData:(NSData*)imagedata {

    // 1.Prepare Image Path With Image-Name In Group-Container
    NSURL *documentURL = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:@"group.bancatlan.sp05"];
    documentURL = [documentURL URLByAppendingPathComponent:[NSString stringWithFormat:@"%@", [imageName stringByAppendingFormat:@".png"]]];

    // 2.Write ImageFile To Group-Container
    [[NSFileManager defaultManager] createFileAtPath:[documentURL path] contents:imagedata attributes:nil];

    // Return Image Path
    return [documentURL absoluteString];

}

@end
