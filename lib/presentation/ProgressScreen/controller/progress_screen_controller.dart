import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/network_info.dart';
import '../../../routes/app_routes.dart';



class ProgressScreenController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    Future.delayed(Duration(milliseconds: 2500), () {
      Get.offAndToNamed(AppRoutes.successScreen);
    });
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
