import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/App%20Configurations/color_constants.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_textField.dart';
import 'package:secure_cash_app/presentation/PersonalDetails/controller/personal_detail_screen_controller.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

class PersonalDetailScreen extends StatelessWidget {
  var personalDetailController = Get.find<PersonalScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor,
        body: Container(
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
                                    "Employment Details",
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

                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SizedBox(
                                        height: getVerticalSize(130),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Enter your Employment Details",
                                              style: AppStyle.DmSansFont.copyWith(
                                                  color: ColorConstant.grey8F,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: getFontSize(18)),
                                            ),
                                            SizedBox(
                                              height: getVerticalSize(21),
                                            ),
                                            /*AppTextField(
                        hintText: 'Employment status ',
                        controller:
                            personalDetailController.employmentNameController),*/

                                            Obx(
                                                  ()=> DropdownButton2(
                                                isExpanded: true,
                                                isDense: true,
                                                hint: Text(
                                                  'Select Employement Status',
                                                  style: AppStyle.DmSansFont.copyWith(
                                                      color: ColorConstant.grey8F,
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: getFontSize(20)),
                                                ),
                                                items: personalDetailController.dropdownTextForStatus.value
                                                    .map((item) =>
                                                    DropdownMenuItem<String>(
                                                      value: item,
                                                      child: Text(
                                                        item,
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ))
                                                    .toList(),
                                                selectedItemBuilder: (BuildContext context) {
                                                  //<-- SEE HERE
                                                  return <String>[
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
                                                      personalDetailController.employmentStatus.value,
                                                      style: AppStyle.DmSansFont.copyWith(
                                                          color: ColorConstant.grey8F,
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: getFontSize(20)),

                                                    );
                                                  }).toList();
                                                },
                                                value:
                                                personalDetailController.employmentStatusDropDownValue,
                                                onChanged: (newValue) {
                                                  personalDetailController
                                                      .setSelected(newValue.toString());
                                                },
                                                buttonHeight: 40,
                                                buttonWidth: size.width,
                                                itemHeight: 40,
                                                dropdownMaxHeight: 350,
                                              ),

                                            ),
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
                                              height: getVerticalSize(21),
                                            ),
                                            Obx(
                                                  ()=> personalDetailController.nameOfBusinessTitle.value?AppTextField(
                                                hintText: 'Name Of Business',
                                                controller: personalDetailController.businessNameController,
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


                                            Obx(
                                                  ()=> DropdownButton2(
                                                isExpanded: true,
                                                isDense: true,
                                                hint: Text(
                                                  'Select Annual Income',
                                                  style: AppStyle.DmSansFont.copyWith(
                                                      color: ColorConstant.grey8F,
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: getFontSize(20)),
                                                ),
                                                items: personalDetailController.dropdownTextForIncome
                                                    .map((item) =>
                                                    DropdownMenuItem<String>(
                                                      value: item,
                                                      child: Text(
                                                        item,
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ))
                                                    .toList(),
                                                selectedItemBuilder: (BuildContext context) {
                                                  //<-- SEE HERE
                                                  return <String>[
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
                                                      personalDetailController.setSelectedAnnualIncome.value,
                                                      style: AppStyle.DmSansFont.copyWith(
                                                          color: ColorConstant.grey8F,
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: getFontSize(20)),

                                                    );
                                                  }).toList();
                                                },
                                                value:
                                                personalDetailController.setSelectedAnnualIncomeDropdown,
                                                onChanged: (newValue) {
                                                  personalDetailController
                                                      .setAnnualIncome(newValue.toString());
                                                },
                                                buttonHeight: 40,
                                                buttonWidth: size.width,
                                                itemHeight: 40,
                                                dropdownMaxHeight: 350,
                                              ),

                                            ),
                                            SizedBox(
                                              height: getVerticalSize(40),
                                            ),



                                            Obx(
                                                  ()=> DropdownButton2(
                                                isExpanded: true,
                                                isDense: true,
                                                hint: Text(
                                                  'Select Gender',
                                                  style: AppStyle.DmSansFont.copyWith(
                                                      color: ColorConstant.grey8F,
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: getFontSize(20)),
                                                ),
                                                items: personalDetailController.dropdownTextForGender
                                                    .map((item) =>
                                                    DropdownMenuItem<String>(
                                                      value: item,
                                                      child: Text(
                                                        item,
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ))
                                                    .toList(),
                                                selectedItemBuilder: (BuildContext context) {
                                                  //<-- SEE HERE
                                                  return <String>[
                                                    'Flight',
                                                    'Car',
                                                    'Train',

                                                  ].map((String value) {
                                                    return Text(
                                                      personalDetailController.setSelectedGender.value,
                                                      style: AppStyle.DmSansFont.copyWith(
                                                          color: ColorConstant.grey8F,
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: getFontSize(20)),

                                                    );
                                                  }).toList();
                                                },
                                                value:
                                                personalDetailController.setSelectedForGender,
                                                onChanged: (newValue) {
                                                  personalDetailController
                                                      .setGender(newValue.toString());
                                                },
                                                buttonHeight: 40,
                                                buttonWidth: size.width,
                                                itemHeight: 40,
                                                dropdownMaxHeight: 350,
                                              ),

                                            ),
                                            SizedBox(
                                              height: getVerticalSize(40),
                                            ),
                                            AppElevatedButton(
                                              buttonName: 'Next',
                                              onPressed: () {
                                                personalDetailController.onClickOfButton();
                                                // Get.toNamed(AppRoutes.dashBoardScreen);
                                              },
                                            ),
                                            SizedBox(
                                              height: getVerticalSize(36),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),


                        Positioned(right: 10,
                          top: getVerticalSize(60),
                          child: Center(
                              child: ClipRRect(
                                borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                                child: Image.asset('asset/icons/employement_image.jpg',
                                  height: getVerticalSize(220),),
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )));
      Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      body: SingleChildScrollView(
          child: Container(
              height: size.height,
              child: Stack(
      children: [
         Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getHorizontalSize(20.0),
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
                          "Employment Details ",
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
                    ),SizedBox(
                      height: getVerticalSize(100),
                    ),
                    SizedBox(
                      height: getVerticalSize(40),
                    ),
                    Text(
                      "Enter your Employment Details",
                      style: AppStyle.DmSansFont.copyWith(
                          color: ColorConstant.grey8F,
                          fontWeight: FontWeight.w400,
                          fontSize: getFontSize(18)),
                    ),
                    SizedBox(
                      height: getVerticalSize(21),
                    ),
                    /*AppTextField(
                        hintText: 'Employment status ',
                        controller:
                            personalDetailController.employmentNameController),*/

                    Obx(
                          ()=> DropdownButton2(
                        isExpanded: true,
                        isDense: true,
                        hint: Text(
                          'Select Employement Status',
                          style: AppStyle.DmSansFont.copyWith(
                              color: ColorConstant.grey8F,
                              fontWeight: FontWeight.w400,
                              fontSize: getFontSize(20)),
                          ),
                        items: personalDetailController.dropdownTextForStatus.value
                            .map((item) =>
                            DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ))
                            .toList(),
                        selectedItemBuilder: (BuildContext context) {
                          //<-- SEE HERE
                          return <String>[
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
                              personalDetailController.employmentStatus.value,
                              style: AppStyle.DmSansFont.copyWith(
                                  color: ColorConstant.grey8F,
                                  fontWeight: FontWeight.w400,
                                  fontSize: getFontSize(20)),

                            );
                          }).toList();
                        },
                        value:
                        personalDetailController.employmentStatusDropDownValue,
                            onChanged: (newValue) {
                              personalDetailController
                                  .setSelected(newValue.toString());
                            },
                        buttonHeight: 40,
                        buttonWidth: size.width,
                        itemHeight: 40,
                        dropdownMaxHeight: 350,
                      ),

                    ),
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
                      height: getVerticalSize(21),
                    ),
                    Obx(
                          ()=> personalDetailController.nameOfBusinessTitle.value?AppTextField(
                        hintText: 'Name Of Business',
                        controller: personalDetailController.businessNameController,
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


                    Obx(
                          ()=> DropdownButton2(
                        isExpanded: true,
                        isDense: true,
                        hint: Text(
                          'Select Annual Income',
                          style: AppStyle.DmSansFont.copyWith(
                              color: ColorConstant.grey8F,
                              fontWeight: FontWeight.w400,
                              fontSize: getFontSize(20)),
                          ),
                        items: personalDetailController.dropdownTextForIncome
                            .map((item) =>
                            DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ))
                            .toList(),
                        selectedItemBuilder: (BuildContext context) {
                          //<-- SEE HERE
                          return <String>[
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
                              personalDetailController.setSelectedAnnualIncome.value,
                              style: AppStyle.DmSansFont.copyWith(
                                  color: ColorConstant.grey8F,
                                  fontWeight: FontWeight.w400,
                                  fontSize: getFontSize(20)),

                            );
                          }).toList();
                        },
                        value:
                        personalDetailController.setSelectedAnnualIncomeDropdown,
                        onChanged: (newValue) {
                          personalDetailController
                              .setAnnualIncome(newValue.toString());
                        },
                        buttonHeight: 40,
                        buttonWidth: size.width,
                        itemHeight: 40,
                        dropdownMaxHeight: 350,
                      ),

                    ),
                    SizedBox(
                      height: getVerticalSize(40),
                    ),



                    Obx(
                          ()=> DropdownButton2(
                        isExpanded: true,
                        isDense: true,
                        hint: Text(
                          'Select Gender',
                          style: AppStyle.DmSansFont.copyWith(
                              color: ColorConstant.grey8F,
                              fontWeight: FontWeight.w400,
                              fontSize: getFontSize(20)),
                          ),
                        items: personalDetailController.dropdownTextForGender
                            .map((item) =>
                            DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ))
                            .toList(),
                        selectedItemBuilder: (BuildContext context) {
                          //<-- SEE HERE
                          return <String>[
                            'Flight',
                            'Car',
                            'Train',

                          ].map((String value) {
                            return Text(
                              personalDetailController.setSelectedGender.value,
                              style: AppStyle.DmSansFont.copyWith(
                                  color: ColorConstant.grey8F,
                                  fontWeight: FontWeight.w400,
                                  fontSize: getFontSize(20)),

                            );
                          }).toList();
                        },
                        value:
                        personalDetailController.setSelectedForGender,
                        onChanged: (newValue) {
                          personalDetailController
                              .setGender(newValue.toString());
                        },
                        buttonHeight: 40,
                        buttonWidth: size.width,
                        itemHeight: 40,
                        dropdownMaxHeight: 350,
                      ),

                    ),
                    SizedBox(
                      height: getVerticalSize(40),
                    ),
                    AppElevatedButton(
                      buttonName: 'Next',
                      onPressed: () {
                        personalDetailController.onClickOfButton();
                        // Get.toNamed(AppRoutes.dashBoardScreen);
                      },
                    ),

                  ],
                ),
              ],
            ),
          ),
        )
      ],
    ))));
  }
}
