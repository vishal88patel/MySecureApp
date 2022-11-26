import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import 'controller/create_password_screen_controller.dart';

class CreatePasswordScreen extends StatelessWidget {
  var createPasswordController = Get.find<CreatePasswordScreenController>();

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
                                      "Create your new Password",
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
                                  "Your new password must be different \nfrom previous used passwords.",
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
                                SizedBox(
                                  height: getVerticalSize(54),
                                ),
                                AppElevatedButton(
                                    buttonName: 'Next',
                                    onPressed: () {
                                      createPasswordController.onTapOfNextButton();
                                      // Get.to(
                                      //   LoaderScreen("",AppRoutes.creatPasswordScreen),
                                      //   transition: Transition.rightToLeft,
                                      //   duration: Duration(milliseconds: 400),
                                      // );
                                    }),

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



  }
}
