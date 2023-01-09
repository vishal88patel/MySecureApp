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

import 'controller/cc_order_controller.dart';


class CCOrderScreen extends StatelessWidget {
  var ccOrderController = Get.find<CCOrderController>();

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
                            children: [  SizedBox(height: 26,),
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
                                height: getVerticalSize(30),
                              ),
                              GestureDetector(
                                onTap: (){
                                  /*Get.toNamed(
                                      AppRoutes.ccStyleScreen);*/
                                },
                                child: Stack(
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: size.width/4,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset('asset/icons/img_ring.png',
                                                fit: BoxFit.cover,width: size.width/1.25),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Obx(()=>
                                       Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(16),
                                          color: ccOrderController.color.value=="black"?Colors.black:ColorConstant.cream
                                        ),
                                        height: size.width/1.75,
                                        width: size.width,
                                      ),
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
                                                  ccOrderController.cashtag.value,
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
                                height: getVerticalSize(50),
                              ),
                              Row(
                                children: [
                                  Obx(
                                  ()=> Text(
                                    ccOrderController.color.value=="black"?"Black":"White",
                                      style: AppStyle.DmSansFont.copyWith(
                                          color: ColorConstant.darkBlue,
                                          fontWeight: FontWeight.w700,
                                          fontSize: getFontSize(20)),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: getVerticalSize(16),
                              ),
                              Row(
                                children: [
                                  Container(
                                    width:size.width/1.2,
                                    child: Text(
                                      "Classic and Iconic. The Original. Make it yours with a custom drawing or stamp.",
                                      style: AppStyle.DmSansFont.copyWith(
                                          color: ColorConstant.naturalGrey3,
                                          fontWeight: FontWeight.w500,
                                          fontSize: getFontSize(20)),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              AppElevatedButton(
                                  buttonName: 'Order Card',
                                  radius: 12,
                                  onPressed: () {
                                    Get.toNamed(
                                        AppRoutes.ccAddressScreen,arguments: {"color":ccOrderController.color.toString()});
                                    // Get.to(AmountRadialScreen());
                                  }),
                              SizedBox(
                                height: getVerticalSize(36),
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

