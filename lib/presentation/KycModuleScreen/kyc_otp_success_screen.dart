import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../Custom Widgets/app_textField.dart';
import 'controller/kyc_screen_controller.dart';

class KycOtpSuccessScreen extends StatelessWidget {
  var kycController = Get.find<KycScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.darkBlue,
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            child: SafeArea(
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
                        padding: EdgeInsets.symmetric(
                            horizontal: getHorizontalSize(40)),
                        child: Center(
                          child: Material(
                            color: Colors.transparent,
                            child: Wrap(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: ColorConstant
                                          .primaryWhite,
                                      borderRadius:
                                      const BorderRadius.all(
                                          Radius.circular(15))),
                                  margin: const EdgeInsets.only(
                                      bottom: 20),
                                  padding: const EdgeInsets.only(
                                    bottom: 20,
                                  ),
                                  constraints: const BoxConstraints(
                                      minWidth: 180),
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color:
                                            Color(0xFFF4F4F6),
                                            borderRadius:
                                            const BorderRadius
                                                .all(
                                                Radius.circular(
                                                    15))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Image.asset(
                                                "asset/icons/img_success_check.png",
                                                height: 100,
                                                width: 100,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                          padding: const EdgeInsets
                                              .fromLTRB(
                                              10, 10, 10, 10),
                                          child: Text(
                                            "OTP Verified Successfully, Now you proceed for Documentation and Identity Verification Level-2",
                                            textAlign:
                                            TextAlign.center,
                                            style: AppStyle
                                                .DmSansFont
                                                .copyWith(
                                                fontSize: getFontSize(20),
                                                color:
                                                ColorConstant
                                                    .darkBlue,
                                                fontWeight:
                                                FontWeight
                                                    .bold),
                                          )),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
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
            ),
          ),
        ));
  }
}