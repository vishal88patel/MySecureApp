import 'package:flutter/cupertino.dart';
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

import '../profileScreen/widget/profile_op_widget.dart';
import 'controller/cc_card_controller.dart';

class CCCardScreen extends StatelessWidget {
  var ccCardController = Get.find<CCCardController>();

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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                  "Cash Card",
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
                            GestureDetector(
                              onTap: () {
                                /*Get.toNamed(
                                      AppRoutes.ccStyleScreen);*/
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                      color:ccCardController
                                          .color.value.toLowerCase().toString()=="black"? Colors.black: ColorConstant
                                          .cream,),
                                    height: size.width / 1.75,
                                    width: size.width,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.all(getHorizontalSize(18)),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                ccCardController
                                                        .showCard.value =
                                                    !ccCardController
                                                        .showCard.value;
                                              },
                                              child: Obx(
                                                () => ccCardController
                                                            .status.value !=
                                                        "0"
                                                    ? ccCardController
                                                            .showCard.value
                                                        ? SvgPicture.asset(
                                                            "asset/icons/ic_open_eye.svg",
                                                            fit: BoxFit.fill,
                                                            height:
                                                                getVerticalSize(
                                                                    24),
                                                          )
                                                        : SvgPicture.asset(
                                                            "asset/icons/ic_close_eye.svg",
                                                            fit: BoxFit.fill,
                                                            height:
                                                                getVerticalSize(
                                                                    24),
                                                          )
                                                    : Container(),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: getVerticalSize(26),
                                        ),
                                        Obx(
                                          () =>
                                          ccCardController.status.value !=
                                                      "0"
                                                  ? ccCardController.showCard.value?Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Text(
                                                          ccCardController
                                                                      .cardNumber
                                                                      .value !=
                                                                  ""
                                                              ? ccCardController
                                                                  .cardNumber
                                                                  .value
                                                                  .toString()
                                                                  .substring(
                                                                      0, 4)
                                                              : "",
                                                          style: AppStyle.DmSansFont.copyWith(
                                                              color:ccCardController
                                                                  .color.value.toLowerCase().toString()=="black"? ColorConstant
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
                                                          ccCardController
                                                                      .cardNumber
                                                                      .value !=
                                                                  ""
                                                              ? ccCardController
                                                                  .cardNumber
                                                                  .value
                                                                  .toString()
                                                                  .substring(
                                                                      4, 8)
                                                              : "",
                                                          style: AppStyle.DmSansFont.copyWith(
                                                              color:ccCardController
                                                                  .color.value.toLowerCase().toString()=="black"? ColorConstant
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
                                                          ccCardController
                                                                      .cardNumber
                                                                      .value !=
                                                                  ""
                                                              ? ccCardController
                                                                  .cardNumber
                                                                  .value
                                                                  .toString()
                                                                  .substring(
                                                                      8, 12)
                                                              : "",
                                                          style: AppStyle.DmSansFont.copyWith(
                                                              color:ccCardController
                                                                  .color.value.toLowerCase().toString()=="black"? ColorConstant
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
                                                          ccCardController
                                                                      .cardNumber
                                                                      .value !=
                                                                  ""
                                                              ? ccCardController
                                                                  .cardNumber
                                                                  .value
                                                                  .toString()
                                                                  .substring(
                                                                      12, 16)
                                                              : "",
                                                          style: AppStyle.DmSansFont.copyWith(
                                                              color:ccCardController
                                                                  .color.value.toLowerCase().toString()=="black"? ColorConstant
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
                                                    ):Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceAround,
                                            children: [
                                              Text(
                                                "****",
                                                style: AppStyle.DmSansFont.copyWith(
                                                    color:ccCardController
                                                        .color.value.toLowerCase().toString()=="black"? ColorConstant
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
                                                style: AppStyle.DmSansFont.copyWith(
                                                    color:ccCardController
                                                        .color.value.toLowerCase().toString()=="black"? ColorConstant
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
                                                style: AppStyle.DmSansFont.copyWith(
                                                    color:ccCardController
                                                        .color.value.toLowerCase().toString()=="black"? ColorConstant
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
                                                ccCardController
                                                    .cardNumber
                                                    .value !=
                                                    ""
                                                    ? ccCardController
                                                    .cardNumber
                                                    .value
                                                    .toString()
                                                    .substring(
                                                    12, 16)
                                                    : "",
                                                style: AppStyle.DmSansFont.copyWith(
                                                    color:ccCardController
                                                        .color.value.toLowerCase().toString()=="black"? ColorConstant
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
                                                          style: AppStyle.DmSansFont.copyWith(
                                                              color:ccCardController
                                                                  .color.value.toLowerCase().toString()=="black"? ColorConstant
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
                                                          style: AppStyle.DmSansFont.copyWith(
                                                              color:ccCardController
                                                                  .color.value.toLowerCase().toString()=="black"? ColorConstant
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
                                                          style: AppStyle.DmSansFont.copyWith(
                                                              color:ccCardController
                                                                  .color.value.toLowerCase().toString()=="black"? ColorConstant
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
                                                          ccCardController
                                                                      .tempNumber
                                                                      .value !=
                                                                  ""
                                                              ? ccCardController
                                                                  .tempNumber
                                                                  .value
                                                                  .toString()
                                                              : "",
                                                          style: AppStyle.DmSansFont.copyWith(
                                                              color:ccCardController
                                                                  .color.value.toLowerCase().toString()=="black"? ColorConstant
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
                                          height: getVerticalSize(36),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      "CVV",
                                                      style: AppStyle.DmSansFont
                                                          .copyWith(
                                                          color:ccCardController
                                                              .color.value.toLowerCase().toString()=="black"? ColorConstant
                                                              .primaryWhite: ColorConstant
                                                              .naturalBlack,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize:
                                                                  getFontSize(
                                                                      16)),
                                                    ),
                                                    Obx(
                                                      () => ccCardController
                                                              .showCard.value
                                                          ? Text(
                                                              ccCardController
                                                                  .cardCvv
                                                                  .value,
                                                              style: AppStyle.DmSansFont.copyWith(
                                                                  color:ccCardController
                                                                      .color.value.toLowerCase().toString()=="black"? ColorConstant
                                                                      .primaryWhite: ColorConstant
                                                                      .naturalBlack,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      getFontSize(
                                                                          16)),
                                                            )
                                                          : Text(
                                                              "***",
                                                              style: AppStyle.DmSansFont.copyWith(
                                                                  color:ccCardController
                                                                      .color.value.toLowerCase().toString()=="black"? ColorConstant
                                                                      .primaryWhite: ColorConstant
                                                                      .naturalBlack,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      getFontSize(
                                                                          18)),
                                                            ),
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
                                                          color:ccCardController
                                                              .color.value.toLowerCase().toString()=="black"? ColorConstant
                                                              .primaryWhite: ColorConstant
                                                              .naturalBlack,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize:
                                                                  getFontSize(
                                                                      16)),
                                                    ),
                                                    Obx(
                                                      () =>
                                                          ccCardController
                                                                  .showCard
                                                                  .value
                                                              ? Text(
                                                                  ccCardController
                                                                              .cardExpMonth
                                                                              .value !=
                                                                          ""
                                                                      ? ccCardController
                                                                              .cardExpMonth
                                                                              .value +
                                                                          "/" +
                                                                          ccCardController
                                                                              .cardExpYear
                                                                              .value
                                                                              .substring(2, 4)
                                                                      : "",
                                                                  style: AppStyle.DmSansFont.copyWith(
                                                                      color:ccCardController
                                                                          .color.value.toLowerCase().toString()=="black"? ColorConstant
                                                                          .primaryWhite: ColorConstant
                                                                          .naturalBlack,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          getFontSize(
                                                                              16)),
                                                                )
                                                              : Text(
                                                                  "**/**",
                                                                  style: AppStyle.DmSansFont.copyWith(
                                                                      color:ccCardController
                                                                          .color.value.toLowerCase().toString()=="black"? ColorConstant
                                                                          .primaryWhite: ColorConstant
                                                                          .naturalBlack,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          getFontSize(
                                                                              18)),
                                                                ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SvgPicture.asset(
                                              "asset/icons/ic_cc_visa.svg",
                                              fit: BoxFit.fill,
                                              color:ccCardController
                                                  .color.value.toLowerCase().toString()=="black"? ColorConstant
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
                            SizedBox(
                              height: getVerticalSize(36),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: ColorConstant.primaryAppTextF1,
                              ),
                              height: getHorizontalSize(90),
                              width: size.width,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: getHorizontalSize(12),
                                    right: getHorizontalSize(12)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          "asset/icons/ic_cc_mail.svg",
                                          height: getVerticalSize(50),
                                        ),
                                        SizedBox(
                                          width: getVerticalSize(20),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Obx(
                                              () => Text(
                                                ccCardController
                                                    .card_status.value
                                                    .toString(),
                                                style: AppStyle.DmSansFont
                                                    .copyWith(
                                                        color: ColorConstant
                                                            .primaryBlack,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            getFontSize(20)),
                                              ),
                                            ),
                                            Obx(
                                              () => Text(
                                                ccCardController.time.value !=
                                                        ""
                                                    ? ccCardController.getTime(
                                                        DateTime.parse(
                                                            ccCardController
                                                                .time.value))
                                                    : ccCardController
                                                        .time.value,
                                                style: AppStyle.DmSansFont
                                                    .copyWith(
                                                        color: ColorConstant
                                                            .naturalGrey4,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            getFontSize(18)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Obx(
                                      () => ccCardController.status == "1"
                                          ? Container(
                                              width: size.width / 3.5,
                                              height: getVerticalSize(50),
                                              child: AppElevatedButton(
                                                  buttonName: 'Activated',
                                                  radius: 16,
                                                  onPressed: () {
                                                    // Get.to(AmountRadialScreen());
                                                  }),
                                            )
                                          : ccCardController.status == "2"
                                              ? Container(
                                                  width: size.width / 3.5,
                                                  height: getVerticalSize(50),
                                                  child: AppElevatedButton(
                                                      buttonName: 'Pending',
                                                      radius: 16,
                                                      onPressed: () {
                                                        // Get.to(AmountRadialScreen());
                                                      }),
                                                )
                                              : Container(
                                                  width: size.width / 3.5,
                                                  height: getVerticalSize(50),
                                                  child: AppElevatedButton(
                                                      buttonName: 'Activate',
                                                      radius: 16,
                                                      onPressed: () {
                                                        Get.toNamed(
                                                            AppRoutes
                                                                .ccCardDetailScreen,
                                                            arguments: {
                                                              "id": ccCardController
                                                                  .cashcardId
                                                                  .toString()
                                                            });
                                                        // Get.to(AmountRadialScreen());
                                                      }),
                                                ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: getVerticalSize(16),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: getVerticalSize(12)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "asset/icons/ic_cc_lock.svg",
                                        fit: BoxFit.fill,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: getHorizontalSize(16)),
                                        child: Text(
                                          "Lock Card",
                                          style: AppStyle.textStyleDMSANS
                                              .copyWith(
                                                  color: ColorConstant
                                                      .naturalBlack,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: getFontSize(18)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Obx(
                                    () => Transform.scale(
                                      scale: 0.9,
                                      child: CupertinoSwitch(
                                        value: ccCardController.state.value,
                                        onChanged: (value) {
                                          ccCardController.state.value = value;
                                          ccCardController
                                              .UpdateCashCardLockApi();
                                        },
                                        thumbColor: CupertinoColors.white,
                                        activeColor:
                                            ColorConstant.primaryLightGreen,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: getVerticalSize(18)),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.ccPinScreen,
                                      arguments: {
                                        "pin": ccCardController.pin.toString(),
                                        "id": ccCardController.cashcardId
                                            .toString()
                                      });
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          "asset/icons/ic_nine_dot.svg",
                                          fit: BoxFit.fill,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: getHorizontalSize(16)),
                                          child: Text(
                                            "Change PIN",
                                            style: AppStyle.textStyleDMSANS
                                                .copyWith(
                                                    color: ColorConstant
                                                        .naturalBlack,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: getFontSize(18)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        right: getHorizontalSize(10),
                                      ),
                                      child: SvgPicture.asset(
                                        "asset/icons/ic_right_arrow.svg",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: getVerticalSize(18)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "asset/icons/ic_que.svg",
                                        fit: BoxFit.fill,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: getHorizontalSize(16)),
                                        child: Text(
                                          "Cash Card Support",
                                          style: AppStyle.textStyleDMSANS
                                              .copyWith(
                                                  color: ColorConstant
                                                      .naturalBlack,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: getFontSize(18)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: getHorizontalSize(10),
                                    ),
                                    child: SvgPicture.asset(
                                      "asset/icons/ic_right_arrow.svg",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            SizedBox(
                              height: getVerticalSize(36),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ))));
  }
}
