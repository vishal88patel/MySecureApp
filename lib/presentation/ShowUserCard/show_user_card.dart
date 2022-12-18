import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_AppBar%20.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_textField.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';

import '../../App Configurations/color_constants.dart';
import '../../utils/HelperFiles/common_utils.dart';
import '../../utils/HelperFiles/math_utils.dart';
import 'controller/show_user_card_screen_controller.dart';

class ShowUserCardScreen extends StatelessWidget {
  var showCaddController = Get.find<ShowUserCardScreenCardController>();
  var cardTypeImage = "".obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getVerticalSize(52),
                ),
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                  child: Row(
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
                        "Card Details",
                        style: AppStyle.DmSansFont.copyWith(
                            color: ColorConstant.primaryBlack,
                            fontWeight: FontWeight.w700,
                            fontSize: getFontSize(20)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.transparent)),
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(40),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: size.width/1.15,
                          child: Image.asset('asset/icons/credit_card.png',),
                        ),
                        Positioned(
                          top: getVerticalSize(20),
                          child: SizedBox(
                            width: size.width,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getHorizontalSize(50),
                                  vertical: getVerticalSize(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text('Balance',
                                              style: AppStyle.DmSansFont
                                                  .copyWith(
                                                  color: ColorConstant
                                                      .primaryWhite,
                                                  fontWeight:
                                                  FontWeight.w500,
                                                  fontSize:
                                                  getFontSize(14))),
                                          Obx(()=>Text(
                                              showCaddController
                                                  .loginModel.value.data!=null?
                                              NumberFormat.currency(name: '\$ ').format(int.parse(showCaddController
                                                  .loginModel.value.data!.balance.toString())):"",
                                              style: AppStyle
                                                  .DmSansFont
                                                  .copyWith(
                                                  color: ColorConstant
                                                      .primaryWhite,
                                                  letterSpacing: 0.55,
                                                  fontWeight:
                                                  FontWeight.w500,
                                                  fontSize:
                                                  getFontSize(20))),
                                          ),
                                        ],
                                      ),
                                      Image.asset(
                                        'asset/icons/Visa_image.png',
                                        height: getVerticalSize(35.34),
                                        width: getHorizontalSize(50.1),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: getVerticalSize(20),
                                  ),
                                  Obx(()=>
                                      Text(
                                          showCaddController
                                              .usercardNumber.value!=""?CommonUtils.FormatCardNumber(
                                              showCaddController.usercardNumber.value.toString()
                                                  .toString()):"",
                                          style: AppStyle.DmSansFont.copyWith(
                                              color: ColorConstant.primaryWhite,
                                              fontWeight: FontWeight.w500,
                                              fontSize: getFontSize(25))),
                                  ),
                                  SizedBox(
                                    height: getVerticalSize(40),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text('Card Holder Name',
                                              style: AppStyle.DmSansFont
                                                  .copyWith(
                                                  color: ColorConstant
                                                      .primaryWhite,
                                                  fontWeight:
                                                  FontWeight.w500,
                                                  fontSize:
                                                  getFontSize(14))),
                                          Obx(()=> Text(
                                              showCaddController
                                                  .cardName
                                                  .toString(),
                                              style: AppStyle.DmSansFont
                                                  .copyWith(
                                                  color: ColorConstant
                                                      .primaryWhite,
                                                  letterSpacing: 0.55,
                                                  fontWeight:
                                                  FontWeight.w500,
                                                  fontSize:
                                                  getFontSize(20))),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: getHorizontalSize(70),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Text('Expiry Date',
                                              style: AppStyle.DmSansFont
                                                  .copyWith(
                                                  color: ColorConstant
                                                      .primaryWhite,
                                                  fontWeight:
                                                  FontWeight.w500,
                                                  fontSize:
                                                  getFontSize(14))),
                                          Obx(()=>Text(
                                              showCaddController
                                                  .usercardDate.value,
                                              style: AppStyle
                                                  .DmSansFont
                                                  .copyWith(
                                                  color: ColorConstant
                                                      .primaryWhite,
                                                  letterSpacing: 0.55,
                                                  fontWeight:
                                                  FontWeight.w500,
                                                  fontSize:
                                                  getFontSize(16))),
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
                    )
                  ],
                ),
                SizedBox(
                  height: getVerticalSize(20),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ColorConstant.primaryWhite,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      )),
                  child: Column(
                    children: [

                    /*  Padding(
                        padding: EdgeInsets.only(
                            right: getHorizontalSize(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                FocusManager.instance.primaryFocus
                                    ?.unfocus();
                                if (showCaddController
                                    .readOnly.value ==
                                    true) {
                                  showCaddController
                                      .readOnly.value = false;
                                } else {
                                  showCaddController
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
                                    child: showCaddController
                                        .readOnly.value
                                        ? Row(
                                      children: [
                                        Icon(
                                          Icons.edit,
                                          size: 14,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width:
                                          getHorizontalSize(
                                              6),
                                        ),
                                        Text(
                                          "Edit",
                                          style: AppStyle
                                              .textStyleDMSANS
                                              .copyWith(
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
                      ),*/
                      SizedBox(height: 12,),
                      Obx(
                            () => Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getHorizontalSize(20)),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text("Cardholder name"),
                              AppTextField(
                                fontSize: 18,
                                controller: showCaddController
                                    .nameController,
                                readOnly: showCaddController
                                    .readOnly.value,
                                onChanged: (value) => {
                                  showCaddController
                                      .cardName.value = value
                                },
                                keyBordType: TextInputType.text,
                                hintText: 'Cardholder Name',

                              ),
                              SizedBox(
                                height: getVerticalSize(20),
                              ),
                              Text("Card number"),
                              AppTextField(
                                fontSize: 18,
                                controller: showCaddController
                                    .cardNumberController,
                                inputFormatters: [
                                  CardFormatter(
                                      sample: '0000 0000 0000 0000',
                                      separator: ' '),
                                ],
                                keyBordType: TextInputType.number,
                                readOnly: showCaddController
                                    .readOnly.value,
                                onChanged: (value) => {
                                  showCaddController
                                      .usercardNumber.value = value
                                },
                                hintText: 'Card Number',
                              ),
                              SizedBox(
                                height: getVerticalSize(20),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:CrossAxisAlignment.start,
                                      children: [
                                        Text("Expiry date"),
                                        AppTextField(
                                          fontSize: 18,
                                          controller: showCaddController
                                              .expDateController,
                                          inputFormatters: [
                                            CardFormatter(
                                                sample: '00/00',
                                                separator: '/')
                                          ],
                                          keyBordType:
                                          TextInputType.datetime,
                                          readOnly: showCaddController
                                              .readOnly.value,
                                          onChanged: (value) => {
                                            showCaddController
                                                .usercardDate
                                                .value = value
                                          },
                                          hintText: 'Expiry Date',
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: getHorizontalSize(10),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:CrossAxisAlignment.start,
                                      children: [
                                        Text("3-digit CVV"),
                                        Obx(
                                          ()=> AppTextField(
                                            fontSize: 18,
                                            controller: showCaddController
                                                .cvvController,
                                            keyBordType:
                                            TextInputType.number,
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(
                                                  3),
                                            ],
                                            readOnly: showCaddController
                                                .readOnly.value,
                                            hintText: '3-digit CVV',
                                            isObsecure: showCaddController
                                                .isCvvHide.value,
                                            suffixIcon: IconButton(
                                              icon: Icon( showCaddController.isCvvHide.value
                                                  ? Icons.visibility_off
                                                  : Icons.visibility
                                                // Icons.visibility_off,
                                              ),
                                              color: ColorConstant.grey8F,
                                              iconSize: getSize(20),
                                              onPressed: () {
                                                print("oooooooooo");
                                                showCaddController.onTapOfPassObsecure(
                                                    showCaddController
                                                        .isCvvHide.value);
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: getVerticalSize(20),
                              ),
                              Text("Bank account number"),
                              AppTextField(
                                fontSize: 18,
                                controller: showCaddController
                                    .bankAccountNumber,
                                readOnly: showCaddController
                                    .readOnly.value,
                                onChanged: (value) => {
                                  showCaddController
                                      .cardName.value = value
                                },
                                keyBordType: TextInputType.text,
                                hintText: 'Bank account number',

                              ),

                              SizedBox(
                                height: getVerticalSize(20),
                              ),
                              Text("Routing number"),
                              AppTextField(
                                fontSize: 18,
                                controller: showCaddController
                                    .routingNumber,
                                readOnly: showCaddController
                                    .readOnly.value,
                                onChanged: (value) => {
                                  showCaddController
                                      .cardName.value = value
                                },
                                keyBordType: TextInputType.text,
                                hintText: 'Routing number',

                              ),


                              SizedBox(
                                height: getVerticalSize(60),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )));
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
