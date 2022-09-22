import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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
        Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  // you can replace this with Image.asset
                  'asset/icons/progress_icon.png',
                  fit: BoxFit.cover,
                  height: 80,
                  width: 80,
                ),
                // you can replace
                SizedBox(
                  height: 150,
                  width: 150,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        ColorConstant.skyE8),
                    strokeWidth: 5,
                  ),
                ),
              ],
            ),
          ),
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
