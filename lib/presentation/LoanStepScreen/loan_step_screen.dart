import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:secureapp/App%20Configurations/color_constants.dart';
import 'package:secureapp/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secureapp/routes/app_routes.dart';
import 'package:secureapp/theme/app_style.dart';
import 'package:secureapp/utils/HelperFiles/math_utils.dart';

import '../../Custom Widgets/app_AppBar .dart';
import 'controller/loan_step_screen_controller.dart';

class LoanStepScreen extends StatelessWidget {
  var loanStepController = Get.find<LoanStepScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: getVerticalSize(35),
            ),
            Image.asset(
              "asset/icons/ic_noti_background.png",
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: getVerticalSize(35),
            ),
            AppAppBar(
              title: "Loan Setup ",
              icon1: "asset/icons/ic_back.svg",
              icon2: "asset/icons/ic_setting.svg",
              onPressedIcon1: () {
                Get.back();
              },
              onPressedIcon2: () {},
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: 180,
            ),
            Expanded(
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 0),
                color: ColorConstant.primaryWhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36),
                      topRight: Radius.circular(36)),
                ),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: getVerticalSize(20),
                        ),
                        Text(
                          "Loan setup before you withdraw",
                          style: AppStyle.DmSansFont.copyWith(
                              color: ColorConstant.primaryDarkGreen,
                              fontWeight: FontWeight.w900,
                              fontSize: getFontSize(30)),
                        ),
                        SizedBox(
                          height: getVerticalSize(30),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Loan Amount",
                              style: AppStyle.DmSansFont.copyWith(
                                  color: ColorConstant.primaryDarkGreen,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getFontSize(20)),
                            ),
                            Obx(
                                  () => Text(
                                "\$ ${NumberFormat('#,##,000').format(double.parse(loanStepController.loanAmount.toString())).toString()}",
                                style: AppStyle.DmSansFont.copyWith(
                                    color: ColorConstant.primaryDarkGreen,
                                    fontWeight: FontWeight.bold,
                                    fontSize: getFontSize(20)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getVerticalSize(5),
                        ),

                        Divider(
                          color: ColorConstant.primaryDarkGreen,
                        ),
                        SizedBox(
                          height: getVerticalSize(5),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Amount",
                              style: AppStyle.DmSansFont.copyWith(
                                  color: ColorConstant.primaryDarkGreen,
                                  fontWeight: FontWeight.normal,
                                  fontSize: getFontSize(20)),
                            ),
                            Obx(
                                  () => Text(
                                "\$ ${NumberFormat('#,##,000').format(double.parse(loanStepController.loanCalModel.value.data!.loanAmount.toString())).toString()}",
                                style: AppStyle.DmSansFont.copyWith(
                                    color: ColorConstant.primaryDarkGreen,
                                    fontWeight: FontWeight.normal,
                                    fontSize: getFontSize(20)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getVerticalSize(35),
                        ),
                        Text(
                          "Interest",
                          style: AppStyle.DmSansFont.copyWith(
                              color: ColorConstant.primaryDarkGreen,
                              fontWeight: FontWeight.bold,
                              fontSize: getFontSize(20)),
                        ),
                        SizedBox(
                          height: getVerticalSize(10),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tenure ",
                              style: AppStyle.DmSansFont.copyWith(
                                  color: ColorConstant.primaryDarkGreen,
                                  fontWeight: FontWeight.normal,
                                  fontSize: getFontSize(20)),
                            ),
                            Obx(
                                  () => Text(
                                " ${loanStepController.loanCalModel.value.data!.month.toString()} Month",
                                style: AppStyle.DmSansFont.copyWith(
                                    color: ColorConstant.primaryDarkGreen,
                                    fontWeight: FontWeight.normal,
                                    fontSize: getFontSize(19)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getVerticalSize(5),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Interest Rate ",
                              style: AppStyle.DmSansFont.copyWith(
                                  color: ColorConstant.primaryDarkGreen,
                                  fontWeight: FontWeight.normal,
                                  fontSize: getFontSize(20)),
                            ),
                            Obx(
                                  () => Text(
                                "\$ ${loanStepController.loanCalModel.value.data!.intrestRate.toString()}%",
                                style: AppStyle.DmSansFont.copyWith(
                                    color: ColorConstant.primaryDarkGreen,
                                    fontWeight: FontWeight.normal,
                                    fontSize: getFontSize(20)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getVerticalSize(5),
                        ),
                        Divider(
                          color: ColorConstant.primaryDarkGreen,
                        ),
                        SizedBox(
                          height: getVerticalSize(5),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Payble Amount ",
                              style: AppStyle.DmSansFont.copyWith(
                                  color: ColorConstant.primaryDarkGreen,
                                  fontWeight: FontWeight.normal,
                                  fontSize: getFontSize(20)),
                            ),
                            Obx(
                                  () => Text(
                                "\$ ${loanStepController.loanCalModel.value.data!.paybleAmount.toString()}",
                                style: AppStyle.DmSansFont.copyWith(
                                    color: ColorConstant.primaryDarkGreen,
                                    fontWeight: FontWeight.normal,
                                    fontSize: getFontSize(20)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getVerticalSize(40),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "EMI ",
                              style: AppStyle.DmSansFont.copyWith(
                                  color: ColorConstant.primaryDarkGreen,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getFontSize(20)),
                            ),
                            Obx(
                                  () => Text(
                                "\$ ${loanStepController.loanCalModel.value.data!.monthlyEMI.toString()}",
                                style: AppStyle.DmSansFont.copyWith(
                                    color: ColorConstant.primaryDarkGreen,
                                    fontWeight: FontWeight.bold,
                                    fontSize: getFontSize(20)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getVerticalSize(5),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Number of EMI ",
                              style: AppStyle.DmSansFont.copyWith(
                                  color: ColorConstant.primaryDarkGreen,
                                  fontWeight: FontWeight.normal,
                                  fontSize: getFontSize(20)),
                            ),
                            Obx(
                                  () => Text(
                                "${loanStepController.loanCalModel.value.data!.emiNumber.toString()}",
                                style: AppStyle.DmSansFont.copyWith(
                                    color: ColorConstant.primaryDarkGreen,
                                    fontWeight: FontWeight.normal,
                                    fontSize: getFontSize(20)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getVerticalSize(5),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "EMI Number ",
                              style: AppStyle.DmSansFont.copyWith(
                                  color: ColorConstant.primaryDarkGreen,
                                  fontWeight: FontWeight.normal,
                                  fontSize: getFontSize(20)),
                            ),
                            Obx(
                                  () => Text(
                                "${loanStepController.loanCalModel.value.data!.eMINumber.toString()}",
                                style: AppStyle.DmSansFont.copyWith(
                                    color: ColorConstant.primaryDarkGreen,
                                    fontWeight: FontWeight.normal,
                                    fontSize: getFontSize(20)),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        AppElevatedButton(
                            radius: 5,
                            buttonName: 'Proceed',
                            onPressed: () {
                              // Get.toNamed(AppRoutes.bankProceedScreen);
                              loanStepController.onTapOfProcced();
                            }),
                        SizedBox(
                          height: getVerticalSize(40),
                        )
                      ],
                    ),),
              ),
            ),
          ],
        ),

      ],
    ));
  }
}
