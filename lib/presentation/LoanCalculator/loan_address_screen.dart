import 'package:dropdown_button2/dropdown_button2.dart';
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

class LoanAddressScreen extends StatelessWidget {
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
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: ColorConstant.primaryWhite,
                                      ),
                                    ),
                                    Text(
                                      "6/6",
                                      style: AppStyle.textStylePoppinsRegular
                                          .copyWith(
                                          color: ColorConstant.primaryWhite),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: getVerticalSize(57),
                                ),
                                Text(
                                  "Enter your Address",
                                  style: AppStyle.textStylePoppinsRegular.copyWith(
                                      color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w700,
                                      fontSize: getFontSize(32)),
                                ),
                                SizedBox(
                                  height: getVerticalSize(43),
                                ),
                                AppTextField(
                                    hintText: 'Enter your Address 01',
                                    controller:
                                    loanCalculatorController.address01Controller),
                                SizedBox(
                                  height: getVerticalSize(30),
                                ),
                                AppTextField(
                                  hintText: 'Enter your Address 02',
                                  controller:
                                  loanCalculatorController.address02Controller,
                                ),
                                SizedBox(
                                  height: getVerticalSize(30),
                                ),
                                AppTextField(
                                  hintText: 'City',
                                  controller: loanCalculatorController.cityController,
                                ),
                                SizedBox(
                                  height: getVerticalSize(30),
                                ),
                                Obx(
                                      ()=> DropdownButton2(
                                    isExpanded: true,
                                    isDense: true,
                                    hint: Text(
                                      'Select State',
                                      style: AppStyle.textStylePoppinsRegular
                                          .copyWith(color: ColorConstant.primaryAppTextF1,
                                          fontWeight: FontWeight.w400,fontSize: getFontSize(16)),
                                    ),
                                    items: loanCalculatorController.stateList.value
                                        .map((item) =>
                                        DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ))
                                        .toList(),
                                    selectedItemBuilder: (BuildContext context) {
                                      //<-- SEE HERE
                                      return <String>[
                                        'Car',
                                        'Train',
                                        'Bus',
                                        'Flight',
                                        'Car',
                                        'Train',
                                        'Bus',
                                        'Flight',
                                        'Car',
                                        'Train',
                                        'Bus',
                                        'Flight',
                                        'Car',
                                        'Train',
                                        'Bus',
                                        'Flight',
                                        'Car',
                                        'Train',
                                        'Bus',
                                        'Flight',
                                        'Car',
                                        'Train',
                                        'Bus',
                                        'Flight',
                                        'Car',
                                        'Train',
                                        'Bus',
                                        'Flight',
                                        'Car',
                                        'Train',
                                        'Bus',
                                        'Flight',
                                        'Car',
                                        'Train',
                                        'Bus',
                                        'Flight',
                                        'Car',
                                        'Train',
                                        'Bus',
                                        'Flight',
                                        'Car',
                                        'Train',
                                        'Bus',
                                        'Flight',
                                        'Car',
                                        'Train',
                                        'Bus',
                                        'Flight',
                                        'Car',
                                        'Train',
                                        'Bus',
                                        'Flight',
                                        'Car',
                                        'Train',
                                        'Bus',
                                        'Flight',
                                        'Car',
                                        'Train',
                                        'Bus',
                                        'Flight',
                                        'Car',
                                        'Train',
                                        'Bus',
                                        'Flight',
                                        'Car',
                                        'Train',
                                        'Bus',
                                        'Flight',
                                        'Car',
                                        'Train',
                                        'Bus',
                                        'Flight',
                                      ].map((String value) {
                                        return Text(
                                          loanCalculatorController
                                              .selectedState.value,
                                          style: AppStyle.textStylePoppinsRegular
                                              .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                              fontSize: getFontSize(16)),
                                        );
                                      }).toList();
                                    },
                                    value: loanCalculatorController.selectedStateFordropdown,
                                    onChanged: (value) {
                                      // setState(() {
                                      loanCalculatorController
                                          .setSelectedState(value.toString());
                                      // selectedValue = value as String;
                                      // });
                                    },
                                    buttonHeight: 40,
                                    buttonWidth: size.width,
                                    itemHeight: 40,
                                    dropdownMaxHeight: 350,
                                  ),

                                ),
                                SizedBox(
                                  height: getVerticalSize(30),
                                ),
                                AppTextField(
                                  hintText: 'Zip Code',
                                  keyBordType: TextInputType.number,
                                  controller:
                                  loanCalculatorController.zipCodeController,
                                  maxLength: 5,
                                ),
                                Spacer(),
                                AppElevatedButton(
                                  buttonName: 'Next',
                                  radius: 5,
                                  onPressed: () {
                                    // Get.toNamed(AppRoutes.personalDetailScreen);
                                    // Get.toNamed(AppRoutes.personalDetailScreen);
                                    loanCalculatorController.onClickOfAddress();
                                  },
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
            ),
          ),
        ));
  }
}
