import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../LoginScreen/controller/login_screen_controller.dart';
import '../loader_screen.dart';
import 'controller/loan_calculator_screen_controller.dart';

class LoanLnameScreen extends StatelessWidget {
  // var loanCalculatorController = Get.put(LoanCalculatorScreenController());
  var loanCalculatorController = Get.find<LoanCalculatorScreenController>();

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
                                          "2/6",
                                          style: AppStyle.textStylePoppinsRegular
                                              .copyWith(color: ColorConstant.primaryWhite),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: getVerticalSize(57),
                                    ),
                                    Text(
                                      "Give us your \nLast Name",
                                      style: AppStyle.textStylePoppinsRegular.copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w700,
                                          fontSize: getFontSize(32)),
                                    ),
                                    SizedBox(
                                      height: getVerticalSize(5),
                                    ),
                                    Text(
                                      "To apply, we need your last name linked to \nyour app",
                                      style: AppStyle.textStylePoppinsRegular.copyWith(
                                          color: ColorConstant.primaryAppTextF1,
                                          fontWeight: FontWeight.w400,
                                          fontSize: getFontSize(16)),
                                    ),
                                    SizedBox(
                                      height: getVerticalSize(54),
                                    ),
                                    SizedBox(
                                        child: AppTextField(
                                          controller: loanCalculatorController.lastNameController,
                                          keyBordType: TextInputType.text,
                                          hintText: "Last Name",
                                        )),
                                    Spacer(),
                                    AppElevatedButton(
                                        buttonName: 'Next',
                                        radius: 5,
                                        onPressed: () {
                                          loanCalculatorController.onClickOfLname();
                                        }),
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
