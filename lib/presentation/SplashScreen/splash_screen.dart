import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_secure_app/App%20Configurations/image_constants.dart';

import '../../App Configurations/color_constants.dart';
import '../../utils/HelperFiles/math_utils.dart';
import 'controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  var splashController = Get.find<SplashScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Image.asset(
          AppImages.splashImagePath,
          height: size.height,
          width: size.width,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
