import 'dart:ffi';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_AppBar .dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../theme/app_style.dart';
import '../../utils/HelperFiles/ui_utils.dart';
import 'controller/scan_screen_controller.dart';

class ScanSummaryScreen extends StatelessWidget {
  var scanController = Get.put(ScanScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.primaryDarkGreen,
        body: Column(
          children: [
            SizedBox(
              height: getVerticalSize(26),
            ),
            AppAppBar(
              title: "Summary Transaction",
              icon1: "asset/icons/ic_back.svg",
              icon2: "asset/icons/ic_help.svg",
              onPressedIcon1: () {
                Get.back();
              },
              onPressedIcon2: () {},
            ),
            SizedBox(height: getVerticalSize(40),),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ColorConstant.primaryWhite,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  child: SvgPicture.asset(
                    "asset/icons/ic_setting_black.svg",
                    width: getHorizontalSize(80),
                    height: getHorizontalSize(80),
                  ),
                ),
                SizedBox(height: getVerticalSize(20),),
                Text(
                  "Starbucks Coffee",
                  style: AppStyle.textStyleDMSANS.copyWith(
                      color: ColorConstant.primaryWhite,
                      fontWeight: FontWeight.w700,
                      fontSize: getFontSize(28)),
                ),
                SizedBox(height: getVerticalSize(12),),
                Text(
                  "Payment on Dec 2, 2020",
                  style: AppStyle.textStyleDMSANS.copyWith(
                      color: ColorConstant.brandYellow,
                      fontWeight: FontWeight.w500,
                      fontSize: getFontSize(18)),
                ),
                SizedBox(height: getVerticalSize(44),),
                Text(
                  "\$15.00",
                  style: AppStyle.textStyleDMSANS.copyWith(
                      color: ColorConstant.primaryWhite,
                      fontWeight: FontWeight.w700,
                      fontSize: getFontSize(52)),
                ),
                SizedBox(height: getVerticalSize(24),),
                Padding(
                  padding: EdgeInsets.only(
                      left: getHorizontalSize(20),
                      right: getHorizontalSize(20)),
                  child: Container(
                    height: getVerticalSize(80),
                    decoration: BoxDecoration(
                      color: ColorConstant.thirdDarkGreen,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: getHorizontalSize(25),
                          right: getHorizontalSize(25)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              "asset/icons/ic_i_icon.svg",
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text("Payment fee \$2 has been applied",
                                  style: AppStyle.textStyleDMSANS
                                      .copyWith(
                                      color: ColorConstant
                                          .primaryWhite,
                                      fontWeight: FontWeight.w500,
                                      fontSize: getFontSize(18))),
                            ),
                          ]),
                    ),
                  ),
                ),
              ],
            )),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              color: ColorConstant.primaryWhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: getHorizontalSize(20),
                      right: getHorizontalSize(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 16,
                      ),
                      Text(
                        "Choose Cards",
                        style: AppStyle.textStyleDMSANS.copyWith(
                            color: ColorConstant.naturalBlack,
                            fontWeight: FontWeight.w700,
                            fontSize: getFontSize(22)),
                      ),
                      SizedBox(
                        height: getVerticalSize(20),
                      ),
                      Container(
                        height: getVerticalSize(80),
                        decoration: BoxDecoration(
                          color: ColorConstant.naturalGrey2,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: getHorizontalSize(20),
                              right: getHorizontalSize(30)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: ColorConstant.primaryWhite,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: SvgPicture.asset(
                                      "asset/icons/ic_app_logo.svg",
                                      width: getHorizontalSize(40),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 14.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Wally Virtual Card",
                                          style: AppStyle.textStyleDMSANS
                                              .copyWith(
                                                  color: ColorConstant
                                                      .naturalBlack,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: getFontSize(18))),
                                      Text("1232-4563-7895-5123",
                                          style: AppStyle.textStyleDMSANS
                                              .copyWith(
                                                  color:
                                                      ColorConstant.naturalGrey,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: getFontSize(16))),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                SvgPicture.asset(
                                  "asset/icons/ic_down_arrow.svg",
                                ),
                              ]),
                        ),
                      ),
                      SizedBox(
                        height: getVerticalSize(26),
                      ),
                      AppElevatedButton(
                        buttonName: "Proceed to Pay",
                        textColor: Colors.white,
                        buttonColor: ColorConstant.primaryLightGreen,
                        radius: 16,
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: getVerticalSize(32),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
