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

class KYCLoadingScreen extends StatelessWidget {
  var documentController = Get.put(UploadDocumentScreenController());

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
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10, bottom: 10),
                                          child: Icon(
                                            Icons.close,
                                            color: ColorConstant.primaryWhite,
                                          ),
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: getVerticalSize(30),
                                ),
                                Text(
                                  "Please Wait...",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w700,
                                          fontSize: getFontSize(32)),
                                ),
                                SizedBox(
                                  height: getVerticalSize(40),
                                ),
                                Row(
                                  children: [
                                    Lottie.asset(
                                        'asset/animations/loadingAndComplit.json',
                                        height: 24.0,
                                        repeat: false),
                                    SizedBox(
                                      width: getVerticalSize(6),
                                    ),
                                    Text(
                                      "Uploading Your Photos",
                                      style: AppStyle.textStylePoppinsRegular
                                          .copyWith(
                                              color: ColorConstant.primaryWhite,
                                              fontWeight: FontWeight.w500,
                                              fontSize: getFontSize(20)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: getVerticalSize(20),
                                ),
                                Row(
                                  children: [
                                    Lottie.asset(
                                        'asset/animations/loadingAndComplit.json',
                                        height: 24.0,
                                        repeat: false),
                                    SizedBox(
                                      width: getVerticalSize(6),
                                    ),
                                    Text(
                                      "Checking for errors",
                                      style: AppStyle.textStylePoppinsRegular
                                          .copyWith(
                                              color: ColorConstant.primaryWhite,
                                              fontWeight: FontWeight.w500,
                                              fontSize: getFontSize(20)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: getVerticalSize(20),
                                ),
                                Row(
                                  children: [
                                    Lottie.asset(
                                        'asset/animations/loadingAndComplit.json',
                                        height: 24.0,
                                        repeat: false),
                                    SizedBox(
                                      width: getVerticalSize(6),
                                    ),
                                    Text(
                                      "Sending your data for verification",
                                      style: AppStyle.textStylePoppinsRegular
                                          .copyWith(
                                              color: ColorConstant.primaryWhite,
                                              fontWeight: FontWeight.w500,
                                              fontSize: getFontSize(20)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: getVerticalSize(20),
                                ),
                                Row(
                                  children: [
                                    Lottie.asset(
                                        'asset/animations/loadingAndComplit.json',
                                        height: 24.0,
                                        repeat: false),
                                    SizedBox(
                                      width: getVerticalSize(6),
                                    ),
                                    Text(
                                      "Verifying you",
                                      style: AppStyle.textStylePoppinsRegular
                                          .copyWith(
                                              color: ColorConstant.primaryWhite,
                                              fontWeight: FontWeight.w500,
                                              fontSize: getFontSize(20)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: getVerticalSize(20),
                                ),
                                Spacer(),
                                Text(
                                  "Thank you.Your verification data has been successfully submitted.You'll get the results shortly",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w500,
                                          fontSize: getFontSize(18)),
                                ),
                                SizedBox(
                                  height: getVerticalSize(20),
                                ),
                                AppElevatedButton(
                                    buttonName: 'Continue',
                                    radius: 5,
                                    onPressed: () {
                                      //Get.toNamed(AppRoutes.uploadDocument1);

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
