import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
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
        Padding(
          padding: const EdgeInsets.all(155),
          child: Container(
            height: 50,
            width: 50,
            child: LoadingIndicator(
                indicatorType: Indicator.lineSpinFadeLoader, /// Required, The loading type of the widget
                colors:  [ColorConstant.buttonGreen],       /// Optional, The color collections
                strokeWidth: 2,                     /// Optional, The stroke of the line, only applicable to widget which contains line
                backgroundColor: Colors.transparent,     /// Optional, Background of the widget
                pathBackgroundColor: Colors.transparent,   /// Optional, the stroke backgroundColor
            )
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
      colorText: ColorConstant.darkBlue,
      backgroundColor: ColorConstant.buttonGreen.withOpacity(0.5),
      margin: EdgeInsets.only(bottom: 10,left: 10,right: 10)
      
    );
  }

}
