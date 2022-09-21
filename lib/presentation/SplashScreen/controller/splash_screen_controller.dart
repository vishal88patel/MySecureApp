import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/network_info.dart';
import '../../../routes/app_routes.dart';



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
    // verifyOtpResponseModel = (await PrefUtils.getDataObject(StringConstants.verificationModel))
    // as VerifyOtpResponseModel?;
    // if (verifyOtpResponseModel != null &&
    //     verifyOtpResponseModel!.data!.accessToken!.isNotEmpty) {
    //   Future.delayed(Duration(milliseconds: 1000), () {
    //     Get.offAllNamed(AppRoutes.homePage);
    //   });
    // } else {
    //   Future.delayed(Duration(milliseconds: 1000), () {
    //     if (PrefUtils.getString(StringConstants.IS_NEW_USER) == "1") {
    //       Get.offAllNamed(AppRoutes.homePage);
    //     } else {
    //       Get.offAllNamed(AppRoutes.welcomePageMain);
    //     }
    //   });
    // }
    Future.delayed(Duration(milliseconds: 2000), () {
      Get.offAllNamed(AppRoutes.loginScreen);
    });
  }

  Future<void> checkInterner() async {
    await NetworkInfo.checkNetwork().then((val) async {
      changeRoute();
      if (val) {
      } else {
        checkInterner();
      }
    });
  }
}
