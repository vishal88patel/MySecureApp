import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_secure_app/App%20Configurations/image_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/key_pad.dart';
import 'controller/progress_screen_controller.dart';

class ProgressScreen extends StatelessWidget {
  var progressController = Get.find<ProgressScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.primaryBlack,
        body: SafeArea(
          child: MainCutomBackGround(
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width/1.25,
                      child: Lottie.asset("asset/animations/progressbar.json",
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width),
                    ),
                    Text("Linking account linked with bank",
                      style: AppStyle.textStyleSFPRORegular
                          .copyWith(color: ColorConstant.primaryWhite,
                          fontWeight: FontWeight.w400,fontSize: getFontSize(18)),),
                  ],
                )),
          ),
        ));
  }
}
