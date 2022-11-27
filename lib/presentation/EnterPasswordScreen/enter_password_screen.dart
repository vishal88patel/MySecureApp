import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import 'controller/enter_password_screen_controller.dart';

class EnterPasswordScreen extends StatelessWidget {
  var enterPasswordController = Get.find<EnterPasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor,
        body: SingleChildScrollView(
            child: Container(
                height: size.height,
                child: Stack(
                  children: [
                    SafeArea(
                      child: Stack(
                        children: [
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: getVerticalSize(10),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        Get.back();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                            border: Border.all(color: ColorConstant.backBorder)),
                                        padding: EdgeInsets.all(10),
                                        child: Icon(Icons.arrow_back_ios_new_outlined),
                                      ),
                                    ),
                                    Text(
                                      "Enter your Password",
                                      style: AppStyle.DmSansFont.copyWith(
                                          color: ColorConstant.darkBlue,
                                          fontWeight: FontWeight.w700,
                                          fontSize: getFontSize(20)),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                          border: Border.all(color: Colors.transparent)),
                                      padding: EdgeInsets.all(10),
                                      child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.transparent,),
                                    ),                      ],
                                ),
                                SizedBox(
                                  height: getVerticalSize(57),
                                ),
                                Center(
                                  child: SvgPicture.asset(
                                    "asset/icons/splash_image.svg",

                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: getVerticalSize(40),
                                ),

                                SizedBox(
                                  height: getVerticalSize(5),
                                ),
                                Text(
                                  "Please enter your password.",
                                  style: AppStyle.DmSansFont.copyWith(
                                      color: ColorConstant.grey8F,
                                      fontWeight: FontWeight.w400,
                                      fontSize: getFontSize(18)),
                                ),
                                SizedBox(
                                  height: getVerticalSize(54),
                                ),

                                Obx(
                                      () => AppTextField(
                                    hintText: 'Enter Password ',
                                    controller: enterPasswordController.passController,
                                    isObsecure: enterPasswordController.PaasIsObsecure.value,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(15),
                                    ],
                                    suffixIcon: IconButton(
                                      icon: Icon( enterPasswordController.PaasIsObsecure.value
                                          ? Icons.visibility_off
                                          : Icons.visibility
                                        // Icons.visibility_off,
                                      ),
                                      color: ColorConstant.primaryAppTextF1,
                                      iconSize: getSize(20),
                                      onPressed: () {
                                        print("oooooooooo");
                                        enterPasswordController.onTapOfPassObsecure(
                                            enterPasswordController
                                                .PaasIsObsecure.value);
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: getVerticalSize(54),
                                ),

                                AppElevatedButton(
                                    buttonName: 'Next',
                                    textColor: ColorConstant.primaryWhite,
                                    onPressed: () {
                                      enterPasswordController.onTapOfNextButton();
                                      // Get.to(
                                      //   LoaderScreen("",AppRoutes.creatPasswordScreen),
                                      //   transition: Transition.rightToLeft,
                                      //   duration: Duration(milliseconds: 400),
                                      // );
                                    }),
                                SizedBox(
                                  height: getVerticalSize(54),
                                ),
                                AppElevatedButton(
                                  buttonName: 'Forget Password',
                                  onPressed: () {
                                    enterPasswordController.onTapOfForgetPassButton();
                                  },
                                ),

                                SizedBox(
                                  height: getVerticalSize(36),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))));


      /*Scaffold(backgroundColor: ColorConstant.primaryBlack,
        body: SingleChildScrollView(
        child: Container(
        height: size.height,
        child: Stack(
      children: [
        Padding(
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

                      ],
                    ),
                    SizedBox(
                      height: getVerticalSize(57),
                    ),
                    Text(
                      "Enter your  \nPassword",
                      style: AppStyle.textStylePoppinsRegular.copyWith(
                          color: ColorConstant.primaryWhite,
                          fontWeight: FontWeight.w700,
                          fontSize: getFontSize(32)),
                    ),
                    SizedBox(
                      height: getVerticalSize(5),
                    ),
                    Text(
                      "Please enter your password",
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
                        hintText: 'Enter Password ',
                        controller: enterPasswordController.passController,
                        isObsecure: enterPasswordController.PaasIsObsecure.value,
                        maxLength: 15,
                        suffixIcon: IconButton(
                          icon: Icon( enterPasswordController.PaasIsObsecure.value
                              ? Icons.visibility_off
                              : Icons.visibility
                            // Icons.visibility_off,
                          ),
                          color: ColorConstant.primaryAppTextF1,
                          iconSize: getSize(20),
                          onPressed: () {
                            print("oooooooooo");
                            enterPasswordController.onTapOfPassObsecure(
                                enterPasswordController
                                    .PaasIsObsecure.value);
                          },
                        ),
                      ),
                    ),

                    SizedBox(
                      height: getVerticalSize(30),
                    ),

                    Spacer(),
                    AppElevatedButton(
                      radius: 5,
                      buttonName: 'Next',
                      onPressed: () {
                        enterPasswordController.onTapOfNextButton();

                      },
                    ),

                    SizedBox(
                      height: getVerticalSize(30),
                    ),
                    AppElevatedButton(
                      radius: 5,
                      buttonName: 'Forget Password',
                      onPressed: () {
                        enterPasswordController.onTapOfForgetPassButton();
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
        )
      ],
    ))));*/
  }
}
