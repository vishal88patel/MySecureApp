import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:secure_cash_app/App%20Configurations/image_constants.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_AppBar%20.dart';
import 'package:secure_cash_app/presentation/widget/select_mode_widget.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/ui_utils.dart';

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
    return WillPopScope(
      onWillPop: () => kycSelectStepController.goToHome(),
      child: Scaffold(
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
                                  title: "Identity Verification",
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
                                    "Select Identity Verification Level",
                                    style: AppStyle.textStyleDMSANS.copyWith(
                                        color: ColorConstant.primaryWhite,
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
                                        if (kycSelectStepController.isVerified ==
                                            "0") {
                                          // Get.toNamed(
                                          //     AppRoutes.kycStep1DataScreen);
                                          Get.offAllNamed(AppRoutes.kycStep1DataScreen);
                                        }else if(kycSelectStepController.isVerified ==
                                            "4"){
                                          Get.dialog(
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
                                                        padding: const EdgeInsets.only(
                                                          bottom: 10,
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
                                                              padding: EdgeInsets.all(6),
                                                              child: InkWell(
                                                                onTap:(){
                                                                  Get.back();
                                                                },
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                                  children: [
                                                                    Icon(
                                                                        Icons.close),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                      children: [
                                                                        Image.asset(
                                                                          "asset/icons/img_success_check.png",
                                                                          height: 80,
                                                                          width: 80,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Icon(
                                                                      Icons.close,
                                                                      color: Colors
                                                                          .transparent,
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
                                                                    0, 10, 0, 0),
                                                                child: Text(
                                                                  "Completed",
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
                                                            Container(
                                                                padding: const EdgeInsets
                                                                    .fromLTRB(
                                                                    10, 10, 10, 0),
                                                                child: Text(
                                                                  "Your Kyc is Completed",
                                                                  textAlign:
                                                                  TextAlign.center,
                                                                  style: AppStyle
                                                                      .DmSansFont
                                                                      .copyWith(
                                                                      fontSize: getFontSize(18),
                                                                      color: ColorConstant
                                                                          .darkBlue),
                                                                )),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            barrierDismissible: true,
                                          );
                                        }
                                        else{

                                        }
                                      },
                                      child: Obx(
                                            () =>
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: getHorizontalSize(20),
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(16),
                                                    color: ColorConstant.greyF9),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: getHorizontalSize(
                                                        20),
                                                    vertical: getVerticalSize(
                                                        20)),
                                                child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            "asset/icons/ic_green_level.png",
                                                            height:
                                                            getVerticalSize(22),
                                                            width:
                                                            getHorizontalSize(22),
                                                          ),
                                                          SizedBox(
                                                            width:
                                                            getHorizontalSize(15),
                                                          ),
                                                          Text(
                                                            "Level 1",
                                                            style: AppStyle
                                                                .textStyleDMSANS
                                                                .copyWith(
                                                                color: ColorConstant
                                                                    .naturalBlack,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                                fontSize:
                                                                getFontSize(
                                                                    20)),
                                                          ),
                                                        ],
                                                      ),
                                                      kycSelectStepController
                                                          .isVerified ==
                                                          "0"
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
                                                            size:
                                                            getVerticalSize(
                                                                20),
                                                          )
                                                        ],
                                                      ) : kycSelectStepController
                                                          .isVerified ==
                                                          "1"
                                                          ? Text(
                                                        "pending",
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
                                                      ) : kycSelectStepController
                                                          .isVerified ==
                                                          "2"
                                                          ? Text(
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
                                                      ):Text(
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
                                                      )
                                                    ]),
                                              ),
                                            ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: getVerticalSize(20),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (kycSelectStepController.isVerified ==
                                            "2") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SelfieScreen(
                                                      image: 5,
                                                    )),
                                          );
                                        } else {
                                          if(kycSelectStepController.isVerified ==
                                              "3"){
                                            Get.dialog(
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
                                                                padding: EdgeInsets.all(12),
                                                                child: InkWell(
                                                                  onTap:(){
                                                                    Get.back();
                                                                  },
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                    children: [
                                                                      Icon(
                                                                          Icons.close),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                        children: [
                                                                          SvgPicture.asset(
                                                                              "asset/icons/ic_lock_pending.svg")
                                                                        ],
                                                                      ),
                                                                      Icon(
                                                                        Icons.close,
                                                                        color: Colors
                                                                            .transparent,
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
                                                                      0, 10, 0, 0),
                                                                  child: Text(
                                                                    "Oops!",
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
                                                              Container(
                                                                  padding: const EdgeInsets
                                                                      .fromLTRB(
                                                                      10, 10, 10, 0),
                                                                  child: Text(
                                                                    "Your Kyc is Pending!!! we will notify you once it approved",
                                                                    textAlign:
                                                                    TextAlign.center,
                                                                    style: AppStyle
                                                                        .DmSansFont
                                                                        .copyWith(
                                                                        fontSize: getFontSize(18),
                                                                        color: ColorConstant
                                                                            .darkBlue),
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              barrierDismissible: true,
                                            );
                                          }else if(kycSelectStepController.isVerified ==
                                              "4"){
                                            Get.dialog(
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
                                                          padding: const EdgeInsets.only(
                                                            bottom: 10,
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
                                                                padding: EdgeInsets.all(6),
                                                                child: InkWell(
                                                                  onTap:(){
                                                                    Get.back();
                                                                  },
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                    children: [
                                                                      Icon(
                                                                          Icons.close),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                        children: [
                                                                          Image.asset(
                                                                            "asset/icons/img_success_check.png",
                                                                            height: 80,
                                                                            width: 80,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Icon(
                                                                        Icons.close,
                                                                        color: Colors
                                                                            .transparent,
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
                                                                      0, 10, 0, 0),
                                                                  child: Text(
                                                                    "Completed",
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
                                                              Container(
                                                                  padding: const EdgeInsets
                                                                      .fromLTRB(
                                                                      10, 10, 10, 0),
                                                                  child: Text(
                                                                    "Your Kyc is Completed",
                                                                    textAlign:
                                                                    TextAlign.center,
                                                                    style: AppStyle
                                                                        .DmSansFont
                                                                        .copyWith(
                                                                        fontSize: getFontSize(18),
                                                                        color: ColorConstant
                                                                            .darkBlue),
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              barrierDismissible: true,
                                            );
                                        }else{
                                            Get.dialog(
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
                                                                padding: EdgeInsets.all(12),
                                                                child: InkWell(
                                                                  onTap:(){
                                                                    Get.back();
                                                                  },
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                    children: [
                                                                      Icon(
                                                                          Icons.close),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                        children: [
                                                                          SvgPicture.asset(
                                                                              "asset/icons/ic_lock_pending.svg")
                                                                        ],
                                                                      ),
                                                                      Icon(
                                                                        Icons.close,
                                                                        color: Colors
                                                                            .transparent,
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
                                                                      0, 10, 0, 0),
                                                                  child: Text(
                                                                    "Oops!",
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
                                                              Container(
                                                                  padding: const EdgeInsets
                                                                      .fromLTRB(
                                                                      10, 10, 10, 0),
                                                                  child: Text(
                                                                    "Level 2 is locked, to unlock it\nfirst complete level 1.",
                                                                    textAlign:
                                                                    TextAlign.center,
                                                                    style: AppStyle
                                                                        .DmSansFont
                                                                        .copyWith(
                                                                        fontSize: getFontSize(18),
                                                                        color: ColorConstant
                                                                            .darkBlue),
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              barrierDismissible: true,
                                            );
                                          }
                                      }
                                    },
                                    child: Obx(
                                          () =>
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: getHorizontalSize(20),
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(16),
                                                  color: ColorConstant.greyF9),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: getHorizontalSize(
                                                      20),
                                                  vertical: getVerticalSize(
                                                      20)),
                                              child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        kycSelectStepController
                                                            .isVerified ==
                                                            "2" ||
                                                            kycSelectStepController
                                                                .isVerified ==
                                                                "3" ||
                                                            kycSelectStepController
                                                                .isVerified ==
                                                                "4"
                                                            ? Image.asset(
                                                          "asset/icons/ic_green_level2.png",
                                                          height:
                                                          getVerticalSize(
                                                              22),
                                                          width:
                                                          getHorizontalSize(
                                                              22),
                                                        )
                                                            : Image.asset(
                                                          "asset/icons/ic_grey_level.png",
                                                          height:
                                                          getVerticalSize(
                                                              22),
                                                          width:
                                                          getHorizontalSize(
                                                              22),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                          getHorizontalSize(15),
                                                        ),
                                                        Text(
                                                          "Level 2",
                                                          style: AppStyle
                                                              .textStyleDMSANS
                                                              .copyWith(
                                                              color: ColorConstant
                                                                  .naturalBlack,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w500,
                                                              fontSize:
                                                              getFontSize(
                                                                  20)),
                                                        ),
                                                      ],
                                                    ),
                                                    kycSelectStepController
                                                        .isVerified ==
                                                        "0"
                                                        ? Icon(
                                                      Icons.lock,
                                                      color: ColorConstant
                                                          .naturalGrey3,
                                                      size:
                                                      getVerticalSize(26),
                                                    ): kycSelectStepController
                                                        .isVerified ==
                                                        "1"
                                                        ?Icon(
                                                      Icons.lock,
                                                      color: ColorConstant
                                                          .naturalGrey3,
                                                      size:
                                                      getVerticalSize(26),
                                                    )
                                                        : kycSelectStepController
                                                        .isVerified ==
                                                        "2"
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
                                                          size:
                                                          getVerticalSize(
                                                              20),
                                                        ),
                                                      ],
                                                    )
                                                        : kycSelectStepController
                                                        .isVerified ==
                                                        "3"
                                                        ? Text(
                                                      "pending",
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
                                                    ): kycSelectStepController
                                                        .isVerified ==
                                                        "4"
                                                        ? Text(
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
                                                    )
                                                        : Icon(
                                                      Icons.lock,
                                                      color: ColorConstant
                                                          .naturalGrey3,
                                                      size:
                                                      getVerticalSize(
                                                          26),
                                                    ),
                                                    /* kycSelectStepController
                                                            .isVerified ==
                                                        "2"
                                                    ? Row(
                                                        children: [
                                                          kycSelectStepController.isVerified=="2"?Text(
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
                                                          ):
                                                          Row(
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
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      )
                                                    : Icon(
                                                        Icons.lock,
                                                        color: ColorConstant
                                                            .primaryLightGreen,
                                                        size: getVerticalSize(30),
                                                      ),*/
                                                  ]),
                                            ),
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
                )))));
  }
}
