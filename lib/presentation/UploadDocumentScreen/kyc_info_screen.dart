import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../loader_screen.dart';
import 'controller/uplod_document_screen_controller.dart';
import 'num_pad_phone_number.dart';

class KYCInfoScreen extends StatelessWidget {
  var documentController = Get.find<UploadDocumentScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.primaryBlack,
        body: SingleChildScrollView(
            child: Container(
                height: size.height,
                child: Stack(
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
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        InkWell(
                                            onTap:(){
                                              Get.back();
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(right: 10,bottom: 10),
                                              child: Icon(Icons.close,color: ColorConstant.primaryWhite,),
                                            ))                                      ],
                                    ),

                                    SizedBox(
                                      height: getVerticalSize(30),
                                    ),
                                    Text(
                                      "Put a face to your info",
                                      style: AppStyle.textStylePoppinsRegular.copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w700,
                                          fontSize: getFontSize(32)),
                                    ),


                                    SizedBox(
                                      height: getVerticalSize(20),
                                    ),
                                    Text(
                                      "To confirm it's you, we need to collect some photos",
                                      style: AppStyle.textStylePoppinsRegular.copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w600,
                                          fontSize: getFontSize(22)),
                                    ),


                                    SizedBox(
                                      height: getVerticalSize(40),
                                    ),
                                    Lottie.asset(
                                        'asset/animations/116030-verifired.json',
                                        // height: 36.0,
                                    ),
                                    SizedBox(
                                      height: getVerticalSize(60),
                                    ),
                                    Text(
                                      "we need to collect some information and photos To confirm it's your account,Here is a some steps for verification please follow and submit information.",
                                      style: AppStyle.textStylePoppinsRegular.copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w500,
                                          fontSize: getFontSize(20)),
                                    ),


                                    SizedBox(
                                      height: getVerticalSize(9),
                                    ),

                                    Spacer(),
                                    AppElevatedButton(
                                        buttonName: 'Continue',
                                        radius: 5,
                                        onPressed: () {
                                          Get.toNamed(AppRoutes.uploadDocument1);

                                          // loginController.onTapOfButton();
                                          // Get.to(
                                          //   LoaderScreen("",AppRoutes.creatPasswordScreen),
                                          //   transition: Transition.rightToLeft,
                                          //   duration: Duration(milliseconds: 400),
                                          // );
                                        }),


                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ))));
  }
}
