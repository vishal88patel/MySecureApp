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



class CCOrderController extends GetxController {
  LoginResponseModel? loginResponseModel=LoginResponseModel();
  var cashtag="".obs;
  var color="".obs;
  var arguments = Get.arguments;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getStoredData();
    getArguments();
  }
  getArguments(){
    if (arguments != null) {
      color.value = arguments['color'];
    }
  }
  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getStoredData() async {
    loginResponseModel = (await PrefUtils.getLoginModelData(StringConstants.LOGIN_RESPONSE));
    cashtag.value=loginResponseModel!.data!.cashtag.toString();
  }




}
