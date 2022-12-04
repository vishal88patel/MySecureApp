import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_secure_app/App%20Configurations/image_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_AppBar%20.dart';
import 'package:my_secure_app/presentation/widget/select_mode_widget.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';

import '../../App Configurations/color_constants.dart';
import '../../utils/ConstantsFiles/string_constants.dart';
import '../../utils/HelperFiles/math_utils.dart';
import '../../utils/HelperFiles/pref_utils.dart';
import '../KycStep1ModuleScreen/selfie_screen.dart';
import 'controller/kyc_select_step_screen_controller.dart';

class KycSelectStepScreen extends StatelessWidget {
  var kycSelectStepController = Get.find<KycSelectStepController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor,
        body: SingleChildScrollView(
            child: Container(
                height: size.height,
                child: Stack(
                  children: [
                    Image.asset('asset/icons/background_image.png',
                        fit: BoxFit.cover, width: double.infinity),
                    SafeArea(
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppAppBar(
                                title: "KYC Levels",
                                icon1: "asset/icons/ic_back.svg",
                                icon2: "asset/icons/ic_notification.svg",
                                onPressedIcon1: () {
                                  Get.back();
                                },
                                onPressedIcon2: () {
                                  // Get.toNamed(AppRoutes.notificationScreen);
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getHorizontalSize(20)),
                                child: Text(
                                  "Select KYC level",
                                  style: AppStyle.textStyleDMSANS.copyWith(
                                      color: ColorConstant.naturalGrey,
                                      fontWeight: FontWeight.w400,
                                      fontSize: getFontSize(22)),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: getVerticalSize(150)),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: ColorConstant.primaryWhite,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(32),
                                    topRight: Radius.circular(32),
                                  )),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: getVerticalSize(20),
                                  ),
                                  Container(
                                    height: getVerticalSize(7),
                                    width: getHorizontalSize(60),
                                    decoration: BoxDecoration(
                                        color: ColorConstant.greyBD,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                  SizedBox(
                                    height: getVerticalSize(20),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.kycStep1DataScreen);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: getHorizontalSize(20),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color: ColorConstant.greyF9),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: getHorizontalSize(20),
                                            vertical: getVerticalSize(20)),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "asset/Logo.png",
                                                    height: getVerticalSize(35),
                                                    width:
                                                        getHorizontalSize(35),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        getHorizontalSize(15),
                                                  ),
                                                  Text(
                                                    "KYC Level 1",
                                                    style: AppStyle
                                                        .textStyleDMSANS
                                                        .copyWith(
                                                            color: ColorConstant
                                                                .naturalBlack,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize:
                                                                getFontSize(
                                                                    20)),
                                                  ),
                                                ],
                                              ),
                                              kycSelectStepController
                                                          .isVerified ==
                                                      "0"
                                                  ?  Row(
                                                children: [
                                                  Text(
                                                    "continue",
                                                    style: AppStyle
                                                        .textStyleDMSANS
                                                        .copyWith(
                                                        color: ColorConstant
                                                            .primaryLightGreen,
                                                        fontWeight:
                                                        FontWeight
                                                            .w500,
                                                        fontSize:
                                                        getFontSize(
                                                            16)),
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .arrow_forward_ios,
                                                    color: ColorConstant
                                                        .primaryLightGreen,
                                                    size: getVerticalSize(
                                                        20),
                                                  )
                                                ],
                                              )
                                                  : Text(
                                                      "completed",
                                                      style: AppStyle
                                                          .textStyleDMSANS
                                                          .copyWith(
                                                              color: ColorConstant
                                                                  .primaryLightGreen,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize:
                                                                  getFontSize(
                                                                      16)),
                                                    ),
                                            ]),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: getVerticalSize(20),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SelfieScreen(
                                                  image: 5,
                                                )),
                                      );
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: getHorizontalSize(20),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color: ColorConstant.greyF9),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: getHorizontalSize(20),
                                            vertical: getVerticalSize(20)),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "asset/Logo.png",
                                                    height: getVerticalSize(35),
                                                    width:
                                                        getHorizontalSize(35),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        getHorizontalSize(15),
                                                  ),
                                                  Text(
                                                    "KYC Level 2",
                                                    style: AppStyle
                                                        .textStyleDMSANS
                                                        .copyWith(
                                                            color: ColorConstant
                                                                .naturalBlack,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize:
                                                                getFontSize(
                                                                    20)),
                                                  ),
                                                ],
                                              ),
                                              kycSelectStepController
                                                          .isVerified ==
                                                      "1"
                                                  ? Row(
                                                      children: [
                                                        Text(
                                                          "continue",
                                                          style: AppStyle
                                                              .textStyleDMSANS
                                                              .copyWith(
                                                                  color: ColorConstant
                                                                      .primaryLightGreen,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      getFontSize(
                                                                          16)),
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .arrow_forward_ios,
                                                          color: ColorConstant
                                                              .primaryLightGreen,
                                                          size: getVerticalSize(
                                                              20),
                                                        )
                                                      ],
                                                    )
                                                  : Icon(
                                                      Icons.lock,
                                                      color: ColorConstant
                                                          .primaryLightGreen,
                                                      size: getVerticalSize(30),
                                                    ),
                                            ]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ))));
  }
}
