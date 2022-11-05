import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import 'controller/create_password_screen_controller.dart';

class CreatePasswordScreen extends StatelessWidget {
  var createPasswordController = Get.find<CreatePasswordScreenController>();

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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap:(){
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: ColorConstant.primaryWhite,
                          ),
                        ),
                        Text(
                          "2/6",
                          style: AppStyle.textStylePoppinsRegular
                              .copyWith(color: ColorConstant.primaryWhite),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getVerticalSize(57),
                    ),
                    Text(
                      "Create your new \nPassword",
                      style: AppStyle.textStylePoppinsRegular.copyWith(
                          color: ColorConstant.primaryWhite,
                          fontWeight: FontWeight.w700,
                          fontSize: getFontSize(32)),
                    ),
                    SizedBox(
                      height: getVerticalSize(5),
                    ),
                    Text(
                      "Your new password must be different \nfrom previous used passwords.",
                      style: AppStyle.textStylePoppinsRegular.copyWith(
                          color: ColorConstant.primaryAppTextF1,
                          fontWeight: FontWeight.w400,
                          fontSize: getFontSize(16)),
                    ),
                    SizedBox(
                      height: getVerticalSize(54),
                    ),
                    Obx(
                      () => AppTextField(
                        hintText: 'Create Password ',
                        controller:
                            createPasswordController.createPassController,
                        isObsecure:
                            createPasswordController.createPaasIsObsecure.value,
                        suffixIcon: IconButton(
                          icon: Icon(createPasswordController
                                      .createPaasIsObsecure.value
                                  ? Icons.visibility_off
                                  : Icons.visibility
                              // Icons.visibility_off,
                              ),
                          color: ColorConstant.primaryAppTextF1,
                          iconSize: getSize(20),
                          onPressed: () {
                            print("oooooooooo");
                            createPasswordController.onTapOfCreatePassObsecure(
                                createPasswordController
                                    .createPaasIsObsecure.value);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getVerticalSize(30),
                    ),
                    Obx(
                      () => AppTextField(
                        hintText: 'Confirm password',
                        suffixIcon: IconButton(
                          icon: Icon(createPasswordController
                                      .confirmPassIsObsecure.value
                                  ? Icons.visibility_off
                                  : Icons.visibility
                              // Icons.visibility,
                              ),
                          onPressed: () {
                            createPasswordController.onTapOfConfirmPassObsecure(
                                createPasswordController
                                    .confirmPassIsObsecure.value);
                          },
                          iconSize: getSize(20),
                          color: ColorConstant.primaryAppTextF1,
                        ),
                        controller:
                            createPasswordController.confirmPassController,
                        isObsecure: createPasswordController
                            .confirmPassIsObsecure.value,
                      ),
                    ),
                    Spacer(),
                    AppElevatedButton(
                      buttonName: 'Next',
                      onPressed: () {
                        createPasswordController.onTapOfNextButton();
                        // Get.toNamed(AppRoutes.enterPersonalDetailScreen);
                      },
                    ),
                    SizedBox(
                      height: getVerticalSize(40),
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
