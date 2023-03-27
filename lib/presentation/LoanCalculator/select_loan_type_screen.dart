import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/utils/ConstantsFiles/string_constants.dart';
import 'package:secure_cash_app/utils/HelperFiles/pref_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_AppBar .dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../routes/app_routes.dart';
import '../../theme/app_style.dart';
import '../../utils/HelperFiles/math_utils.dart';
import 'controller/loan_calculator_screen_controller.dart';

class SelectLoanTypeScreen extends StatefulWidget {
  @override
  State<SelectLoanTypeScreen> createState() => _SelectLoanTypeScreenState();
}

class _SelectLoanTypeScreenState extends State<SelectLoanTypeScreen> {
  var loanCalculatorController = Get.find<LoanCalculatorScreenController>();

  // var loanCalculatorController = Get.put(LoanCalculatorScreenController());

  double _volumeValue = 0;

  Future<void> onVolumeChanged(double value) async {
    if (await Vibrate.canVibrate) {
      Vibrate.vibrate();
    }
    ;
    setState(() {
      loanCalculatorController.selectedLoanAmount.value =
          value.round().toString();
      _volumeValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.primaryWhite,
        body: SingleChildScrollView(
          child: Container(
              height: size.height,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getHorizontalSize(26.0),
                    ),
                    child: SafeArea(
                      child: Stack(
                        children: [
                          Column(
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
                                              color: ColorConstant.backBorder)),
                                      padding: EdgeInsets.all(6),
                                      child: Icon(
                                        Icons.arrow_back_ios_new_outlined,
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Loans",
                                    style: AppStyle.DmSansFont.copyWith(
                                        color: ColorConstant.primaryBlack,
                                        fontWeight: FontWeight.w700,
                                        fontSize: getFontSize(22)),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
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
                                height: getVerticalSize(30),
                              ),
                              Text(
                                "Select Loan Type",
                                style: AppStyle.DmSansFont.copyWith(
                                    color: ColorConstant.darkBlue,
                                    fontWeight: FontWeight.w500,
                                    fontSize: getFontSize(20)),
                              ),
                              SizedBox(
                                height: getVerticalSize(30),
                              ),
                              Text(
                                "Select the amount needed and the \nreimbursement period",
                                style: AppStyle.DmSansFont.copyWith(
                                    color: ColorConstant.primaryBlack,
                                    fontWeight: FontWeight.w400,
                                    fontSize: getFontSize(20)),
                              ),
                              SizedBox(
                                height: getVerticalSize(40),
                              ),
                              Text(
                                "Please select loan",
                                style: AppStyle.DmSansFont.copyWith(
                                    color: ColorConstant.grey8F,
                                    fontWeight: FontWeight.w400,
                                    fontSize: getFontSize(18)),
                              ),
                              SizedBox(
                                height: getVerticalSize(10),
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: loanCalculatorController
                                      .loanList.value.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Obx(
                                      () => InkWell(
                                        onTap: () {
                                          loanCalculatorController
                                              .onTapOnLoanTile(
                                                  loanCalculatorController
                                                      .loanList
                                                      .value[index]
                                                      .id,
                                                  loanCalculatorController
                                                      .loanList
                                                      .value[index]
                                                      .name);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [

                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: loanCalculatorController
                                                        .selectedLoanId
                                                        .value ==
                                                        loanCalculatorController
                                                            .loanList
                                                            .value[index]
                                                            .id
                                                            .toString()
                                                        ? ColorConstant
                                                        .primaryLightGreen
                                                        : ColorConstant.greenF3
                                                        .withOpacity(0.5),
                                                    borderRadius:
                                                    BorderRadius.all(
                                                        Radius.circular(10))),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: getHorizontalSize(10),
                                                      right:
                                                      getHorizontalSize(10),
                                                      top: getHorizontalSize(10),
                                                      bottom:
                                                      getHorizontalSize(10)),
                                                  child: Center(
                                                    child: Text(
                                                      loanCalculatorController
                                                          .loanList.value[index].name
                                                          .toString(),
                                                      style: AppStyle.DmSansFont.copyWith(
                                                          color: loanCalculatorController
                                                              .selectedLoanId
                                                              .value
                                                              .toString() ==
                                                              loanCalculatorController
                                                                  .loanList
                                                                  .value[index]
                                                                  .id
                                                                  .toString()
                                                              ? ColorConstant
                                                              .primaryWhite
                                                              : ColorConstant
                                                              .grey8F,
                                                          fontWeight:
                                                          FontWeight.w400,
                                                          fontSize:
                                                          getFontSize(16)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            loanCalculatorController
                                                        .selectedLoanId
                                                        .value ==
                                                    loanCalculatorController
                                                        .loanList
                                                        .value[index]
                                                        .id
                                                        .toString()
                                                ? loanCalculatorController
                                                            .loanList
                                                            .value[index]
                                                            .name !=
                                                        "Business Loan"
                                                    ? Text(
                                                        "500\$ - 5000\$ ",
                                                        style: AppStyle
                                                                .DmSansFont
                                                            .copyWith(
                                                                color: ColorConstant
                                                                    .primaryLightGreen,
                                                                fontSize:
                                                                    getFontSize(
                                                                        18)),
                                                      )
                                                    : Text(
                                                        "5000\$ - 40000\$ ",
                                                        style: AppStyle
                                                                .DmSansFont
                                                            .copyWith(
                                                                color: ColorConstant
                                                                    .primaryLightGreen,
                                                                fontSize:
                                                                    getFontSize(
                                                                        18)),
                                                      )
                                                : Container()
                                          ],
                                        ),
                                      ),
                                    );
                                  }),

                              SizedBox(
                                height: getVerticalSize(150),
                              ),
                              AppElevatedButton(
                                  buttonName: 'Proceed to Loan',
                                  radius: 10,
                                  onPressed: () {
                                    loanCalculatorController
                                        .onClickOfProcessToLoan(); // Get.to(AmountRadialScreen());
                                  }),
                              SizedBox(
                                height: getVerticalSize(20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}
