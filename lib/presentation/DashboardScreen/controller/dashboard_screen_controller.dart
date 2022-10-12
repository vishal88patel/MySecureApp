import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/network_info.dart';
import '../../../routes/app_routes.dart';



class DashBoarScreenController extends GetxController {
  var selectedIndex = 0.obs;
  var arguments = Get.arguments;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getArguments();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onTapOfBottomnavigation(int value) {
    selectedIndex.value=value;

  }
  void getArguments() {
    if (arguments != null) {
      selectedIndex.value = arguments['bottomTabCount'] ?? 0;
    }
  }
}
