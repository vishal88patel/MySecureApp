import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';
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
              color: ColorConstant.buttonGreen.withOpacity(0.3),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: getVerticalSize(20)),
                    child: SafeArea(
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getHorizontalSize(20)),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
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
                                          Icons.arrow_back_ios_new_outlined,
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Give us your Email ID",
                                      style: AppStyle.DmSansFont.copyWith(
                                          color: ColorConstant.primaryBlack,
                                          fontWeight: FontWeight.w700,
                                          fontSize: getFontSize(20)),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(12),
                                          border: Border.all(
                                              color: Colors.transparent)),
                                      padding: EdgeInsets.all(10),
                                      child: Icon(
                                        Icons.arrow_back_ios_new_outlined,
                                        color: Colors.transparent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: getVerticalSize(120),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                      ),
                                      color: ColorConstant.primaryWhite),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SizedBox(
                                        height: getVerticalSize(130),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: getHorizontalSize(20)),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "To apply, we need your Email ID linked to \nyour app",
                                              style:
                                              AppStyle.DmSansFont.copyWith(
                                                  color:
                                                  ColorConstant.grey8F,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  fontSize:
                                                  getFontSize(18)),
                                            ),
                                            SizedBox(
                                              height: getVerticalSize(54),
                                            ),
                                            SizedBox(
                                                child: AppTextField(
                                                  controller: kycController
                                                      .emailController,
                                                  keyBordType:
                                                  TextInputType.emailAddress,
                                                  hintText: "Email",
                                                )),
                                            SizedBox(
                                              height: getVerticalSize(100),
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
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            right: 10,
                            top: getVerticalSize(60),
                            child: Center(
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                                  child: Image.asset(
                                    'asset/icons/email_image.jpg',
                                    height: getVerticalSize(220),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ));
  }
}