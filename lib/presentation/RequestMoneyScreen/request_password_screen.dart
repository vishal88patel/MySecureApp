import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:secure_cash_app/App%20Configurations/color_constants.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_textField.dart';
import 'package:secure_cash_app/presentation/ScanScreen/scan_success_screen.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import '../EnterPersonalDetails/nam_pad.dart';
import 'controller/request_money_screen_controller.dart';

class RequestPasswordScreen extends StatelessWidget {
  var requestMoneyScreenController = Get.find<RequestMoneyScreenController>();

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
                                            requestMoneyScreenController.isPin.value==0
                                                ?"Enter Pin"
                                                :"Confirm Pin",
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
                                      requestMoneyScreenController.isPin.value==0
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
                                          textStyle: TextStyle(color: ColorConstant.primaryWhite),
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
                                          controller: requestMoneyScreenController.passController,
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
                                    /*TextFormField(
                                      readOnly: true,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: ColorConstant.primaryWhite,
                                          fontSize: getFontSize(24)
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'Enter PIN',
                                        hintStyle: AppStyle.DmSansFont.copyWith(
                                            color: ColorConstant.primaryWhite,
                                            fontWeight: FontWeight.w400,
                                            fontSize: getFontSize(24)),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: ColorConstant
                                                  .primaryAppTextF1),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: ColorConstant
                                                  .primaryAppTextF1),
                                        ),
                                      ),
                                      // var date = parts.sublist(1).join(':').trim(); // date: "'2019:04:01'"

                                      controller: scanController.passController,
                                    ),*/
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
                                        'Your code: ${requestMoneyScreenController.passController.text}');
                                    requestMoneyScreenController.onClickOfContinueToPay();
                                  },
                                ),
                              ),
                              SizedBox(
                                height: getVerticalSize(20),
                              ),
                              Column(
                                children: [
                                  NumPad(
                                    type: 'OTP',
                                    controller: requestMoneyScreenController.passController,
                                    delete: () {
                                      HapticFeedback.lightImpact();

                                      if (requestMoneyScreenController
                                          .passController.text.isNotEmpty) {
                                        requestMoneyScreenController.passController.text =
                                            requestMoneyScreenController.passController.text
                                                .substring(
                                                    0,
                                                requestMoneyScreenController
                                                            .passController
                                                            .text
                                                            .length -
                                                        1);
                                      }
                                    },
                                    // do something with the input numbers
                                    onSubmit: () {
                                      debugPrint(
                                          'Your code: ${requestMoneyScreenController.passController.text}');
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
/* @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor,
        body: SingleChildScrollView(
            child: Container(
                height: size.height,
                child: Stack(
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: getVerticalSize(52),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: (){
                                  Get.back();
                                },
                                child: Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: ColorConstant.backBorder)),
                                  padding: EdgeInsets.all(10),
                                  child: Icon(Icons.arrow_back_ios_new_outlined,size: getVerticalSize(18),),
                                ),
                              ),
                              Obx(()=>
                                 Text(
                                  scanController.isPin.value==0
                                      ?"Enter Pin"
                                      :"Confirm Pin",
                                  style: AppStyle.DmSansFont.copyWith(
                                      color: ColorConstant.naturalBlack,
                                      fontWeight: FontWeight.w700,
                                      fontSize: getFontSize(24)),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Colors.transparent)),
                                padding: EdgeInsets.all(10),
                                child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.transparent,),
                              ),                      ],
                          ),
                          SizedBox(
                            height: getVerticalSize(28),
                          ),
                          Obx(()=> Text(
                              scanController.isPin.value==0
                                  ?"Please Set Your Pin before continuing payment"
                                  :"Please Enter Your Pin before continuing payment",
                              style: AppStyle.DmSansFont.copyWith(
                                  color: ColorConstant.naturalGrey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: getFontSize(22)),
                            ),
                          ),
                          SizedBox(
                            height: getVerticalSize(54),
                          ),
                          Obx(
                                () => AppTextField(
                              hintText: 'Pin',
                              controller:
                              scanController.passController,
                              maxLength: 4,
                              isObsecure:
                              scanController.passIsObsecure.value,
                              suffixIcon: IconButton(
                                icon: Icon(scanController
                                    .passIsObsecure.value
                                    ? Icons.visibility_off
                                    : Icons.visibility
                                  // Icons.visibility_off,
                                ),
                                color: ColorConstant.naturalGrey3,
                                iconSize: getSize(24),
                                onPressed: () {
                                  scanController.onTapOfPassObsecure(
                                      scanController.passIsObsecure.value);
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: getVerticalSize(6),
                          ),
                          Text(
                            "Must be 4 characters.",
                            style: AppStyle.DmSansFont.copyWith(
                                color: ColorConstant.naturalGrey,
                                fontWeight: FontWeight.w400,
                                fontSize: getFontSize(18)),
                          ),

                          Spacer(),
                          AppElevatedButton(
                            buttonName: "Continue",
                            textColor: Colors.white,
                            buttonColor: ColorConstant.primaryLightGreen,
                            radius: 16,
                            onPressed: () {
                              scanController.callTransactionApi();

                            },
                          ),
                          SizedBox(
                            height: getVerticalSize(36),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))));



  }*/
