import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/network_info.dart';
import '../../../routes/app_routes.dart';
import 'kyc_step1_screen_controller.dart';

class KycLoaderController extends GetxController {
  var kycStep1Controller = Get.find<KycStep1ScreenController>();
  var arguments = Get.arguments;
  var apiType = 0.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getArguments();
    if (apiType.value == 1) {
      kycStep1Controller.onClickOfSubmitIdButton();
    } else if (apiType.value == 2) {
      kycStep1Controller.onClickOfSubmitPassButton();
    } else if (apiType.value == 3) {
      kycStep1Controller.onClickOfSubmitStep2Button();
    }

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getArguments() {
    if (arguments != null) {
      apiType.value = arguments['API_TYPE'];
    }
  }
}
