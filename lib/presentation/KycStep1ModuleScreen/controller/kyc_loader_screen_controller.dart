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

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    kycStep1Controller.onClickOfSubmitButton();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
