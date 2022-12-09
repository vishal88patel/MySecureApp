import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:secureapp/App%20Configurations/color_constants.dart';
import 'package:secureapp/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secureapp/Custom%20Widgets/app_textField.dart';
import 'package:secureapp/theme/app_style.dart';
import 'package:secureapp/utils/HelperFiles/math_utils.dart';

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
        backgroundColor: ColorConstant.backgroundColor,
        body: SingleChildScrollView(
            child: Stack(
              children: [
                SafeArea(
                  child: Stack(
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: getVerticalSize(10),
                            ),
                            Row(
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
                                  "Enter your Address",
                                  style: AppStyle.DmSansFont.copyWith(
                                      color: ColorConstant.darkBlue,
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
                            SizedBox(
                              height: getVerticalSize(57),
                            ),
                            Center(
                              child: SvgPicture.asset(
                                "asset/icons/splash_image.svg",

                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              height: getVerticalSize(40),
                            ),

                            SizedBox(
                              height: getVerticalSize(5),
                            ),
                            Text(
                              "Your unique name for getting paid by anyone",
                              style: AppStyle.DmSansFont.copyWith(
                                  color: ColorConstant.grey8F,
                                  fontWeight: FontWeight.w400,
                                  fontSize: getFontSize(18)),
                            ),

                            SizedBox(
                              height: getVerticalSize(30),
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
                                  style: AppStyle.DmSansFont.copyWith(
                                      color: ColorConstant.grey8F,
                                      fontWeight: FontWeight.w400,
                                      fontSize: getFontSize(18)),
                                ),
                                items: enterAddressController.stateList.value
                                    .map((item) =>
                                    DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 18,
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
                                      style: AppStyle.DmSansFont.copyWith(
                                          color:  ColorConstant.grey8F,
                                          fontWeight: FontWeight.w400,
                                          fontSize: getFontSize(22)),
                                    );
                                  }).toList();
                                },underline: Divider(color: ColorConstant.grey8F,),
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
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(5),
                              ],
                            ),
                            SizedBox(
                              height: getVerticalSize(54),
                            ),
                            AppElevatedButton(
                              buttonName: 'Next',
                              onPressed: () {

                                enterAddressController.onTapOfNextButton();
                              },
                            ),

                            SizedBox(
                              height: getVerticalSize(36),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));




  }
}
