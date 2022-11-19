import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../../theme/app_style.dart';
import 'controller/my_linked_bank_list_screen_controller.dart';

class MyLinkedBankListScreen extends StatelessWidget {
  var bankListController = Get.put(MyLinkedBankListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        MainCutomBackGround(
            child: Padding(
          padding: EdgeInsets.only(
              left: getHorizontalSize(20.0),
              right: getHorizontalSize(20.0),
              top: getVerticalSize(26)),
          child: SafeArea(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.close,
                              color: ColorConstant.primaryWhite,
                            )),
                        SizedBox(
                          width: 12,
                        ),
                        Text("Linked Bank",
                            style: AppStyle.textStylePoppinsRegular.copyWith(
                                color: ColorConstant.primaryWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: getFontSize(18))),
                        // InkWell(
                        //   onTap: () {
                        //     Get.toNamed(AppRoutes.accountDetailListScreen);
                        //   },
                        //   child: Image.asset(
                        //     'asset/icons/notification_icon.png',
                        //     height: getVerticalSize(20),
                        //     width: getHorizontalSize(16),
                        //   ),
                        // )
                      ],
                    ),
                    SizedBox(
                      height: getVerticalSize(25),
                    ),
                    Text("Accounts",
                        style: AppStyle.textStylePoppinsRegular.copyWith(
                            color: ColorConstant.primaryWhite,
                            fontWeight: FontWeight.w600,
                            fontSize: getFontSize(18))),
                    SizedBox(
                      height: getVerticalSize(25),
                    ),
                    Obx(
                      () => bankListController.getLinkedBankModel.value.data !=
                              null
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: bankListController.getLinkedBankModel
                                          .value.data!.length >
                                      1
                                  ? 1
                                  : bankListController
                                      .getLinkedBankModel.value.data!.length,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: getVerticalSize(6.5)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: ColorConstant.blue26,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      children: [
                                        bankListController
                                                    .getLinkedBankModel
                                                    .value
                                                    .data![index]
                                                    .bankImage
                                                    .toString()
                                                    .substring(bankListController
                                                            .getLinkedBankModel
                                                            .value
                                                            .data![index]
                                                            .bankImage
                                                            .toString()
                                                            .length -
                                                        3)
                                                    .toLowerCase() ==
                                                "svg"
                                            ? Container(
                                                padding: EdgeInsets.all(8),
                                                width: 100,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                    color: ColorConstant.blue26,
                                                    border: Border.all(
                                                        color: ColorConstant
                                                            .blueFF),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: SvgPicture.network(
                                                  bankListController
                                                      .getLinkedBankModel
                                                      .value
                                                      .data![index]
                                                      .bankImage
                                                      .toString(),
                                                  fit: BoxFit.contain,
                                                ),
                                              )
                                            : Container(
                                                padding: EdgeInsets.all(8),
                                                width: 100,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                    color: ColorConstant.blue26,
                                                    border: Border.all(
                                                        color: ColorConstant
                                                            .blueFF),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Image.network(
                                                  bankListController
                                                      .getLinkedBankModel
                                                      .value
                                                      .data![index]
                                                      .bankImage
                                                      .toString(),
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    bankListController
                                                            .getLinkedBankModel
                                                            .value
                                                            .data![index]
                                                            .bankName
                                                            .toString() +
                                                        "   " +
                                                        Random()
                                                            .nextInt(10000)
                                                            .toString(),
                                                    style: AppStyle
                                                        .textStylePoppinsRegular
                                                        .copyWith(
                                                            color: ColorConstant
                                                                .skyE8
                                                                .withOpacity(
                                                                    0.5),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize:
                                                                getFontSize(
                                                                    22))),
                                                SizedBox(
                                                  width: 70,
                                                ),
                                                Text(
                                                    "\$ " +
                                                        bankListController
                                                            .getLinkedBankModel
                                                            .value
                                                            .data![index]
                                                            .accountBalance
                                                            .toString(),
                                                    style: AppStyle
                                                        .textStylePoppinsRegular
                                                        .copyWith(
                                                            color: ColorConstant
                                                                .skyE8,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize:
                                                                getFontSize(
                                                                    20))),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            Text(
                                                bankListController
                                                    .getLinkedBankModel
                                                    .value
                                                    .data![index]
                                                    .accountNumber
                                                    .toString(),
                                                style: AppStyle
                                                    .textStylePoppinsRegular
                                                    .copyWith(
                                                        color: ColorConstant
                                                            .skyE8
                                                            .withOpacity(0.5),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize:
                                                            getFontSize(20))),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              })
                          : Container(),
                    ),
                    InkWell(
                      onTap: () {
                        bankListController.showBankInfoBottomsheet();
                      },
                      child: Container(
                        height: 100,
                        width: size.width,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: getVerticalSize(6.5)),
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorConstant.primaryAppTextF1
                                    .withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
                                        color: ColorConstant.primaryAppTextF1),
                                    child: Icon(Icons.add)),
                                SizedBox(
                                  width: 12,
                                ),
                                Text("Link Bank",
                                    style: AppStyle.textStylePoppinsRegular
                                        .copyWith(
                                            color: ColorConstant.primaryWhite,
                                            fontWeight: FontWeight.w600,
                                            fontSize: getFontSize(18))),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: size.width,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: getVerticalSize(6.5)),
                        child: Container(
                          decoration: BoxDecoration(
                              color: ColorConstant.primaryAppTextF1
                                  .withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 12,
                              ),
                              Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      color: ColorConstant.primaryAppTextF1),
                                  child: Icon(Icons.add)),
                              SizedBox(
                                width: 12,
                              ),
                              Text("Link Credit Card",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w600,
                                          fontSize: getFontSize(18))),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )),
      ],
    ));
  }
}
