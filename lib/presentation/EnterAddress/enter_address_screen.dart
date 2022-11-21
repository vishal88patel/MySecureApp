import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import 'controller/enter_address_screen_controller.dart';

class EnterAddressDetailScreen extends StatelessWidget {
  var enterAddressController = Get.find<EnterAddressScreenController>();
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;
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
                                  "5/9",
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
                                    enterAddressController.address01Controller),
                            SizedBox(
                              height: getVerticalSize(30),
                            ),
                            AppTextField(
                              hintText: 'Enter your Address 02',
                              controller:
                                  enterAddressController.address02Controller,
                            ),
                            SizedBox(
                              height: getVerticalSize(30),
                            ),
                            AppTextField(
                              hintText: 'City',
                              controller: enterAddressController.cityController,
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
                                items: enterAddressController.stateList.value
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
                                      enterAddressController
                                          .selectedState.value,
                                      style: AppStyle.textStylePoppinsRegular
                                          .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: getFontSize(16)),
                                    );
                                  }).toList();
                                },
                                value: enterAddressController.selectedStateFordropdown,
                                onChanged: (value) {
                                  // setState(() {
                                  enterAddressController
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
                                  enterAddressController.zipCodeController,
                              maxLength: 5,
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Expanded(
                                  child: AppElevatedButton(
                                    buttonName: 'Back',
                                    radius: 5,
                                    onPressed: () {
                                   Get.back();
                                    },
                                  ),
                                ),
                                SizedBox(width: getHorizontalSize(20),),
                                Expanded(
                                  child: AppElevatedButton(
                                    buttonName: 'Next',
                                    radius: 5,
                                    onPressed: () {
                                      // Get.toNamed(AppRoutes.personalDetailScreen);
                                      // Get.toNamed(AppRoutes.personalDetailScreen);
                                      enterAddressController.onTapOfNextButton();
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getVerticalSize(40),
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
