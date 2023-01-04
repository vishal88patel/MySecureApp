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

import 'controller/cc_card_list_controller.dart';


class CCCardListScreen extends StatelessWidget {
  var ccCardListController = Get.find<CCCardListController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorConstant.primaryWhite,
          body: SingleChildScrollView(
                child: Container(
                  height: size.height,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getHorizontalSize(20.0),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: ColorConstant.backBorder)),
                                padding: EdgeInsets.all(6),
                                child: Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  size: 22,
                                ),
                              ),
                            ),
                            Text(
                              "Cash Card List",
                              style: AppStyle.DmSansFont.copyWith(
                                  color: ColorConstant.primaryBlack,
                                  fontWeight: FontWeight.w700,
                                  fontSize: getFontSize(20)),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
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
                          height: getVerticalSize(50),
                        ),
                        Obx(
                                  () => ccCardListController.cashCardModel.value.data != null
                                  ? ListView.builder(
                                  itemCount: ccCardListController
                                      .cashCardModel.value.data!.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                                AppRoutes.ccCardScreen,arguments: {"position":index.toString()});
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(top: getVerticalSize(20)),
                                        child: Stack(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(16),
                                                  color: ccCardListController
                                                      .cashCardModel.value.data![index].color?.toLowerCase().toString()=="black"?Colors.black:ColorConstant.cream,),
                                              height: size.width / 1.75,
                                              width: size.width,
                                            ),
                                            Padding(
                                              padding:
                                              EdgeInsets.all(getHorizontalSize(18)),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: getVerticalSize(26),
                                                  ),
                                                  Obx(
                                                        () => ccCardListController
                                                            .cashCardModel.value.data![index].status!="0"
                                                        ? Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                      children: [
                                                        Text(
                                                          ccCardListController
                                                              .cashCardModel.value.data![index]
                                                              .cardNumber!=""?ccCardListController
                                                              .cashCardModel.value.data![index]
                                                              .cardNumber
                                                              .toString()
                                                              .substring(0, 4):"",
                                                          style: AppStyle.DmSansFont
                                                              .copyWith(
                                                              color:ccCardListController
                                                                  .cashCardModel.value.data![index].color?.toLowerCase().toString()=="black"? ColorConstant
                                                                  .primaryWhite: ColorConstant
                                                                  .naturalBlack,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w700,
                                                              letterSpacing:
                                                              getHorizontalSize(
                                                                  5),
                                                              fontSize:
                                                              getFontSize(
                                                                  20)),
                                                        ),
                                                        Text(
                                                          ccCardListController
                                                              .cashCardModel.value.data![index]
                                                              .cardNumber!=""?ccCardListController
                                                              .cashCardModel.value.data![index].cardNumber
                                                              .toString()
                                                              .substring(4, 8):"",
                                                          style: AppStyle.DmSansFont
                                                              .copyWith(
                                                              color:ccCardListController
                                                                  .cashCardModel.value.data![index].color?.toLowerCase().toString()=="black"? ColorConstant
                                                                  .primaryWhite: ColorConstant
                                                                  .naturalBlack,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w700,
                                                              letterSpacing:
                                                              getHorizontalSize(
                                                                  5),
                                                              fontSize:
                                                              getFontSize(
                                                                  20)),
                                                        ),
                                                        Text(
                                                          ccCardListController
                                                              .cashCardModel.value.data![index]
                                                              .cardNumber!=""? ccCardListController
                                                              .cashCardModel.value.data![index]
                                                              .cardNumber
                                                              .toString()
                                                              .substring(8, 12):"",
                                                          style: AppStyle.DmSansFont
                                                              .copyWith(
                                                              color:ccCardListController
                                                                  .cashCardModel.value.data![index].color?.toLowerCase().toString()=="black"? ColorConstant
                                                                  .primaryWhite: ColorConstant
                                                                  .naturalBlack,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w700,
                                                              letterSpacing:
                                                              getHorizontalSize(
                                                                  5),
                                                              fontSize:
                                                              getFontSize(
                                                                  20)),
                                                        ),
                                                        Text(
                                                          ccCardListController
                                                              .cashCardModel.value.data![index]
                                                              .cardNumber!=""?                     ccCardListController
                                                              .cashCardModel.value.data![index]
                                                              .cardNumber
                                                              .toString()
                                                              .substring(12, 16):"",
                                                          style: AppStyle.DmSansFont
                                                              .copyWith(
                                                              color:ccCardListController
                                                                  .cashCardModel.value.data![index].color?.toLowerCase().toString()=="black"? ColorConstant
                                                                  .primaryWhite: ColorConstant
                                                                  .naturalBlack,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w700,
                                                              letterSpacing:
                                                              getHorizontalSize(
                                                                  5),
                                                              fontSize:
                                                              getFontSize(
                                                                  20)),
                                                        ),
                                                      ],
                                                    )
                                                        : Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                      children: [
                                                        Text(
                                                          "****",
                                                          style: AppStyle.DmSansFont
                                                              .copyWith(
                                                              color:ccCardListController
                                                                  .cashCardModel.value.data![index].color?.toLowerCase().toString()=="black"? ColorConstant
                                                                  .primaryWhite: ColorConstant
                                                                  .naturalBlack,
                                                              letterSpacing:
                                                              getHorizontalSize(
                                                                  5),
                                                              fontWeight:
                                                              FontWeight
                                                                  .w700,
                                                              fontSize:
                                                              getFontSize(
                                                                  20)),
                                                        ),
                                                        Text(
                                                          "****",
                                                          style: AppStyle.DmSansFont
                                                              .copyWith(
                                                              color:ccCardListController
                                                                  .cashCardModel.value.data![index].color?.toLowerCase().toString()=="black"? ColorConstant
                                                                  .primaryWhite: ColorConstant
                                                                  .naturalBlack,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w700,
                                                              letterSpacing:
                                                              getHorizontalSize(
                                                                  5),
                                                              fontSize:
                                                              getFontSize(
                                                                  20)),
                                                        ),
                                                        Text(
                                                          "****",
                                                          style: AppStyle.DmSansFont
                                                              .copyWith(
                                                              color:ccCardListController
                                                                  .cashCardModel.value.data![index].color?.toLowerCase().toString()=="black"? ColorConstant
                                                                  .primaryWhite: ColorConstant
                                                                  .naturalBlack,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w700,
                                                              letterSpacing:
                                                              getHorizontalSize(
                                                                  5),
                                                              fontSize:
                                                              getFontSize(
                                                                  20)),
                                                        ),
                                                        Text(
                                                          ccCardListController
                                                              .cashCardModel.value.data![index]
                                                              .tempCard!=""? ccCardListController
                                                              .cashCardModel.value.data![index]
                                                              .tempCard
                                                              .toString() :"",
                                                          style: AppStyle.DmSansFont
                                                              .copyWith(
                                                              color:ccCardListController
                                                                  .cashCardModel.value.data![index].color?.toLowerCase().toString()=="black"? ColorConstant
                                                                  .primaryWhite: ColorConstant
                                                                  .naturalBlack,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w700,
                                                              letterSpacing:
                                                              getHorizontalSize(
                                                                  5),
                                                              fontSize:
                                                              getFontSize(
                                                                  20)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: getVerticalSize(44),
                                                  ),
                                                  SizedBox(
                                                    height: getVerticalSize(22),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      /*Row(
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Text(
                                                                "CVV",
                                                                style: AppStyle.DmSansFont
                                                                    .copyWith(
                                                                    color:ccCardListController
                                                                        .cashCardModel.value.data![index].color.toString()=="black"? ColorConstant
                                                                        .primaryWhite: ColorConstant
                                                                        .naturalBlack,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                    fontSize:
                                                                    getFontSize(
                                                                        16)),
                                                              ),

                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: getVerticalSize(20),
                                                          ),
                                                          Column(
                                                            children: [
                                                              Text(
                                                                "EXP",
                                                                style: AppStyle.DmSansFont
                                                                    .copyWith(
                                                                    color:ccCardListController
                                                                        .cashCardModel.value.data![index].color.toString()=="black"? ColorConstant
                                                                        .primaryWhite: ColorConstant
                                                                        .naturalBlack,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                    fontSize:
                                                                    getFontSize(
                                                                        16)),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),*/
                                                      SvgPicture.asset(
                                                        "asset/icons/ic_cc_visa.svg",
                                                        fit: BoxFit.fill,
                                                        color:ccCardListController
                                                            .cashCardModel.value.data![index].color?.toLowerCase().toString()=="black"? ColorConstant
                                                            .primaryWhite: ColorConstant
                                                            .naturalBlack,
                                                        height: getVerticalSize(20),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  })
                                  : SizedBox(),
                            ),
                        SizedBox(
                          height: getVerticalSize(40),
                        ),
                        Obx(()=>
                        ccCardListController.cashCardModel.value.data != null?ccCardListController
                              .cashCardModel.value.data!.length==1?Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: getHorizontalSize(20.0),
                            ),
                            child: AppElevatedButton(
                                buttonName: 'Add Free Cash Card',
                                radius: 12,
                                onPressed: () {
                                  Get.toNamed(
                                      AppRoutes.ccIntroScreen);
                                  // Get.to(AmountRadialScreen());
                                }),
                          ):Container():Container(),
                        ),
                      ],
                    ),
                  ),
                ))
          ),
    );
  }
}

