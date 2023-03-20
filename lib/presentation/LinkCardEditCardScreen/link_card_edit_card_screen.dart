import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_AppBar%20.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_textField.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';

import '../../App Configurations/color_constants.dart';
import '../../utils/HelperFiles/math_utils.dart';
import 'controller/link_card_edit_card_screen_controller.dart';

class LinkCardEditCardScreen extends StatelessWidget {
  var topAddCardConfirmScreenController =
      Get.find<LinkCardEditCardController>();
  var cardTypeImage = "".obs;

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
                                    horizontal: getHorizontalSize(20),vertical: getVerticalSize(20)),
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
                                      "Confirm your card",
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
                                      padding: EdgeInsets.all(6),
                                      child: Icon(
                                        Icons.arrow_back_ios_new_outlined,
                                        color: Colors.transparent,
                                        size: 22,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(left: getHorizontalSize(18)),
                                child: Row(
                                  children: [
                                    Text(
                                      "Fill in the fields below or use camera \nphone to scan card",
                                      style: AppStyle.textStyleDMSANS.copyWith(
                                          color: ColorConstant.primaryBlack,
                                          fontWeight: FontWeight.w400,
                                          fontSize: getFontSize(22)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: getVerticalSize(160)),
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
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: getHorizontalSize(20)),
                                    child: Card(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 0),
                                      color: ColorConstant.naturalGrey2,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Stack(
                                        children: [
                                          Image.asset(
                                              'asset/icons/credit_card.png'),
                                          Positioned(
                                            top: getVerticalSize(10),
                                            child: SizedBox(
                                              width: size.width,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left:
                                                        getHorizontalSize(30),right:getHorizontalSize(50) ,
                                                    ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Obx(
                                                          () => Image.asset(
                                                            checkCardImage(
                                                              topAddCardConfirmScreenController
                                                                  .cardNumber
                                                                  .value,
                                                            ),
                                                            height:
                                                                getVerticalSize(
                                                                    35.34),
                                                            width:
                                                                getHorizontalSize(
                                                                    50.1),
                                                          ),
                                                        ),

                                                        // Image.asset('asset/icons/Visa_image.png',
                                                        //   height: getVerticalSize(13.66),
                                                        //   width: getHorizontalSize(43.54),),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          getVerticalSize(20),
                                                    ),
                                                    Obx(
                                                      () => Text(
                                                          topAddCardConfirmScreenController
                                                              .cardNumber.value
                                                              .toString(),
                                                          style: AppStyle
                                                                  .DmSansFont
                                                              .copyWith(
                                                                  color: ColorConstant
                                                                      .primaryWhite,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      getFontSize(
                                                                          25))),
                                                    ),
                                                    SizedBox(
                                                      height: 50,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                'Card Holder Name',
                                                                style: AppStyle.DmSansFont.copyWith(
                                                                    color: ColorConstant
                                                                        .primaryWhite,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        getFontSize(
                                                                            14))),
                                                            Obx(
                                                              () => Text(
                                                                  topAddCardConfirmScreenController
                                                                      .cardName
                                                                      .value,
                                                                  style: AppStyle.DmSansFont.copyWith(
                                                                      color: ColorConstant
                                                                          .primaryWhite,
                                                                      letterSpacing:
                                                                          0.55,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          getFontSize(
                                                                              20))),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              getHorizontalSize(
                                                                  70),
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text('Expiry Date',
                                                                style: AppStyle.DmSansFont.copyWith(
                                                                    color: ColorConstant
                                                                        .primaryWhite,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        getFontSize(
                                                                            14))),
                                                            Obx(
                                                              () => Text(
                                                                  topAddCardConfirmScreenController
                                                                      .cardDate
                                                                      .value,
                                                                  style: AppStyle.DmSansFont.copyWith(
                                                                      color: ColorConstant
                                                                          .primaryWhite,
                                                                      letterSpacing:
                                                                          0.55,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          getFontSize(
                                                                              20))),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: getVerticalSize(20),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: getHorizontalSize(20)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                            if (topAddCardConfirmScreenController
                                                    .readOnly.value ==
                                                true) {
                                              topAddCardConfirmScreenController
                                                  .readOnly.value = false;
                                            } else {
                                              topAddCardConfirmScreenController
                                                  .readOnly.value = true;
                                            }
                                          },
                                          child: Obx(
                                            () => Container(
                                              height: getHorizontalSize(40),
                                              decoration: BoxDecoration(
                                                color: ColorConstant
                                                    .primaryLightGreen,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: getHorizontalSize(10),
                                                    right:
                                                        getHorizontalSize(10)),
                                                child:
                                                    topAddCardConfirmScreenController
                                                            .readOnly.value
                                                        ? Row(
                                                            children: [
                                                              Icon(
                                                                Icons.edit,
                                                                size: 14,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    getHorizontalSize(
                                                                        6),
                                                              ),
                                                              Text(
                                                                "Edit",
                                                                style: AppStyle.textStyleDMSANS.copyWith(
                                                                    color: ColorConstant
                                                                        .primaryWhite,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        getFontSize(
                                                                            18)),
                                                              ),
                                                            ],
                                                          )
                                                        : Icon(
                                                            Icons.close,
                                                            size: 20,
                                                            color: Colors.white,
                                                          ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Obx(
                                    () => Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: getHorizontalSize(20)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppTextField(
                                            fontSize: 18,
                                            controller:
                                                topAddCardConfirmScreenController
                                                    .nameController,
                                            readOnly:
                                                topAddCardConfirmScreenController
                                                    .readOnly.value,
                                            onChanged: (value) => {
                                              topAddCardConfirmScreenController
                                                  .cardName.value = value
                                            },
                                            keyBordType: TextInputType.text,
                                            hintText: 'Cardholder Name',
                                          ),
                                          SizedBox(
                                            height: getVerticalSize(20),
                                          ),
                                          AppTextField(
                                            fontSize: 18,
                                            controller:
                                                topAddCardConfirmScreenController
                                                    .cardNumberController,
                                            inputFormatters: [
                                              CardFormatter(
                                                  sample: '0000 0000 0000 0000',
                                                  separator: ' '),
                                            ],
                                            keyBordType: TextInputType.number,
                                            readOnly:
                                                topAddCardConfirmScreenController
                                                    .readOnly.value,
                                            onChanged: (value) => {
                                              topAddCardConfirmScreenController
                                                  .cardNumber.value = value
                                            },
                                            hintText: 'Card Number',
                                          ),
                                          SizedBox(
                                            height: getVerticalSize(20),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: AppTextField(
                                                  fontSize: 18,
                                                  controller:
                                                      topAddCardConfirmScreenController
                                                          .expDateController,
                                                  inputFormatters: [
                                                    CardFormatter(
                                                        sample: '00/00',
                                                        separator: '/')
                                                  ],
                                                  keyBordType:
                                                      TextInputType.datetime,
                                                  readOnly:
                                                      topAddCardConfirmScreenController
                                                          .readOnly.value,
                                                  onChanged: (value) => {
                                                    topAddCardConfirmScreenController
                                                        .cardDate.value = value
                                                  },
                                                  hintText: 'Expiry Date',
                                                ),
                                              ),
                                              SizedBox(
                                                width: getHorizontalSize(10),
                                              ),
                                              Expanded(
                                                child: AppTextField(
                                                  fontSize: 18,
                                                  controller:
                                                      topAddCardConfirmScreenController
                                                          .cvvController,
                                                  keyBordType:
                                                      TextInputType.number,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(
                                                        3),
                                                  ],
                                                  readOnly:
                                                      topAddCardConfirmScreenController
                                                          .readOnly.value,
                                                  hintText: '3-digit CVV',
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: getVerticalSize(60),
                                          ),
                                          AppElevatedButton(
                                              buttonName: 'Confirm',
                                              textColor:
                                                  ColorConstant.primaryWhite,
                                              onPressed: () {
                                                topAddCardConfirmScreenController
                                                    .onClickOfAddCardButton(
                                                        context);
                                                /* Get.toNamed(
                                                          AppRoutes.cardLoaderScreen);*/
                                                // Get.toNamed(AppRoutes.topAddCardConfirmScreen);
                                                // Get.to(
                                                //   LoaderScreen("",AppRoutes.creatPasswordScreen),
                                                //   transition: Transition.rightToLeft,
                                                //   duration: Duration(milliseconds: 400),
                                                // );
                                              }),
                                        ],
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

  String checkCardImage(String number) {
    var type = detectCCType(number);

    switch (type) {
      case CreditCardType.visa:
        return "asset/icons/Visa_image.png";
        break;

      case CreditCardType.mastercard:
        return "asset/icons/master_card_back.png";
        break;
      default:
        return "asset/icons/credit_card.png";
        break;
    }
  }
}

class CardFormatter extends TextInputFormatter {
  final String sample;
  final String separator;

  CardFormatter({
    required this.sample,
    required this.separator,
  });

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 0) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > sample.length) return oldValue;
        if (newValue.text.length < sample.length &&
            sample[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text:
                '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}
