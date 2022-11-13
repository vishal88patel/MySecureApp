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
        body: Stack(
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
                    SizedBox(
                      height: getVerticalSize(30),
                    ),
                    Text(
                      "Purpouse Of Opening Account",
                      style: AppStyle.textStylePoppinsRegular.copyWith(
                          color: ColorConstant.primaryAppTextF1,
                          fontWeight: FontWeight.w400,
                          fontSize: getFontSize(16)),
                    ),

                    SizedBox(
                      height: getVerticalSize(10),
                    ),
                    Row(
                      children: [
                        Obx(
                          () => InkWell(
                            onTap: () {
                              personalDetailController
                                  .onTapOfBorroeOrPErsonalLoan("borrow_loan");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: personalDetailController
                                              .purposeOfOpeningAcc.value ==
                                          "borrow_loan"
                                      ? ColorConstant.primaryWhite
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: ColorConstant.primaryAppTextF1)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getHorizontalSize(16),
                                    vertical: getVerticalSize(4)),
                                child: Text('Borrow Loan',
                                    style: AppStyle.textStylePoppinsRegular
                                        .copyWith(
                                            color: personalDetailController
                                                        .purposeOfOpeningAcc
                                                        .value ==
                                                    "borrow_loan"
                                                ? ColorConstant.primaryBlack
                                                : ColorConstant
                                                    .primaryAppTextF1,
                                            fontWeight: FontWeight.w400,
                                            fontSize: getFontSize(14))),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: getHorizontalSize(11),
                        ),
                        Obx(
                          () => InkWell(
                            onTap: () {
                              personalDetailController
                                  .onTapOfBorroeOrPErsonalLoan(
                                      "using_wallet_service");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: personalDetailController
                                              .purposeOfOpeningAcc.value ==
                                          "using_wallet_service"
                                      ? ColorConstant.primaryWhite
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: ColorConstant.primaryAppTextF1)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getHorizontalSize(16),
                                    vertical: getVerticalSize(4)),
                                child: Text('Using Wallet Service',
                                    style: AppStyle.textStylePoppinsRegular
                                        .copyWith(
                                            color: personalDetailController
                                                        .purposeOfOpeningAcc
                                                        .value ==
                                                    "using_wallet_service"
                                                ? ColorConstant.primaryBlack
                                                : ColorConstant
                                                    .primaryAppTextF1,
                                            fontWeight: FontWeight.w400,
                                            fontSize: getFontSize(14))),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getVerticalSize(22),
                    ),
                    // Wrap(
                    //   children:  payment.map((i) =>
                    //     Row(
                    //       children: [
                    //
                    //         Row(
                    //           children: [
                    //             Container(  width: getHorizontalSize(9),
                    //               height: getVerticalSize(9),
                    //               decoration: BoxDecoration( color: Colors.transparent,
                    //                   borderRadius: BorderRadius.circular(100),
                    //                   border: Border.all(color: ColorConstant.primaryAppTextF1)
                    //               ),),
                    //             Text(i),
                    //           ],
                    //         ),
                    //         // Text('Emily Fortuna'),
                    //         // Text('Filip Hráček'),
                    //       ],
                    //     )).toList(),
                    //
                    //
                    // ),
                    Obx(
                      () => personalDetailController
                                  .purposeOfOpeningAcc.value ==
                              "using_wallet_service" || personalDetailController
                          .purposeOfOpeningAcc.value ==
                          ""
                          ? Container()
                          : Wrap(
                              alignment: WrapAlignment.start,
                              children: personalDetailController.loanList.value
                                  .map((i) => Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: getVerticalSize(8)),
                                        child: InkWell(
                                          onTap: () {
                                            personalDetailController
                                                .onTapOnLoanTile(i.id);
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                width: getHorizontalSize(22),
                                                height: getVerticalSize(22),
                                                decoration: BoxDecoration(
                                                    color: personalDetailController
                                                                .selectedLoanId
                                                                .value ==
                                                            i.id.toString()
                                                        ? ColorConstant
                                                            .primaryWhite
                                                        : Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    border: Border.all(
                                                        color: ColorConstant
                                                            .primaryAppTextF1)),
                                              ),
                                              SizedBox(
                                                width: getHorizontalSize(7),
                                              ),
                                              Text(
                                                i.name.toString(),
                                                style: AppStyle
                                                    .textStylePoppinsRegular
                                                    .copyWith(
                                                        color: ColorConstant
                                                            .primaryAppTextF1,
                                                        fontSize:
                                                            getFontSize(14)),
                                              ),
                                              SizedBox(
                                                width: getHorizontalSize(10),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                    ),
                    Spacer(),
                    AppElevatedButton(
                      buttonName: 'Register',
                      onPressed: () {
                        personalDetailController.onClickOfRegisterButton();
                        // Get.toNamed(AppRoutes.dashBoardScreen);
                      },
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
    ));
  }
}
