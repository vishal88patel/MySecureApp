import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/network_info.dart';
import '../../../routes/app_routes.dart';



class SuccessScreenController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    Future.delayed(Duration(milliseconds: 2000), () {
      Get.toNamed(AppRoutes.accountDetailListScreen);
    });
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
