import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../EnterPersonalDetails/nam_pad.dart';
import '../LoginScreen/controller/login_screen_controller.dart';
import '../loader_screen.dart';
import 'controller/loan_calculator_screen_controller.dart';

class LoanSsnScreen extends StatelessWidget {
  var loanCalculatorController = Get.put(LoanCalculatorScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.primaryBlack,
        body: SingleChildScrollView(
            child: Container(
                height: size.height,
                child: Stack(
                  children: [
                    MainCutomBackGround(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getHorizontalSize(36.0),
                              vertical: getVerticalSize(26)),
                          child: SafeArea(
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10, bottom: 10),
                                              child: Icon(
                                                Icons.arrow_back,
                                                color: ColorConstant.primaryWhite,
                                              ),
                                            )),
                                        Text(
                                          "5/6",
                                          style: AppStyle.textStylePoppinsRegular
                                              .copyWith(color: ColorConstant.primaryWhite),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: getVerticalSize(57),
                                    ),
                                    Text(
                                      "Give us your \nSSN",
                                      style: AppStyle.textStylePoppinsRegular.copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w700,
                                          fontSize: getFontSize(32)),
                                    ),
                                    SizedBox(
                                      height: getVerticalSize(5),
                                    ),
                                    Text(
                                      "To apply, we need your ssn linked to \nyour app",
                                      style: AppStyle.textStylePoppinsRegular.copyWith(
                                          color: ColorConstant.primaryAppTextF1,
                                          fontWeight: FontWeight.w400,
                                          fontSize: getFontSize(16)),
                                    ),
                                    SizedBox(
                                      height: getVerticalSize(54),
                                    ),
                                    TextFormField(
                                      readOnly: true,
                                      style: TextStyle(color: Colors.white),
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(9),
                                      ],
                                      decoration: InputDecoration(
                                        hintText: 'SNN',
                                        hintStyle: AppStyle.textStylePoppinsRegular
                                            .copyWith(color: ColorConstant.primaryAppTextF1,
                                            fontWeight: FontWeight.w400,fontSize: getFontSize(16)),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: ColorConstant.primaryAppTextF1),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: ColorConstant.primaryAppTextF1),
                                        ),
                                      ),
                                      // var date = parts.sublist(1).join(':').trim(); // date: "'2019:04:01'"
                                      controller: loanCalculatorController.ssnController,
                                    ),
                                    Spacer(),
                                    Column(
                                      children: [
                                        NumPad(
                                          type: 'SNN',
                                          controller: loanCalculatorController.ssnController,
                                          delete: () {
                                            HapticFeedback.lightImpact();

                                            if( loanCalculatorController.ssnController.text.isNotEmpty){
                                              loanCalculatorController.ssnController.text = loanCalculatorController.ssnController.text
                                                  .substring(0, loanCalculatorController.ssnController.text.length - 1);

                                            }
                                          },
                                          // do something with the input numbers
                                          onSubmit: () {
                                            debugPrint('Your code: ${loanCalculatorController.ssnController.text}');
                                            loanCalculatorController.onClickOfSsn();
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: getVerticalSize(36),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ))));
  }
}
