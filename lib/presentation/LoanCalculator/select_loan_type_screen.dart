import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../Custom Widgets/app_AppBar .dart';
import '../../App Configurations/color_constants.dart';
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
  // var loanCalculatorController = Get.find<LoanCalculatorScreenController>();
  var loanCalculatorController =  Get.put(LoanCalculatorScreenController());

  double _volumeValue = 0;

  Future<void> onVolumeChanged(double value) async {
    if (await Vibrate.canVibrate) {
      Vibrate.vibrate();
    };
    setState(() {
      loanCalculatorController.selectedLoanAmount.value =
          value.round().toString();
      _volumeValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: Stack(
          children: [
            Container(color: Colors.white),
           /* Positioned(
                top: 0,
                right: 0,
                child:
                Image.asset("asset/main_background_images/Polygon 1.png")),
            Positioned(
                bottom: 0,
                left: 0,
                child:
                Image.asset("asset/main_background_images/Polygon 2.png")),*/
            SafeArea(
              child: Container(
                height: size.height,
                child: Obx(
                      ()=> loanCalculatorController.isKycDone.value
                      ? Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: getVerticalSize(0),
                            ),
                            AppAppBar(
                              titleColor:ColorConstant.primaryBlack,
                              title: "Select Loan Type",
                              icon1: "asset/icons/Back.svg",
                              icon2: "asset/icons/ic_notification.svg",
                              onPressedIcon1: () {
                                Get.back();
                              },
                              onPressedIcon2: () {
                                Get.toNamed(AppRoutes.notificationScreen);
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:20,right:20),
                              child: Column(                          crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: getVerticalSize(16),
                                  ),
                                  Text(
                                    "Select Loan Type",
                                    style: AppStyle.DmSansFont.copyWith(
                                        color: ColorConstant.primaryBlack,
                                        fontWeight: FontWeight.w700,
                                        fontSize: getFontSize(25)),
                                  ),
                                  SizedBox(
                                    height: getVerticalSize(20),
                                  ),
                                  Text(
                                    "Select the amount needed and the reimbursement period",
                                    style: AppStyle.DmSansFont.copyWith(
                                        color: ColorConstant.primaryBlack,
                                        fontWeight: FontWeight.w400,
                                        fontSize: getFontSize(22)),
                                  ),
                                  SizedBox(
                                      height: getVerticalSize(18),                                                                 Z
                                  ),
                                  Obx(
                                        () => Text(
                                      loanCalculatorController.selectedLoan.value,
                                      style: AppStyle.DmSansFont
                                          .copyWith(
                                          color: ColorConstant.primaryBlack,
                                          fontWeight: FontWeight.w400,
                                          fontSize: getFontSize(20)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: getVerticalSize(8),
                                  ),
                                  Container(
                                    height: getHorizontalSize(2),
                                    color: ColorConstant.primaryBlack,
                                  ),
                                  SizedBox(
                                    height: getVerticalSize(16),
                                  ),
                                  Obx(
                                        () => Wrap(
                                      alignment: WrapAlignment.start,
                                      children: loanCalculatorController
                                          .loanList.value
                                          .map((i) => Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: getVerticalSize(8)),
                                        child: InkWell(
                                          onTap: () {
                                            loanCalculatorController
                                                .onTapOnLoanTile(
                                                i.id, i.name);
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                width:
                                                getHorizontalSize(25),
                                                height: getHorizontalSize(25),
                                                decoration: BoxDecoration(
                                                    color: loanCalculatorController
                                                        .selectedLoanId
                                                        .value ==
                                                        i.id.toString()
                                                        ? ColorConstant
                                                        .primaryBlack
                                                        : Colors
                                                        .transparent,
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(100),
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
                                                    .DmSansFont
                                                    .copyWith(
                                                    color: ColorConstant
                                                        .primaryAppTextF1,
                                                    fontSize:
                                                    getFontSize(
                                                        20)),
                                              ),
                                              SizedBox(
                                                width:
                                                getHorizontalSize(10),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ))
                                          .toList(),
                                    ),
                                  ),
                                  SizedBox(
                                    height: getVerticalSize(10),
                                  ),
                                  SizedBox(height: 320,),
                                  SizedBox(
                                    height: getVerticalSize(50),
                                    child: AppElevatedButton(
                                      radius: 5,
                                      buttonName: 'Process to Loan',
                                      textColor: ColorConstant.primaryBlack,
                                      fontWeight: FontWeight.w700,
                                      onPressed: () {
                                        loanCalculatorController
                                            .onClickOfProcessToLoan();
                                        // Get.toNamed(AppRoutes.loanStepScreen);
                                        // Get.offAllNamed(AppRoutes.dashBoardScreen);
                                        // Get.toNamed(AppRoutes.successScreen);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: getVerticalSize(40),
                                  ),
                                ],
                              ),
                            ),
                )
                    : Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: getVerticalSize(54),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: InkWell(
                        onTap: (){
                          Get.toNamed(AppRoutes.uploadDocument1);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: ColorConstant.blue26,
                              borderRadius: BorderRadius.circular(100)
                          ),
                          child: Padding(
                            padding:  EdgeInsets.symmetric(
                                horizontal: getHorizontalSize(15),
                                vertical: getVerticalSize(12)),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Please Complete Your Kyc First',
                                    style: AppStyle.DmSansFont
                                        .copyWith(color: ColorConstant.primaryBlack,
                                        fontWeight: FontWeight.w500,fontSize: getFontSize(16))),
                              ],
                            ),
                          ),),
                      )
                  ),
                ],
              ),
            ),
    ),
                              ],
                            ),

              ),
            )
          ],
        ));
  }
}
