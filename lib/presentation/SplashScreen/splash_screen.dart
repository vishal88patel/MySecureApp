import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:secure_cash_app/App%20Configurations/image_constants.dart';

import '../../App Configurations/color_constants.dart';
import '../../utils/ConstantsFiles/string_constants.dart';
import '../../utils/HelperFiles/math_utils.dart';
import '../../utils/HelperFiles/pref_utils.dart';
import 'controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  var splashController = Get.find<SplashScreenController>();

  @override
  Widget build(BuildContext context) {
    // PrefUtils.setString(StringConstants.IS_KYC_DONE,"1");
    return Scaffold(
      backgroundColor: ColorConstant.primaryDarkGreen,
      body: Center(
        child: SvgPicture.asset(
          "asset/icons/ic_app_logo.svg",

          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
