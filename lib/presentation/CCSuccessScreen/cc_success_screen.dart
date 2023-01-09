import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/App%20Configurations/color_constants.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import '../../Custom Widgets/common_image_view.dart';
import 'controller/cc_success_controller.dart';

class CCSuccessScreen extends StatelessWidget {
  var ccSuccessController = Get.find<CCSuccessController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.darkGrey,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 200,
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
                                450.00,
                              ),
                              width: size.width / 1.15),
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
                                      left: 64, right: 64, top: 20),
                                  child: Image.asset(
                                    "asset/icons/img_success_check.png",
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
                                    "Successfully",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.DmSansFont.copyWith(
                                        color: ColorConstant.darkBlue,
                                        fontSize: getFontSize(28),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 32, right: 32, top: 10),
                                  child: Text(
                                    "Your Cusomize Cash Card order has been placed successfully.",
                                    textAlign: TextAlign.center,
                                    style: AppStyle.DmSansFont.copyWith(
                                        color: ColorConstant.greyTextColor,
                                        fontSize: getFontSize(20),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 38.0, right: 38, top: 32),
                                  child: DottedLine(
                                      dashColor: ColorConstant.greyTextColor),
                                ),
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 40.0, right: 40, top: 12),
                                child: AppElevatedButton(
                                  buttonName: "Home",
                                  textColor: Colors.white,
                                  buttonColor: ColorConstant.primaryLightGreen,
                                  radius: 16,
                                  onPressed: () {
                                    Get.offAllNamed(AppRoutes.dashBoardScreen,
                                        arguments: {"bottomTabCount": 0});
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 16,
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
}
