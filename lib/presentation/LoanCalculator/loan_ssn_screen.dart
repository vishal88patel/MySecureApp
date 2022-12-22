import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_textField.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../EnterPersonalDetails/nam_pad.dart';
import 'controller/loan_calculator_screen_controller.dart';

class LoanSsnScreen extends StatelessWidget {
  var loanCalculatorController = Get.put(LoanCalculatorScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor,
        body: SingleChildScrollView(
          child: Container(
              height: size.height,
              color: ColorConstant.buttonGreen.withOpacity(0.3),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: getVerticalSize(20)),
                    child: SafeArea(
                      child: Stack(
                        children: [
                          Column( crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          Icons.arrow_back_ios_new_outlined,size: 22,),
                                      ),
                                    ),
                                    Text(
                                      "Give us your Social Security Number",
                                      style: AppStyle.DmSansFont.copyWith(
                                          color: ColorConstant.primaryBlack,
                                          fontWeight: FontWeight.w700,
                                          fontSize: getFontSize(20)),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                          border: Border.all(color: Colors.transparent)),
                                      padding: EdgeInsets.all(10),
                                      child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.transparent,),
                                    ),                      ],
                                ),
                              ),
                              SizedBox(
                                height: getVerticalSize(120),
                              ),


                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                      ),
                                      color:  ColorConstant.primaryWhite
                                  ),

                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        SizedBox(
                                          height: getVerticalSize(120),
                                        ),

                                        SizedBox(
                                          child: Obx(() => AppTextField(
                                            controller: loanCalculatorController
                                                .ssnController,
                                            keyBordType: TextInputType.text,
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(
                                                  9),
                                            ],
                                            readOnly: loanCalculatorController
                                                .isedit.value
                                                ? true
                                                : false,
                                            hintText: 'Social Security Number',
                                            suffixIcon: IconButton(
                                              icon: Icon(Icons.edit,
                                                  color: ColorConstant.grey8F,
                                                  size: getVerticalSize(20)),
                                              onPressed: () {
                                                loanCalculatorController
                                                    .editText();
                                              },
                                            ),
                                          )),
                                        ),
                                        Spacer(),
                                        AppElevatedButton(
                                          buttonName: 'Next',
                                          onPressed: () {
                                            loanCalculatorController.onClickOfSsn();
                                            /* debugPrint('Your code: ${enterPersonalDetailController.dobController.text}');
                                    enterPersonalDetailController.onTapOfNextButton();*/
                                          },
                                        ),
                                        Spacer(),
                                        Column(
                                          children: [
                                            NumPad(
                                              type: 'SNN',
                                              controller: loanCalculatorController.dobController,
                                              delete: () {
                                                HapticFeedback.lightImpact();
                                                if(loanCalculatorController.isedit.value){
                                                  if( loanCalculatorController.dobController.text.isNotEmpty){
                                                    loanCalculatorController.dobController.text = loanCalculatorController.dobController.text
                                                        .substring(0, loanCalculatorController.dobController.text.length - 1);

                                                  }
                                                }

                                              },
                                              // do something with the input numbers
                                              onSubmit: () {
                                                if(loanCalculatorController.isedit.value){
                                                  debugPrint('Your code: ${loanCalculatorController.dobController.text}');
                                                  loanCalculatorController.onClickOfDob();
                                                }

                                              },
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


                          Positioned(right: 10,
                            top: getVerticalSize(60),
                            child:Center(
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                                  child: Image.asset('asset/icons/birthDate_image.png',
                                    height: getVerticalSize(220),),
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ));


  }
}
