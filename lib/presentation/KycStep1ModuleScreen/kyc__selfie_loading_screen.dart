import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_textField.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/ConstantsFiles/string_constants.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';
import 'package:secure_cash_app/utils/HelperFiles/pref_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../loader_screen.dart';
import 'controller/kyc__selfie_loader_screen_controller.dart';
import 'controller/kyc_loader_screen_controller.dart';
import 'controller/kyc_step1_screen_controller.dart';

class KYCSelfieLoadingScreen extends StatelessWidget {
  var kycStep1Controller = Get.find<KycStep1ScreenController>();
  var kycselfieLoaderController = Get.find<KycSelfieLoaderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.blue26,
        body: SingleChildScrollView(
            child: Container(
                height: size.height,
                child: Stack(
                  children: [
                         Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getHorizontalSize(36),
                          vertical: getVerticalSize(36)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: getVerticalSize(52),
                          ),
                          Center(child: Image.asset("asset/icons/app_icon.png",height: getVerticalSize(80),)),
                          SizedBox(
                            height: getVerticalSize(40),
                          ),
                          Text(
                            "Please Wait...",
                            style: AppStyle.textStyleDMSANS
                                .copyWith(
                                    color: ColorConstant.primaryWhite,
                                    fontWeight: FontWeight.w700,
                                    fontSize: getFontSize(32)),
                          ),
                          SizedBox(
                            height: getVerticalSize(40),
                          ),
                          Obx(()=>
                             Row(
                              children: [
                                kycStep1Controller.progress1.value?Lottie.asset(
                                    'asset/animations/green_tick.json',
                                    height: 30.0,
                                    repeat: false):Lottie.asset(
                                    'asset/animations/green_loader.json',
                                    height: 30.0,
                                    repeat: true),
                                SizedBox(
                                  width: getVerticalSize(6),
                                ),
                                Text(
                                  "Establishing a secure connection \nto the server",
                                  style: AppStyle.textStyleDMSANS
                                      .copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w500,
                                          fontSize: getFontSize(20)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: getVerticalSize(20),
                          ),
                          Obx(()=>
                           Row(
                              children: [
                                kycStep1Controller.progress2.value?Lottie.asset(
                                    'asset/animations/green_tick.json',
                                    height: 30.0,
                                    repeat: false):Lottie.asset(
                                    'asset/animations/green_loader.json',
                                    height: 30.0,
                                    repeat: true),
                                SizedBox(
                                  width: getVerticalSize(6),
                                ),
                                Text(
                                  "Scanning your document…",
                                  style: AppStyle.textStyleDMSANS
                                      .copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w500,
                                          fontSize: getFontSize(20)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: getVerticalSize(20),
                          ),
                          Obx(()=> Row(
                              children: [
                                kycStep1Controller.progress3.value?Lottie.asset(
                                    'asset/animations/green_tick.json',
                                    height: 30.0,
                                    repeat: false):Lottie.asset(
                                    'asset/animations/green_loader.json',
                                    height: 30.0,
                                    repeat: true),
                                SizedBox(
                                  width: getVerticalSize(6),
                                ),
                                Text(
                                  "Checking for blur or unclear \ndocuments",
                                  style: AppStyle.textStyleDMSANS
                                      .copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w500,
                                          fontSize: getFontSize(20)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: getVerticalSize(20),
                          ),
                          Obx(()=>Row(
                              children: [
                                kycStep1Controller.progress4.value?Lottie.asset(
                                    'asset/animations/green_tick.json',
                                    height: 30.0,
                                    repeat: false):Lottie.asset(
                                    'asset/animations/green_loader.json',
                                    height: 30.0,
                                    repeat: true),
                                SizedBox(
                                  width: getVerticalSize(6),
                                ),
                                Text(
                                  "Validating with facial recognition \nand document uploaded",
                                  style: AppStyle.textStyleDMSANS
                                      .copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w500,
                                          fontSize: getFontSize(20)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: getVerticalSize(20),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ],
                ))));
  }
}
