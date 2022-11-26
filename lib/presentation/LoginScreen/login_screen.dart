import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../Custom Widgets/app_textField.dart';
import 'controller/login_screen_controller.dart';

class LoginScreen extends StatelessWidget {
  var loginController = Get.find<LoginScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.primaryBlack,
        body: SingleChildScrollView(
        child: Container(
        height: size.height,
        child: Stack(
      children: [
        SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "1/9",
                        style: AppStyle.DmSansFont
                            .copyWith(color: ColorConstant.primaryWhite),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getVerticalSize(57),
                  ),
                  Text(
                    "Give us your \nEmail ID",
                    style: AppStyle.DmSansFont.copyWith(
                        color: ColorConstant.primaryWhite,
                        fontWeight: FontWeight.w700,
                        fontSize: getFontSize(32)),
                  ),
                  SizedBox(
                    height: getVerticalSize(5),
                  ),
                  Text(
                    "To apply, we need your Email ID linked to \nyour app",
                    style: AppStyle.DmSansFont.copyWith(
                        color: ColorConstant.primaryAppTextF1,
                        fontWeight: FontWeight.w400,
                        fontSize: getFontSize(16)),
                  ),
                  SizedBox(
                    height: getVerticalSize(54),
                  ),
                  SizedBox(
                      child: AppTextField(
                        controller: loginController.emailController,
                        keyBordType: TextInputType.emailAddress,
                        hintText: "Email",
                      )),
                  Spacer(),
                  AppElevatedButton(
                      buttonName: 'Next',
                      radius: 5,
                      onPressed: () {
                        loginController.onTapOfButton();
                        // Get.to(
                        //   LoaderScreen("",AppRoutes.creatPasswordScreen),
                        //   transition: Transition.rightToLeft,
                        //   duration: Duration(milliseconds: 400),
                        // );
                      }),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "OR",
                          style: AppStyle.DmSansFont
                              .copyWith(color: ColorConstant.primaryWhite),
                        ),
                      ],
                    ),
                  ),
                  AppElevatedButton(
                      buttonName: 'Continue with Phone',
                      radius: 5,
                      onPressed: () {
                        // loginController.onTapOfButton();
                        // Get.toNamed(AppRoutes.loginEmailScreen);
                      }),
                  SizedBox(
                    height: getVerticalSize(36),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ))));
  }
}
