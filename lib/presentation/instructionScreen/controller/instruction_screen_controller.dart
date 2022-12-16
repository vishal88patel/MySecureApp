import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/routes/app_routes.dart';



class InstructionScreenController extends GetxController {
  var currentPage = 0.obs;
  late PageController pageController;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: currentPage.value);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onTapOfGetStartedButton() {
      Get.offAllNamed(AppRoutes.authOptionScreen);
  }

}
