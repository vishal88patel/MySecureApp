import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../Custom Widgets/app_textField.dart';
import 'controller/kyc_screen_controller.dart';

class KycOtpSuccessScreen extends StatelessWidget {
  var kycController = Get.find<KycScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            child: Stack(
              children: [
                Image.asset('asset/icons/background_image.png',
                    fit: BoxFit.cover,width: double.infinity),
                SafeArea(
                  child: Stack(
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                            child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: getVerticalSize(10),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            border: Border.all(color: ColorConstant.primaryWhite.withOpacity(0.3))),
                                        padding: EdgeInsets.all(6),
                                        child: Icon(
                                            Icons.arrow_back_ios_new_outlined,size: 22,color: ColorConstant.primaryWhite),
                                      ),
                                    ),
                                    Text(
                                      "",
                                      style: AppStyle.DmSansFont.copyWith(
                                          color: ColorConstant.primaryWhite,
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
                              ],
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(30)),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(24)),border: Border.all(color: ColorConstant.primaryLightGreen)
                              ),
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20),vertical: getVerticalSize(40)),
                                child: Column(
                                  children: [
                                    Lottie.asset('asset/animations/98621-success-status.json',
                                        height: getVerticalSize(200)),
                                    SizedBox(height: getVerticalSize(20),),
                                    Text('OTP verified successfully now your proceed for documentation and KYC',
                                      style: AppStyle.textStyleDMSANS
                                          .copyWith(color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w400,fontSize: getFontSize(22)),textAlign: TextAlign.center,),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Spacer(),

                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                            child: AppElevatedButton(
                              buttonName: 'Continue',
                              onPressed: () {
                                Get.toNamed(AppRoutes.kycSelectStepScreen);
                              },
                            ),
                          ),
                          SizedBox(height: getVerticalSize(32),),

                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}