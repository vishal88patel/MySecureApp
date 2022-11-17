import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/presentation/PersonalDetails/controller/personal_detail_screen_controller.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

class PersonalDetailScreen extends StatelessWidget {
  var personalDetailController = Get.find<PersonalScreenController>();

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
                          "7/8",
                          style: AppStyle.textStylePoppinsRegular
                              .copyWith(color: ColorConstant.primaryWhite),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getVerticalSize(57),
                    ),
                    Text(
                      "Enter your Employment Details ",
                      style: AppStyle.textStylePoppinsRegular.copyWith(
                          color: ColorConstant.primaryWhite,
                          fontWeight: FontWeight.w700,
                          fontSize: getFontSize(32)),
                    ),
                    SizedBox(
                      height: getVerticalSize(21),
                    ),
                    /*AppTextField(
                        hintText: 'Employment status ',
                        controller:
                            personalDetailController.employmentNameController),*/
                    Obx(() => DropdownButton(
                          isExpanded: true,
                          isDense: true,
                          onChanged: (newValue) {
                            personalDetailController
                                .setSelected(newValue.toString());
                          },
                          style: new TextStyle(
                            color: Colors.white,
                          ),
                          selectedItemBuilder: (BuildContext context) {
                            //<-- SEE HERE
                            return <String>['Car', 'Train', 'Bus', 'Flight']
                                .map((String value) {
                              return Text(
                                personalDetailController.employmentStatus.value,
                                style: const TextStyle(color: Colors.white),
                              );
                            }).toList();
                          },
                          value:
                              personalDetailController.employmentStatus.value,
                          items: personalDetailController.dropdownTextForStatus
                              .map((selectedType) {
                            return DropdownMenuItem(
                              child: new Text(
                                selectedType,
                                style: TextStyle(color: Colors.black),
                              ),
                              value: selectedType,
                            );
                          }).toList(),
                        )),
                    Obx(
                        ()=> personalDetailController.showJobTitle.value?SizedBox(
                        height: getVerticalSize(30),
                      ):Container(),
                    ),
                    Obx(
                      ()=> personalDetailController.showJobTitle.value?AppTextField(
                        hintText: 'Job Title',
                        controller: personalDetailController.jobTitleController,
                      ):Container(),
                    ),
                    SizedBox(
                      height: getVerticalSize(30),
                    ),
                    // AppTextField(
                    //   hintText: 'Annual income',
                    //   controller:
                    //       personalDetailController.annualIncomeController,
                    //   keyBordType: TextInputType.number,
                    // ),
                    Obx(() => DropdownButton(
                          isExpanded: true,
                          isDense: true,
                          onChanged: (newValue) {
                            personalDetailController
                                .setAnnualIncome(newValue.toString());
                          },
                          style: new TextStyle(
                            color: Colors.white,
                          ),
                          selectedItemBuilder: (BuildContext context) {
                            //<-- SEE HERE
                            return <String>['Car', 'Train', 'Bus', 'Flight','bb','trac']
                                .map((String value) {
                              return Text(
                                personalDetailController.setSelectedAnnualIncome.value,
                                style: const TextStyle(color: Colors.white),
                              );
                            }).toList();
                          },
                          value:
                              personalDetailController.setSelectedAnnualIncome.value,
                          items: personalDetailController.dropdownTextForIncome
                              .map((selectedType) {
                            return DropdownMenuItem(
                              child: new Text(
                                selectedType,
                                style: TextStyle(color: Colors.black),
                              ),
                              value: selectedType,
                            );
                          }).toList(),
                        )),

                    Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: AppElevatedButton(
                            buttonName: 'Back',
                            radius: 5,
                            onPressed: () {
                              Get.back();
                              // Get.toNamed(AppRoutes.dashBoardScreen);
                            },
                          ),
                        ),
                        SizedBox(width: getHorizontalSize(20),),
                        Expanded(
                          child: AppElevatedButton(
                            buttonName: 'Next',
                            radius: 5,
                            onPressed: () {
                              personalDetailController.onClickOfButton();
                              // Get.toNamed(AppRoutes.dashBoardScreen);
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
    ))));
  }
}
