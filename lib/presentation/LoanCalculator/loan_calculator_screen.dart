import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../Custom Widgets/dash_widget.dart';
import 'controller/loan_calculator_screen_controller.dart';

class LoanCalculatorScreen extends StatelessWidget {
  var loanCalculatorController = Get.put(LoanCalculatorScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        MainCutomBackGround(
            child: Padding(
          padding: EdgeInsets.only(
              left: getHorizontalSize(20.0),
              right: getHorizontalSize(20.0),
              top:getVerticalSize(26)),
          child: SafeArea(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: ColorConstant.primaryWhite,
                        ),
                        InkWell(
                          // onTap: (){ Get.toNamed(AppRoutes.cardDetailScreen);
                          // },
                          child: Image.asset(
                            'asset/icons/notification_icon.png',
                            height: getVerticalSize(20),
                            width: getHorizontalSize(16),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: getVerticalSize(16),
                    ),
                    Text(
                      "Loan Calculator",
                      style: AppStyle.textStyleSFPROBold.copyWith(
                          color: ColorConstant.primaryWhite,
                          fontWeight: FontWeight.w700,
                          fontSize: getFontSize(20)),
                    ),
                    SizedBox(
                      height: getVerticalSize(12),
                    ),
                    Text(
                      "Select the amount needed and the reimbursement period",
                      style: AppStyle.textStyleSFPRORegular.copyWith(
                          color: ColorConstant.primaryWhite,
                          fontWeight: FontWeight.w400,
                          fontSize: getFontSize(16)),
                    ),
                    SizedBox(
                      height: getVerticalSize(18),
                    ),
                    Text(
                      "Borrow Loan",
                      style: AppStyle.textStyleSFPRORegular.copyWith(
                          color: ColorConstant.primaryWhite,
                          fontWeight: FontWeight.w400,
                          fontSize: getFontSize(16)),
                    ),
                    SizedBox(
                      height: getVerticalSize(8),
                    ),
                    Container(
                      height: getHorizontalSize(2),
                      color: ColorConstant.primaryWhite,
                    ),
                    SizedBox(
                      height: getVerticalSize(8),
                    ),
                    Row(
                      children: [
                        Container(
                          width: getVerticalSize(16),
                          height: getHorizontalSize(16),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorConstant.primaryWhite,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        SizedBox(
                          width: getVerticalSize(8),
                        ),
                        Text(
                          "Personal Loan",
                          style: AppStyle.textStyleSFPRORegular.copyWith(
                              color: ColorConstant.primaryWhite,
                              fontWeight: FontWeight.w400,
                              fontSize: getFontSize(16)),
                        ),
                        SizedBox(
                          width: getVerticalSize(10),
                        ),
                        Container(
                          width: getVerticalSize(16),
                          height: getHorizontalSize(16),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorConstant.primaryWhite,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        SizedBox(
                          width: getVerticalSize(8),
                        ),
                        Text(
                          "Payday Loan",
                          style: AppStyle.textStyleSFPRORegular.copyWith(
                              color: ColorConstant.primaryWhite,
                              fontWeight: FontWeight.w400,
                              fontSize: getFontSize(16)),
                        ),
                        SizedBox(
                          width: getVerticalSize(10),
                        ),
                        Container(
                          width: getVerticalSize(16),
                          height: getHorizontalSize(16),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorConstant.primaryWhite,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        SizedBox(
                          width: getVerticalSize(8),
                        ),
                        Text(
                          "Auto Loan",
                          style: AppStyle.textStyleSFPRORegular.copyWith(
                              color: ColorConstant.primaryWhite,
                              fontWeight: FontWeight.w400,
                              fontSize: getFontSize(16)),
                        ),
                        SizedBox(
                          width: getVerticalSize(10),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getVerticalSize(10),
                    ),
                    Row(
                      children: [
                        Container(
                          width: getVerticalSize(16),
                          height: getHorizontalSize(16),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorConstant.primaryWhite,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        SizedBox(
                          width: getVerticalSize(8),
                        ),
                        Text(
                          "Mortage Loan",
                          style: AppStyle.textStyleSFPRORegular.copyWith(
                              color: ColorConstant.primaryWhite,
                              fontWeight: FontWeight.w400,
                              fontSize: getFontSize(16)),
                        ),
                        SizedBox(
                          width: getVerticalSize(12),
                        ),
                        Container(
                          width: getVerticalSize(16),
                          height: getHorizontalSize(16),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorConstant.primaryWhite,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        SizedBox(
                          width: getVerticalSize(8),
                        ),
                        Text(
                          "Emergancy Loan",
                          style: AppStyle.textStyleSFPRORegular.copyWith(
                              color: ColorConstant.primaryWhite,
                              fontWeight: FontWeight.w400,
                              fontSize: getFontSize(16)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getHorizontalSize(36),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: getVerticalSize(220),
                              width: getHorizontalSize(216),
                              child: CircularPercentIndicator(
                                radius: getVerticalSize(100),
                                lineWidth: getVerticalSize(15),
                                percent: 0.75,
                                backgroundColor: ColorConstant.lightSky,
                                center: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Amount",
                                      style: AppStyle.textStyleSFPRORegular
                                          .copyWith(
                                              color: ColorConstant.divider,
                                              fontWeight: FontWeight.w400,
                                              fontSize: getFontSize(16)),
                                    ),
                                    SizedBox(
                                      height: getVerticalSize(8),
                                    ),
                                    Text(
                                      "\$ 45,000",
                                      style: AppStyle.textStyleSFPROBold
                                          .copyWith(
                                              color: ColorConstant.divider,
                                              fontWeight: FontWeight.w700,
                                              fontSize: getFontSize(24)),
                                    ),
                                    DotWidget(
                                      dashColor: ColorConstant.primaryWhite,
                                      totalWidth: getHorizontalSize(120),
                                      dashHeight: 1,
                                      dashWidth: 2,
                                      emptyWidth: 2,
                                    ),
                                    SizedBox(
                                      height: getVerticalSize(8),
                                    ),
                                    Text(
                                      "@ 8% Per Year",
                                      style: AppStyle.textStyleSFPRORegular
                                          .copyWith(
                                              color: ColorConstant.divider,
                                              fontWeight: FontWeight.w400,
                                              fontSize: getFontSize(14)),
                                    ),
                                  ],
                                ),
                                progressColor: ColorConstant.skyE8,
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: getVerticalSize(90),
                              child: CircularPercentIndicator(
                                fillColor: ColorConstant.primaryBlack,
                                radius: getVerticalSize(20),
                                lineWidth: 4.0,
                                percent: 0.75,
                                center: Container(
                                  height: getVerticalSize(18),
                                  width: getHorizontalSize(18),
                                  color: ColorConstant.primaryBlack,
                                  child: Image.asset("asset/fingerprint.png"),
                                ),
                                backgroundColor: ColorConstant.lightSky,
                                progressColor: ColorConstant.skyE8,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: ColorConstant.blue26,
                              borderRadius:
                              BorderRadius.all(Radius.circular(50))),
                          child: Padding(
                            padding: EdgeInsets.only(left:getHorizontalSize(20),right:getHorizontalSize(20),top:getHorizontalSize(10),bottom:getHorizontalSize(10)),
                            child: Center(
                              child: Text(
                                " 6 Month ",
                                style: AppStyle.textStyleSFPRORegular
                                    .copyWith(
                                    color: ColorConstant.primaryWhite,
                                    fontWeight: FontWeight.w400,
                                    fontSize: getFontSize(16)),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: ColorConstant.blue26,
                              borderRadius:
                              BorderRadius.all(Radius.circular(50))),
                          child: Padding(
                            padding: EdgeInsets.only(left:getHorizontalSize(20),right:getHorizontalSize(20),top:getHorizontalSize(10),bottom:getHorizontalSize(10)),
                            child: Center(
                              child: Text(
                                "12 Month ",
                                style: AppStyle.textStyleSFPRORegular
                                    .copyWith(
                                    color: ColorConstant.primaryWhite,
                                    fontWeight: FontWeight.w400,
                                    fontSize: getFontSize(16)),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: ColorConstant.blue26,
                              borderRadius:
                              BorderRadius.all(Radius.circular(50))),
                          child: Padding(
                            padding: EdgeInsets.only(left:getHorizontalSize(20),right:getHorizontalSize(20),top:getHorizontalSize(10),bottom:getHorizontalSize(10)),
                            child: Center(
                              child: Text(
                                "18 Month ",
                                style: AppStyle.textStyleSFPRORegular
                                    .copyWith(
                                    color: ColorConstant.primaryWhite,
                                    fontWeight: FontWeight.w400,
                                    fontSize: getFontSize(16)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getHorizontalSize(22),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: ColorConstant.blue26,
                              borderRadius:
                              BorderRadius.all(Radius.circular(50))),
                          child: Padding(
                            padding: EdgeInsets.only(left:getHorizontalSize(20),right:getHorizontalSize(20),top:getHorizontalSize(10),bottom:getHorizontalSize(10)),
                            child: Center(
                              child: Text(
                                "24 Month ",
                                style: AppStyle.textStyleSFPRORegular
                                    .copyWith(
                                    color: ColorConstant.primaryWhite,
                                    fontWeight: FontWeight.w400,
                                    fontSize: getFontSize(16)),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: ColorConstant.blue26,
                              borderRadius:
                              BorderRadius.all(Radius.circular(50))),
                          child: Padding(
                            padding: EdgeInsets.only(left:getHorizontalSize(20),right:getHorizontalSize(20),top:getHorizontalSize(10),bottom:getHorizontalSize(10)),
                            child: Center(
                              child: Text(
                                "30 Month ",
                                style: AppStyle.textStyleSFPRORegular
                                    .copyWith(
                                    color: ColorConstant.primaryWhite,
                                    fontWeight: FontWeight.w400,
                                    fontSize: getFontSize(16)),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: ColorConstant.blue26,
                              borderRadius:
                              BorderRadius.all(Radius.circular(50))),
                          child: Padding(
                            padding: EdgeInsets.only(left:getHorizontalSize(20),right:getHorizontalSize(20),top:getHorizontalSize(10),bottom:getHorizontalSize(10)),
                            child: Center(
                              child: Text(
                                "36 Month ",
                                style: AppStyle.textStyleSFPRORegular
                                    .copyWith(
                                    color: ColorConstant.primaryWhite,
                                    fontWeight: FontWeight.w400,
                                    fontSize: getFontSize(16)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getHorizontalSize(40),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              "OR",
                              style: AppStyle.textStyleSFPRORegular
                                  .copyWith(
                                  color: ColorConstant.primaryWhite,
                                  fontWeight: FontWeight.w400,
                                  fontSize: getFontSize(16)),
                            ),
                            Text(
                              "Custom your Month",
                              style: AppStyle.textStyleSFPRORegular
                                  .copyWith(
                                  color: ColorConstant.primaryWhite,
                                  fontWeight: FontWeight.w400,
                                  fontSize: getFontSize(16)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    SizedBox(
                      height: getVerticalSize(50),
                      child: AppElevatedButton(buttonName: 'Process to EMI Selection',
                        textColor: ColorConstant.primaryBlack,
                        fontWeight: FontWeight.w700,
                        onPressed: () {
                          // Get.toNamed(AppRoutes.loanStepScreen);
                          // Get.offAllNamed(AppRoutes.dashBoardScreen);
                          Get.toNamed(AppRoutes.successScreen);
                        },),
                    ),
                    SizedBox(height: getVerticalSize(40),),
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
