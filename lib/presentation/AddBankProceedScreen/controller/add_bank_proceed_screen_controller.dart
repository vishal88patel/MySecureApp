import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/network_info.dart';
import '../../../routes/app_routes.dart';



class AddBankProceedScreenController extends GetxController {
  var arguments = Get.arguments;
  var bankId = "";
  var bankName = "".obs;
  var bankUrl = "".obs;
  var bankScript="".obs;
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

  getArguments() async {
    if (arguments != null) {
      bankId = arguments['BANK_ID'] ?? '';
      bankName.value = arguments['BANK_NAME'] ?? '';
      bankUrl.value = arguments['BANK_URL'] ?? '';
      bankScript.value = arguments['BANK_JS'] ?? '';
    }
  }
}
