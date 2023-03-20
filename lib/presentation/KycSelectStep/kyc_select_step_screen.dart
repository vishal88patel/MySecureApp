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
import '../../Custom Widgets/app_ElevatedButton .dart';
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
                  color: ColorConstant.buttonGreen.withOpacity(0.3),
                  height: size.height,
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
                                          "Identity Verification",
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
                                          child: SvgPicture.asset("asset/icons/ic_notification.svg"),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: getVerticalSize(150),
                                  ),
                                  Expanded(
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
                                            height: getVerticalSize(100),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: getHorizontalSize(20)),
                                            child: Text(
                                              "Select Identity Verification Level",
                                              style: AppStyle.textStyleDMSANS.copyWith(
                                                  color: ColorConstant.primaryBlack,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: getFontSize(22)),
                                            ),
                                          ),

                                          SizedBox(
                                            height: getVerticalSize(20),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              if (kycSelectStepController.isVerified ==
                                                  "0") {

                                                Get.offAllNamed(AppRoutes.kycStep1DataScreen);
                                              }else if(kycSelectStepController.isVerified ==
                                                  "4"){
                                                showCompetedLevel1Dialouge();

                                              }
                                              else if(kycSelectStepController.isVerified ==
                                                  "2"){
                                                showCompetedLevel1Dialouge();
                                              }
                                              else if(kycSelectStepController.isVerified ==
                                                  "1"){
                                                showPendingLevel1Dialouge();
                                              } else if(kycSelectStepController.isVerified ==
                                                  "3"){
                                                showCompetedLevel1Dialouge();
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
                                                  showPendingLevel2Dialouge();
                                                }else if(kycSelectStepController.isVerified ==
                                                    "4"){
                                                  showCompetedLevel2Dialouge();
                                                }else{
                                                  showDialouge();
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
                                                          ]),
                                                    ),
                                                  ),
                                            ),
                                          ),
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
                      ),
                  ],
                )))
      ));
  }

  Future<void> showPendingLevel1Dialouge() async {
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
                              "Your Kyc Level 1 is Pending!!! we will notify you once it approved",
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
  Future<void> showCompetedLevel1Dialouge() async {
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
                              "Your Kyc Level 1 has been Completed",
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
  Future<void> showDialouge() async {
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
                              height: 14,
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .center,
                              children: [
                                SvgPicture.asset(
                                    "asset/icons/ic_lock_pending.svg")
                              ],
                            ),
                            SizedBox(
                              height: 14,
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
                              "Level 2 is locked, to unlock it first complete level 1.",
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
  Future<void> showPendingLevel2Dialouge() async {
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
                              "our Kyc Level 2 is Pending!!! we will notify you once it approved",
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
  Future<void> showCompetedLevel2Dialouge() async {
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
                              "Your Kyc Level 2 has been Completed",
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
