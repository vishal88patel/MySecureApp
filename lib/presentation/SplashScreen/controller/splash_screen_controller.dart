import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/network_info.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../EnterPasswordScreen/models/login_response_model.dart';



class SplashScreenController extends GetxController {

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    changeRoute();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future changeRoute() async {
    LoginResponseModel? loginResponseModel = (await PrefUtils.getLoginModelData(StringConstants.LOGIN_RESPONSE));
    if (loginResponseModel != null &&
        loginResponseModel.data!.token!.isNotEmpty) {
      Future.delayed(Duration(milliseconds: 1000), () {
        Get.offAllNamed(AppRoutes.dashBoardScreen);
      });
    } else {
      Future.delayed(Duration(milliseconds: 1000), () {
        Get.offAllNamed(AppRoutes.loginScreen);
      });
    }
  }

}
