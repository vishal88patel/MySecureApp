import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:secure_cash_app/presentation/EnterPersonalDetails/nam_pad.dart';
import 'package:secure_cash_app/presentation/TopUpCardListScreen/controller/topup_card_list_screen_controller.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../routes/app_routes.dart';
import '../../theme/app_style.dart';
import '../../utils/HelperFiles/math_utils.dart';
import '../../utils/HelperFiles/ui_utils.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';


class TopUpPinScreen extends StatelessWidget {
  var cardListController = Get.find<TopupCardListScreenController>();
  //var bankListController = Get.put(CardListScreenController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                height: size.height,
                child: Stack(
                  children: [
                    Image.asset('asset/icons/background_image.png',
                        fit: BoxFit.cover, width: double.infinity),
                    SafeArea(
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getHorizontalSize(20)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: getVerticalSize(10),
                                    ),
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
                                                        .primaryWhite
                                                        .withOpacity(0.3))),
                                            padding: EdgeInsets.all(6),
                                            child: Icon(
                                                Icons
                                                    .arrow_back_ios_new_outlined,
                                                size: 22,
                                                color:
                                                ColorConstant.primaryWhite),
                                          ),
                                        ),
                                        Obx(()=>
                                            Text(
                                              cardListController.isPin.value==0
                                                  ?"Set Your Pin"
                                                  :"Enter Your Pin",
                                              style: AppStyle.DmSansFont.copyWith(
                                                  color: ColorConstant.primaryWhite,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: getFontSize(20)),
                                            ),
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
                                      height: getVerticalSize(28),
                                    ),
                                    Obx(()=> Text(
                                      cardListController.isPin.value==0
                                          ?"Please Set Your Pin before continuing payment"
                                          :"Please Enter Your Pin before continuing payment",
                                      style: AppStyle.DmSansFont.copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w400,
                                          fontSize: getFontSize(20)),
                                    ),
                                    ),
                                    SizedBox(
                                      height: getVerticalSize(60),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 30),
                                      child: PinCodeTextField(
                                        keyboardType: TextInputType.number,
                                        length: 4,
                                        readOnly: true,
                                        obscureText: true,
                                        animationType: AnimationType.fade,
                                        cursorColor: ColorConstant.primaryWhite,
                                        textStyle: TextStyle(color: ColorConstant.naturalBlack),
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(4),
                                        ],
                                        pinTheme: PinTheme(
                                          shape: PinCodeFieldShape.box,
                                          borderRadius: BorderRadius.circular(12),
                                          fieldHeight: getVerticalSize(70),
                                          fieldWidth: getVerticalSize(70),
                                          activeFillColor: ColorConstant.primaryWhite,
                                          disabledColor: ColorConstant.primaryWhite,
                                          errorBorderColor: Colors.white.withOpacity(0.5),
                                          activeColor: Colors.white.withOpacity(0.5),
                                          selectedColor: Colors.white.withOpacity(0.5),
                                          inactiveColor: Colors.white.withOpacity(0.5),
                                          inactiveFillColor: ColorConstant.primaryWhite,
                                          selectedFillColor: ColorConstant.primaryWhite,),
                                        animationDuration: Duration(milliseconds: 300),
                                        backgroundColor: Colors.transparent,
                                        enableActiveFill: true,
                                        controller: cardListController.pinController,
                                        onCompleted: (v) {
                                          print("Completed");
                                        },
                                        onChanged: (value) {},
                                        beforeTextPaste: (text) {
                                          print("Allowing to paste $text");
                                          return true;
                                        },
                                        appContext: context,
                                      ),),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getHorizontalSize(20)),
                                child: AppElevatedButton(
                                  buttonName: 'Continue',
                                  onPressed: () {
                                    debugPrint(
                                        'Your code: ${cardListController.pinController.text}');
                                    cardListController.onTapOfListTile(context);
                                  },
                                ),
                              ),
                              SizedBox(
                                height: getVerticalSize(20),
                              ),
                              Column(
                                children: [
                                  NumPad(
                                    type: 'OTP4',
                                    controller: cardListController.pinController,
                                    delete: () {
                                      HapticFeedback.lightImpact();

                                      if (cardListController
                                          .pinController.text.isNotEmpty) {
                                        cardListController.pinController.text =
                                            cardListController.pinController.text
                                                .substring(
                                                0,
                                                cardListController
                                                    .pinController
                                                    .text
                                                    .length -
                                                    1);
                                      }
                                    },
                                    // do something with the input numbers
                                    onSubmit: () {
                                      debugPrint(
                                          'Your code: ${cardListController.pinController.text}');
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ))));
  }
}
