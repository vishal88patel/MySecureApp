import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_secure_app/App%20Configurations/image_constants.dart';

import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/main_custom_background.dart';
import '../../utils/ConstantsFiles/string_constants.dart';
import '../../utils/HelperFiles/math_utils.dart';
import '../../utils/HelperFiles/pref_utils.dart';
import 'controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  var splashController = Get.find<SplashScreenController>();

  @override
  Widget build(BuildContext context) {
    // PrefUtils.setBool(StringConstants.SHOW_WELCOME_DISLOUGE,true);
    return Scaffold(
      body: MainCutomBackGround(
        child: Image.asset(
          "asset/splash_image.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
