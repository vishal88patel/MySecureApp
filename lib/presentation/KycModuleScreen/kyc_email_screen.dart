import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:secureapp/routes/app_routes.dart';
import 'package:secureapp/theme/app_style.dart';
import 'package:secureapp/utils/HelperFiles/math_utils.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../Custom Widgets/app_textField.dart';
import 'controller/kyc_screen_controller.dart';

class KycEmailScreen extends StatelessWidget {
  var kycController = Get.find<KycScreenController>();

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
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            border: Border.all(
                                                color:
                                                ColorConstant.backBorder)),
                                        padding: EdgeInsets.all(6),
                                        child: Icon(
                                          Icons.arrow_back_ios_new_outlined,size: 22,),
                                      ),
                                    ),
                                    Text(
                                      "Give us your Email ID",
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
                                  "To apply, we need your Email ID linked to \nyour app",
                                  style: AppStyle.DmSansFont.copyWith(
                                      color: ColorConstant.grey8F,
                                      fontWeight: FontWeight.w400,
                                      fontSize: getFontSize(18)),
                                ),
                                SizedBox(
                                  height: getVerticalSize(54),
                                ),
                                SizedBox(
                                    child: AppTextField(
                                      controller: kycController.emailController,
                                      keyBordType: TextInputType.emailAddress,
                                      hintText: "Email",
                                    )),
                                SizedBox(
                                  height: getVerticalSize(54),
                                ),
                                AppElevatedButton(
                                    buttonName: 'Get OTP',
                                    textColor: ColorConstant.primaryWhite,
                                    onPressed: () {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      kycController.onTapOfSendOtpEmailButton();
                                    }),
                                SizedBox(
                                  height: getVerticalSize(36),
                                ),
                                AppElevatedButton(
                                    buttonName: 'Continue with Phone Number',
                                    textColor: ColorConstant.primaryWhite,
                                    onPressed: () {
                                      Get.toNamed(AppRoutes.kycPhoneScreen);
                                    }),
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