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

        body: SingleChildScrollView(
            child: Container(
                height: size.height,
                color: ColorConstant.buttonGreen.withOpacity(0.3),
                child: Stack(
                  children: [
                    SafeArea(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getHorizontalSize(20)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
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
                                          size: 22,),
                                      ),
                                    ),
                                    Text(
                                      "Id Proof",
                                      style: AppStyle.DmSansFont.copyWith(
                                          color: ColorConstant.primaryBlack,
                                          fontWeight: FontWeight.w700,
                                          fontSize: getFontSize(20)),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              12),
                                          border: Border.all(
                                              color: Colors.transparent)),
                                      padding: EdgeInsets.all(10),
                                      child: Icon(
                                        Icons.arrow_back_ios_new_outlined,
                                        color: Colors.transparent,),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getHorizontalSize(20)),
                                child: Text(
                                  "Select ID Proof",
                                  style: AppStyle.textStyleDMSANS.copyWith(
                                      color: ColorConstant.primaryBlack,
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
                                      Get.toNamed(AppRoutes.instructionScreens,arguments: {
                                        "ISFROM": "0",
                                      });
                                      /*Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const FrontBackLicenceCameraScreen(
                                                  image: 2,
                                                  title:"Scan the front image of\n Driving Licence",
                                                )),
                                      );*/
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
                                      Get.toNamed(AppRoutes.instructionScreens,arguments: {
                                        "ISFROM": "1",
                                      });

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
