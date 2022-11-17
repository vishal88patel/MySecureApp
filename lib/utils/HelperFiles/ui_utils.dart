import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../App Configurations/color_constants.dart';
import '../../App Configurations/image_constants.dart';
import '../../theme/app_style.dart';
import 'math_utils.dart';

class UIUtils {
  static bool isProgressVisible = false;

  ///common method for showing progress dialog
  static void showProgressDialog({isCancellable = false}) async {
    if (!isProgressVisible) {
      Get.dialog(
        Container(
          color: Colors.black.withOpacity(0.8),
          height: Get.size.height / 4,
          width: Get.size.width / 3,
          child: Lottie.asset("asset/animations/progressbar.json",
            height: Get.size.height /4,
            width: Get.size.width / 3,),
        ),
        barrierDismissible: isCancellable,
      );
      isProgressVisible = true;
    }
  }

  ///common method for hiding progress dialog
  static void hideProgressDialog() {
    if (isProgressVisible) Get.back();
    isProgressVisible = false;
  }

  static void showSnakBar({headerText, bodyText}) {
    Get.snackbar(
      headerText,
      bodyText,
      snackPosition: SnackPosition.BOTTOM,
      colorText: ColorConstant.primaryWhite
    );
  }

}
