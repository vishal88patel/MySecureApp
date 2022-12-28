import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:secure_cash_app/App%20Configurations/color_constants.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_textField.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import 'controller/cc_style_controller.dart';

class CCStyleScreen extends StatelessWidget {
  var ccStyleController = Get.find<CCStyleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.primaryWhite,
        body: SingleChildScrollView(
              child: Container(
                  height: size.height,
                  child: Stack(
                    children: [
                      SafeArea(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getHorizontalSize(20.0),
                          ),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Row(
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
                                              color: ColorConstant
                                                  .backBorder)),
                                      padding: EdgeInsets.all(6),
                                      child: Icon(
                                        Icons
                                            .arrow_back_ios_new_outlined,
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    " ",
                                    style: AppStyle.DmSansFont.copyWith(
                                        color:
                                        ColorConstant.primaryBlack,
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
                                    child: Icon(
                                      Icons.arrow_back_ios_new_outlined,
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: getVerticalSize(10),
                              ),

                              Row(
                                children: [
                                  Text(
                                    "Choose your style",
                                    style: AppStyle.DmSansFont.copyWith(
                                        color: ColorConstant.darkBlue,
                                        fontWeight: FontWeight.w700,
                                        fontSize: getFontSize(22)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: getVerticalSize(24),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Black",
                                    style: AppStyle.DmSansFont.copyWith(
                                        color: ColorConstant.darkBlue,
                                        fontWeight: FontWeight.w700,
                                        fontSize: getFontSize(20)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: getVerticalSize(20),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Get.toNamed(
                                      AppRoutes.ccOrderScreen,arguments: {"color":"black"});
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(16),
                                        color: Colors.black
                                      ),
                                      height: size.width/1.75,
                                      width: size.width,
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: getVerticalSize(30),
                                        ),
                                        Row(
                                          mainAxisAlignment:MainAxisAlignment.end,
                                          children: [
                                            Obx(()=>
                                               Text(
                                                ccStyleController.cashtag.value,
                                                style: AppStyle.DmSansFont.copyWith(
                                                    color: ColorConstant.lightGold,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: getFontSize(17)),
                                              ),
                                            ),
                                            SizedBox(
                                              width: getVerticalSize(16),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: getHorizontalSize(80),),
                                        Padding(
                                          padding: EdgeInsets.only(left: getHorizontalSize(20)),
                                          child: SvgPicture.asset(
                                            "asset/icons/ic_cc_chip.svg",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        SizedBox(height: getHorizontalSize(12),),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: getVerticalSize(30),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "White",
                                    style: AppStyle.DmSansFont.copyWith(
                                        color: ColorConstant.darkBlue,
                                        fontWeight: FontWeight.w700,
                                        fontSize: getFontSize(20)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: getVerticalSize(20),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Get.toNamed(
                                      AppRoutes.ccOrderScreen,arguments: {"color":"white"});
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(16),
                                          color: ColorConstant.cream
                                      ),
                                      height: size.width/1.75,
                                      width: size.width,
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: getVerticalSize(30),
                                        ),
                                        Row(
                                          mainAxisAlignment:MainAxisAlignment.end,
                                          children: [
                                            Obx(()=>
                                                Text(
                                                  ccStyleController.cashtag.value,
                                                  style: AppStyle.DmSansFont.copyWith(
                                                      color: ColorConstant.lightGold,
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: getFontSize(17)),
                                                ),
                                            ),
                                            SizedBox(
                                              width: getVerticalSize(16),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: getHorizontalSize(80),),
                                        Padding(
                                          padding: EdgeInsets.only(left: getHorizontalSize(20)),
                                          child: SvgPicture.asset(
                                            "asset/icons/ic_cc_chip.svg",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        SizedBox(height: getHorizontalSize(12),),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  )))
        );
  }
}

