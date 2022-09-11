import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_secure_app/App%20Configurations/image_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/key_pad.dart';
import 'controller/approved_screen_controller.dart';

class ApprovedScreen extends StatelessWidget {
  var approvedController = Get.find<ApprovedScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.primaryBlack,
        body: SafeArea(
          child: MainCutomBackGround(
            child: Center(
                child: Container(
                    height: getVerticalSize(530),
                    width: getHorizontalSize(340),
                    decoration: BoxDecoration(
                        color: ColorConstant.primaryWhite,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(getVerticalSize(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("asset/doller_card.png"),
                              SizedBox(
                                height: getVerticalSize(30),
                              ),
                              Text(
                                "Name",
                                style: AppStyle.textStyleSFPRORegular.copyWith(
                                    color: ColorConstant.lightText,
                                    fontWeight: FontWeight.w400,
                                    fontSize: getFontSize(18)),
                              ),
                              Text(
                                "Smith Roy",
                                style: AppStyle.textStyleSFPROBold.copyWith(
                                    color: ColorConstant.primaryBlack,
                                    fontWeight: FontWeight.w700,
                                    fontSize: getFontSize(24)),
                              ),
                              SizedBox(
                                height: getVerticalSize(30),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Date",
                                        style: AppStyle.textStyleSFPRORegular
                                            .copyWith(
                                                color: ColorConstant.lightText,
                                                fontWeight: FontWeight.w400,
                                                fontSize: getFontSize(18)),
                                      ),
                                      Text(
                                        "21 Dec 2021",
                                        style: AppStyle.textStyleSFPROBold
                                            .copyWith(
                                                color:
                                                    ColorConstant.primaryBlack,
                                                fontWeight: FontWeight.w700,
                                                fontSize: getFontSize(24)),
                                      ),
                                      SizedBox(
                                        height: getVerticalSize(30),
                                      ),
                                      Text(
                                        "Bank Name",
                                        style: AppStyle.textStyleSFPRORegular
                                            .copyWith(
                                            color: ColorConstant.lightText,
                                            fontWeight: FontWeight.w400,
                                            fontSize: getFontSize(18)),
                                      ),
                                      Text(
                                        "ABC Bank",
                                        style: AppStyle.textStyleSFPROBold
                                            .copyWith(
                                            color:
                                            ColorConstant.primaryBlack,
                                            fontWeight: FontWeight.w700,
                                            fontSize: getFontSize(24)),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "TIme",
                                        style: AppStyle.textStyleSFPRORegular
                                            .copyWith(
                                                color: ColorConstant.lightText,
                                                fontWeight: FontWeight.w400,
                                                fontSize: getFontSize(18)),
                                      ),
                                      Text(
                                        "07:00 PM",
                                        style: AppStyle.textStyleSFPROBold
                                            .copyWith(
                                                color:
                                                    ColorConstant.primaryBlack,
                                                fontWeight: FontWeight.w700,
                                                fontSize: getFontSize(24)),
                                      ),
                                      SizedBox(
                                        height: getVerticalSize(30),
                                      ),
                                      Text(
                                        "Amount ",
                                        style: AppStyle.textStyleSFPRORegular
                                            .copyWith(
                                            color: ColorConstant.lightText,
                                            fontWeight: FontWeight.w400,
                                            fontSize: getFontSize(18)),
                                      ),
                                      Text(
                                        "\$45,000",
                                        style: AppStyle.textStyleSFPROBold
                                            .copyWith(
                                            color:
                                            ColorConstant.primaryBlack,
                                            fontWeight: FontWeight.w700,
                                            fontSize: getFontSize(24)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: getVerticalSize(15),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              width: getHorizontalSize(340),
                              height: getVerticalSize(1),
                              color: ColorConstant.divider,
                            ),
                            SizedBox(
                              height: getVerticalSize(15),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: (){
                                    Get.toNamed(AppRoutes.cardProfileDetailScreen);
                                  },
                                  child: Container(
                                    height: getVerticalSize(50),
                                    width: getHorizontalSize(190),
                                    decoration: BoxDecoration(
                                        color: ColorConstant.lightGreen,
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(5))),
                                    child: Center(
                                      child: Text(
                                        "Approved",
                                        style: AppStyle.textStyleSFPRORegular
                                            .copyWith(
                                                color: ColorConstant.primaryWhite,
                                                fontWeight: FontWeight.w700,
                                                fontSize: getFontSize(24)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ))),
          ),
        ));
  }
}
