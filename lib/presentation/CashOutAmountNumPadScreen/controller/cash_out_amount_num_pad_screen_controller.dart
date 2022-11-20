import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/network_info.dart';
import '../../../routes/app_routes.dart';



class CashOutAmountNumPadScreenController extends GetxController {
  final amountController = TextEditingController();
  var arguments = Get.arguments;
  var walletBalance="".obs;
  var email="".obs;
  var name="".obs;
  var profile_pic="".obs;
  var isPin=0.obs;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getArguments();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getArguments() {
    if (arguments != null) {
      walletBalance.value = arguments['WALLET_BALANCE'] ?? '';
      // email.value = arguments['EMAIL'] ?? '';
      // name.value = arguments['NAME'] ?? '';
      // profile_pic.value = arguments['IMAGE'] ?? '';
      // isPin.value = arguments['IS_PIN'] ?? '';
    }
  }

  void goNextScreen(){
    Get.toNamed(AppRoutes.pinScreen,arguments: {
      // "IS_PIN":isPin.value,
      // "EMAIL":email.value,
      // "NAME":name.value,
      // "IMAGE":profile_pic.value,
      // "UUID_ID":uuid.value,
      // "AMOUNT":amountController.text,
    });
  }
}
