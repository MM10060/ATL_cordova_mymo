
function enableMyMoInSettings(){
    cordova.plugins.MyMo_Cordova_Plugin.enableMyMoInSettings("",function(resp){
                                                             console.log("Success"+resp);
                                                             },function(err){
                                                             console.log("Error"+err);
                                                             }
                                                             );
}

function selectKeyboardOptions(){
    cordova.plugins.MyMo_Cordova_Plugin.selectKeyboardOptions("",function(resp){
                                                              console.log("Success"+resp);
                                                              },function(err){
                                                              console.log("Error"+err);
                                                              }
                                                              );
}

var boton = document.getElementById("enableDisableBtnTxt");
function enableDisableBtnClick(){
    console.log("me diste click")
    var enableDisableBtnTxt = document.getElementById("enableDisableBtnTxt").textContent;
    if("ENABLE MYMO" == enableDisableBtnTxt){
        var searchData = {
            phNo: document.getElementById("phNo").value,
            senderName: document.getElementById("senderName").value,
            bankUserName: document.getElementById("bankUserName").value,
            IdNumber: document.getElementById("idNumber").value,
            custCode: "",
            countryCode: "HONDURAS",
            currencySymbol: "L.",
            currencyCode: "HNL",
            loginId: "atl_mymo",
            password: "Merchant#1",
            merchantId: "14196",
            locale: "es_ES",
            minAmt: "",
            maxAmt: "",
            postURL: "https://demo.idmission.com/IDS/service/ids/",
            branchCode: "ATL",
            bnkAcc: document.getElementById("bnkAcc").value,
            banksdropdown: "Savings",
            txnSecurity: "N",
            recPhoneSecurity: "Y",
            receiversPhoneRequired: "Y",
            OTPSecurityRequired: "Y",
            PINSecurityRequired: "Y",
            txnSecurityPin: "Y",
            noSecurity: "N",
            PinValidateAtIDM: "IDM",
            customerSecurityPin:"1234",
              customerPinLength: "4",
            textColor: "#75787B",
            textColorSelected: "#D22630",
            calandarBtnTxtClr: "#D9272E",
            loadMoreBtnTxtClr: "#D9272E",
            buttonColor: "#D9272E",
            headerPayBackClr: "#D9272E",
            histHeaderBackClr: "#D9272E",
            txnSuccessTxtClr: "#75787B",
            alertTxtClr: "#75787B",
            editBoxBackClr: "#FFFFFF",
            sendMoneyLbl: "Transferir",
            atmLbl: "Retiro sin tarjeta",
            historyLbl: "Historial",
            payLbl: "Confirmar",
            enableMyMo: "Y",
            showSendMoney: "Y",
            showSendToATM: "Y",
            showHistory: "Y",
            applicationCode: "CUX",
            phoneLength: "8",




        };

        document.getElementById('enableDisableBtnTxt').innerHTML = "DISABLE MYMO";
        cordova.plugins.MyMo_Cordova_Plugin.enableMyMoToAllowSendMoney(searchData,function(resp){
                                                                       console.log("Success"+resp);
                                                                       document.activeElement.blur();
                                                                       setTimeout(function(){document.getElementById("phNo").focus();},1500);
                                                                       },function(err){
                                                                       console.log("Error"+err);
                                                                       }
                                                                       );


    }else if("DISABLE MYMO" == enableDisableBtnTxt) {

        document.getElementById('enableDisableBtnTxt').innerHTML = "ENABLE MYMO";
        cordova.plugins.MyMo_Cordova_Plugin.disableMyMoToRestrictSendMoney("",function(resp){
                                                                           console.log("Success"+resp);
                                                                           document.activeElement.blur();
                                                                           setTimeout(function(){document.getElementById("phNo").focus();},1500);
                                                                           },function(err){
                                                                           console.log("Error"+err);
                                                                           }
                                                                           );

    }
}

boton.addEventListener("click", enableDisableBtnClick)






