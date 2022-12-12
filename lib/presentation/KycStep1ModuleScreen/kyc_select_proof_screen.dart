import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:secure_cash_app/App%20Configurations/image_constants.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_AppBar%20.dart';
import 'package:secure_cash_app/presentation/widget/select_mode_widget.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';

import '../../App Configurations/color_constants.dart';
import '../../utils/ConstantsFiles/string_constants.dart';
import '../../utils/HelperFiles/math_utils.dart';
import '../../utils/HelperFiles/pref_utils.dart';
import '../KycSelectStep/controller/kyc_select_step_screen_controller.dart';
import 'front_back_licence_screen.dart';
import 'front_passport_screen.dart';

class KycSelectProofScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // PrefUtils.setString(StringConstants.IS_KYC_DONE,"1");
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
                        clipBehavior: Clip.none,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppAppBar(
                                title: "ID Proof",
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
                                  "Select ID Proof",
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
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const FrontBackLicenceCameraScreen(
                                                  image: 2,
                                                  title:"Scan the front image of\n Driving Licence",
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
                                                  SvgPicture.asset(
                                                    "asset/icons/ic_licence_pass.svg",
                                                    fit: BoxFit.fill,
                                                    height: getVerticalSize(24),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        getHorizontalSize(15),
                                                  ),
                                                  Text(
                                                    "Driving Licence/State Id",
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
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                color:
                                                    ColorConstant.naturalGrey,
                                                size: getVerticalSize(30),
                                              )
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
                                            builder: (context) =>
                                                FrontPassportCameraScreen(
                                                  title: 'Passport',
                                                  image: 4,
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
                                                  SvgPicture.asset(
                                                    "asset/icons/ic_licence_pass.svg",
                                                    fit: BoxFit.fill,
                                                    height: getVerticalSize(24),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        getHorizontalSize(15),
                                                  ),
                                                  Text(
                                                    "Passport",
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
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                color:
                                                    ColorConstant.naturalGrey,
                                                size: getVerticalSize(30),
                                              )
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
