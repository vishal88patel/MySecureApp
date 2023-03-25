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
    return WillPopScope(
      onWillPop: () =>goToHome(),
      child: Scaffold(
        backgroundColor: ColorConstant.primaryWhite,
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
                                      Get.offAllNamed(AppRoutes.dashBoardScreen,
                                          arguments: {"bottomTabCount": 0});
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(12),
                                          border: Border.all(color: ColorConstant.grey8F.withOpacity(0.3))),
                                      padding: EdgeInsets.all(6),
                                      child: Icon(
                                          Icons.arrow_back_ios_new_outlined,size: 22,color: ColorConstant.grey8F),
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
                        Row(
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
                        SizedBox(

                          height: getVerticalSize(20),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left:getVerticalSize(24),right: getVerticalSize(24),),
                          child: Text(
                            "OTP Verified Successfully, Now You Can Proceed for Documentation and Identity Verification",
                            textAlign:
                            TextAlign.center,
                            style: AppStyle
                                .DmSansFont
                                .copyWith(
                                fontSize: getFontSize(22),
                                color:
                                ColorConstant
                                    .darkBlue,
                                fontWeight:
                                FontWeight
                                    .bold),
                          ),
                        ),
                        SizedBox(
                          height: getVerticalSize(10),
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
          )),
    );
  }

  goToHome() {
    Get.offAllNamed(AppRoutes.dashBoardScreen,
        arguments: {"bottomTabCount": 0});  }
}