import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/routes/app_routes.dart';



class InstructionScreenController extends GetxController {
  var currentPage = 0.obs;
  late PageController pageController;
  var isFrom = "0".obs;
  var arguments = Get.arguments;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: currentPage.value);
    getArguments();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getArguments() {
    if (arguments != null) {
      isFrom.value = arguments['ISFROM'];
    }
  }


  void onTapOfGetStartedButton() {
      Get.offAllNamed(AppRoutes.authOptionScreen);
  }

}
