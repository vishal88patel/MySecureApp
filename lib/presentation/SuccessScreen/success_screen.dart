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
import 'controller/success_screen_controller.dart';

class SuccessScreen extends StatelessWidget {
  var progressController = Get.find<SuccessScreenController>();

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
                    Text("Success",
                      style: AppStyle.textStyleSFPROBold
                          .copyWith(color: ColorConstant.primaryWhite,
                          fontWeight: FontWeight.w700,fontSize: getFontSize(24)),),
                    SizedBox(height: getVerticalSize(12),),
                    Text("Your Bank Has Been Link",
                      style: AppStyle.textStyleSFPRORegular
                          .copyWith(color: ColorConstant.primaryWhite,
                          fontWeight: FontWeight.w400,fontSize: getFontSize(18)),),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 8),
                      child: AppElevatedButton(
                          buttonName: 'Go to Home',
                          onPressed: () {
                            Get.offAllNamed(AppRoutes.dashBoardScreen);

                          }),
                    ),
                  ],
                )),
          ),
        ));
  }
}
