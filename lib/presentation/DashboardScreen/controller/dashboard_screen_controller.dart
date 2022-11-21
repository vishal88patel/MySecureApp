import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/utils/ConstantsFiles/string_constants.dart';
import 'package:my_secure_app/utils/HelperFiles/ui_utils.dart';
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
  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      UIUtils.showSnakBar(
          bodyText: 'Do you want to exit an MySecureApp', headerText: StringConstants.ERROR);
      return Future.value(false);
    }
    return Future.value(true);
  }
  void getArguments() {
    if (arguments != null) {
      selectedIndex.value = arguments['bottomTabCount'] ?? 0;
    }
  }
}
