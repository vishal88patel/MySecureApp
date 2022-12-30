import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:secure_cash_app/presentation/ScanScreen/controller/scan_screen_controller.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../CashoutAmountScreen/controller/cashout_amount_scareen_controller.dart';
import '../../CashoutAmountScreen/model/getWallet.dart';
import '../../CashoutPinScreen/cashout_failed_screen.dart';
import '../../LoginScreen/models/login_response_model.dart';
import '../../NormalScreen/WelcomeScreen.dart';
import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import 'package:intl/intl.dart';

import '../../ScanScreen/scan_success_screen.dart';
import '../model/cashcard_model.dart';



class CCPinController extends GetxController {
  TextEditingController pinController = TextEditingController();
  var isPin=0.obs;
  var pin="".obs;
  var arguments = Get.arguments;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getArguments();
  }
  getArguments(){
    if (arguments != null) {
      pin.value = arguments['pin'];
      if(pin.value=="0"){
        isPin.value=0;
      }else{
        isPin.value=1;
      }
    }
  }
  @override
  void onClose() {
    super.onClose();
  }


  void onTapOfListTile(BuildContext context) {
    if (pinController.text.isEmpty) {
      UIUtils.showSnakBar(
        headerText: StringConstants.ERROR,
        bodyText: "Please Enter PIN",
      );
    }else if(pinController.text.length<4){
      UIUtils.showSnakBar(
        headerText: StringConstants.ERROR,
        bodyText: "Please Enter 4 Digit PIN",
      );
    }else{
      UpdateCashCardPinApi();
    }
  }

  Future<void> UpdateCashCardPinApi() async {
    // UIUtils.showProgressDialog(isCancellable: false);
    ApiService()
        .callPostApi(
        body: await UpdateCashCardPinApiBody(),
        headerWithToken: true,
        showLoader: true,
        url: ApiEndPoints.UPDATE_CASHCARD_PIN)
        .then((value) {
      print(value);
      if (value['status']) {
         UIUtils.showSnakBar(
             bodyText: value['message']??'', headerText: StringConstants.SUCCESS);
         Future.delayed(Duration(milliseconds: 1000), () {
           Get.offAllNamed(AppRoutes.dashBoardScreen,arguments: {"bottomTabCount":0});
         });
       // Get.back();
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message']??'', headerText: StringConstants.ERROR);
        //Get.back();
      //  Get.back();
      }
    });
  }
  Future<FormData> UpdateCashCardPinApiBody() async {
    final form = FormData({
      "pin": pinController.text,
    });
    return form;
  }

}
