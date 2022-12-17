import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:secure_cash_app/presentation/RequestMoneyScreen/controller/request_money_screen_controller.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../Custom Widgets/appbar_image_1.dart';
import '../../Custom Widgets/common_image_view.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_style.dart';
import '../CashOutAmountNumPadScreen/controller/cash_out_amount_num_pad_screen_controller.dart';

class TopUpFailedScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.darkGrey,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Receipt",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: AppStyle.DmSansFont.copyWith(
                        color: ColorConstant.primaryWhite,
                        fontWeight: FontWeight.w700,
                        fontSize: getFontSize(30)),
                  ),
                ],
              ),
              SizedBox(
                height: 130,
              ),
              Container(
                width: size.width,
                child: SingleChildScrollView(
                  child: Container(
                    height: getVerticalSize(
                      550.00,
                    ),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: CommonImageView(
                            svgPath: "asset/icons/img_success_bg.svg",
                            height: getVerticalSize(
                              550.00,
                            ),
                            width: getHorizontalSize(
                              370.00,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 64,
                                      right: 64,
                                      top: 20
                                  ),
                                  child: Image.asset(
                                    "asset/icons/cancel_cross.png",
                                    height: getSize(
                                      100.00,
                                    ),
                                    width: getSize(
                                      100.00,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 64,
                                    top: 16,
                                    right: 64,
                                  ),
                                  child: Text(
                                    "Technical Error",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.DmSansFont.copyWith(
                                        color: ColorConstant.darkGrey,
                                        fontSize: getFontSize(28),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding:
                                  EdgeInsets.only(left: 28, right: 28, top: 10),
                                  child:

                                  Text(
                                    "Sorry, we cannot cashout your Amount because of some technical error, Please contact support.",
                                    textAlign: TextAlign.center,
                                    style: AppStyle.DmSansFont.copyWith(
                                        color: ColorConstant.greyTextColor,
                                        fontSize: getFontSize(20),
                                        fontWeight: FontWeight.w400),
                                  ),

                                ),
                              ),
                              SizedBox(height: 14,),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 38.0, right: 38,top:32),
                                  child: DottedLine(
                                      dashColor: ColorConstant.greyTextColor),
                                ),
                              ),
                              SizedBox(height: 14,),
                              Padding(
                                padding: const EdgeInsets.only(left: 40.0,right: 40,top: 12),
                                child: AppElevatedButton(
                                  buttonName: "Contact Support",
                                  textColor: Colors.white,
                                  buttonColor: ColorConstant.primaryLightGreen,
                                  radius: 16,
                                  onPressed: () {
                                    showTechnicalErrorDialouge();
                                    //Get.offAllNamed(AppRoutes.cashoutAmountScreen);
                                  },
                                ),
                              ),
                              SizedBox(height: 16,),
                              InkWell(
                                onTap: (){
                                  Get.offAllNamed(AppRoutes.dashBoardScreen,
                                      arguments: {"bottomTabCount": 0});
                                },
                                child: Text(
                                  "Home",
                                  textAlign: TextAlign.center,
                                  style: AppStyle.DmSansFont.copyWith(
                                      color: ColorConstant.greyTextColor,
                                      fontSize: getFontSize(20),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Future<void> showTechnicalErrorDialouge() async {
    return
      Get.dialog(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(60.0),
              vertical: getVerticalSize(340)),
          child: Wrap(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: ColorConstant.primaryWhite),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25)
                          ),
                          color: ColorConstant.greyF4,),

                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                    'asset/icons/done_image.png', height: 60),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    // Lottie.asset('asset/animations/welcome.json', height: 80),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text(
                              textAlign: TextAlign.center,
                              "This Functionality is coming soon",
                              style: AppStyle.DmSansFont.copyWith(
                                  color: ColorConstant.primaryBlack,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w400,
                                  fontSize: getFontSize(18)),
                            ),

                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: AppElevatedButton(
                        buttonName: 'Ok',
                        radius: 5,
                        textColor: Colors.white,
                        onPressed: () {
                          Get.back();
                          // Get.toNamed(AppRoutes.dashBoardScreen);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
        barrierDismissible: true,
      );
  }
}
