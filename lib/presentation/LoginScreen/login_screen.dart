import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../loader_screen.dart';
import 'controller/login_screen_controller.dart';

class LoginScreen extends StatelessWidget {
  var loginController = Get.find<LoginScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        MainCutomBackGround(
            child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getHorizontalSize(36.0),
              vertical: getVerticalSize(26)),
          child: SafeArea(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "1/8",
                          style: AppStyle.textStylePoppinsRegular
                              .copyWith(color: ColorConstant.primaryWhite),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getVerticalSize(57),
                    ),
                    Text(
                      "Give us your \nEmail ID",
                      style: AppStyle.textStylePoppinsRegular.copyWith(
                          color: ColorConstant.primaryWhite,
                          fontWeight: FontWeight.w700,
                          fontSize: getFontSize(32)),
                    ),
                    SizedBox(
                      height: getVerticalSize(5),
                    ),
                    Text(
                      "To apply, we need your Email ID linked to \nyour app",
                      style: AppStyle.textStylePoppinsRegular.copyWith(
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
                            style: AppStyle.textStylePoppinsRegular
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
                          Get.toNamed(AppRoutes.loginEmailScreen);
                        }),
                    SizedBox(
                      height: getVerticalSize(36),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )),
      ],
    ));
  }
}
