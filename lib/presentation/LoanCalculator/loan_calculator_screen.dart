import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../Custom Widgets/dash_widget.dart';
import 'controller/loan_calculator_screen_controller.dart';

class LoanCalculatorScreen extends StatefulWidget {
  @override
  State<LoanCalculatorScreen> createState() => _LoanCalculatorScreenState();
}

class _LoanCalculatorScreenState extends State<LoanCalculatorScreen> {
  var loanCalculatorController = Get.put(LoanCalculatorScreenController());

  double _volumeValue = 20000;

  Future<void> onVolumeChanged(double value) async {
    if (await Vibrate.canVibrate) {
      Vibrate.vibrate();
    }
    ;
    setState(() {
      loanCalculatorController.selectedLoanAmount.value=value.round().toString();
      _volumeValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: Stack(
          children: [
            Container(color: ColorConstant.primaryBlack),
            Positioned(
                top: 0,
                right: 0,
                child:
                Image.asset("asset/main_background_images/Polygon 1.png")),
            Positioned(
                bottom: 0,
                left: 0,
                child:
                Image.asset("asset/main_background_images/Polygon 2.png")),
            SafeArea(
              child: Container(
                height: size.height - 85,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
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
                        Obx(
                              () =>
                              Text(
                                loanCalculatorController.selectedLoan.value,
                                style: AppStyle.textStyleSFPRORegular.copyWith(
                                    color: ColorConstant.primaryWhite,
                                    fontWeight: FontWeight.w400,
                                    fontSize: getFontSize(16)),
                              ),
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

                        Obx(
                              () =>
                              Wrap(
                                alignment: WrapAlignment.start,
                                children: loanCalculatorController.loanList
                                    .value
                                    .map((i) =>
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: getVerticalSize(8)),
                                      child: InkWell(
                                        onTap: () {
                                          loanCalculatorController
                                              .onTapOnLoanTile(
                                              i.id, i.name);
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              width: getHorizontalSize(18),
                                              height: getVerticalSize(18),
                                              decoration: BoxDecoration(
                                                  color: loanCalculatorController
                                                      .selectedLoanId.value ==
                                                      i.id.toString()
                                                      ? ColorConstant
                                                      .primaryWhite
                                                      : Colors.transparent,
                                                  borderRadius:
                                                  BorderRadius.circular(100),
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
                                                  fontSize: getFontSize(14)),
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
                        SizedBox(
                          height: getVerticalSize(10),
                        ),
                        Center(
                          child: Container(
                            height: 300,
                            width: 300,
                            child: SfRadialGauge(axes: <RadialAxis>[
                              RadialAxis(
                                  minimum: 20000,
                                  startAngle: 270,
                                  endAngle: 270,
                                  maximum: loanCalculatorController.maximumAvailableLoan.value.toDouble(),
                                  showLabels: false,
                                  showTicks: false,
                                  radiusFactor: 0.7,
                                  axisLineStyle: AxisLineStyle(
                                      cornerStyle: CornerStyle.bothCurve,
                                      color: Colors.black12,
                                      thickness: 15),
                                  pointers: <GaugePointer>[
                                    RangePointer(
                                        value: _volumeValue,
                                        cornerStyle: CornerStyle.bothCurve,
                                        width: 15,
                                        sizeUnit: GaugeSizeUnit.logicalPixel,
                                        gradient: SweepGradient(
                                          colors: <Color>[
                                            ColorConstant.skyE8,
                                            ColorConstant.skyE8,
                                          ],
                                        )),
                                    MarkerPointer(
                                        value: _volumeValue,
                                        enableDragging: true,
                                        onValueChanged: onVolumeChanged,
                                        markerHeight: 34,
                                        markerWidth: 34,
                                        markerType: MarkerType.image,
                                        imageUrl: "asset/icons/finger_image.png",
                                        color: Color(0xFF753A88),
                                        borderWidth: 1,
                                        borderColor: Colors.white54)
                                  ],
                                  annotations: <GaugeAnnotation>[
                                    GaugeAnnotation(
                                        angle: 90,
                                        axisValue: 5,
                                        positionFactor: 0.2,
                                        widget: Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text(
                                              "Amount",
                                              style: AppStyle
                                                  .textStyleSFPRORegular
                                                  .copyWith(
                                                  color: ColorConstant.divider,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: getFontSize(16)),
                                            ),
                                            SizedBox(
                                              height: getVerticalSize(8),
                                            ),

                                            Text(
                                              "\$" + _volumeValue.ceil()
                                                  .toString(),
                                              style: AppStyle.textStyleSFPROBold
                                                  .copyWith(
                                                  color: ColorConstant.divider,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: getFontSize(24)),
                                            ),
                                            SizedBox(
                                              height: getVerticalSize(8),
                                            ),
                                            DotWidget(
                                              dashColor: ColorConstant
                                                  .primaryWhite,
                                              totalWidth: getHorizontalSize(
                                                  120),
                                              dashHeight: 1,
                                              dashWidth: 2,
                                              emptyWidth: 2,
                                            ),
                                            SizedBox(
                                              height: getVerticalSize(8),
                                            ),
                                            Text(
                                              "@ ${loanCalculatorController.interestRate}% Per Year",
                                              style: AppStyle
                                                  .textStyleSFPRORegular
                                                  .copyWith(
                                                  color: ColorConstant.divider,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: getFontSize(14)),
                                            ),
                                          ],
                                        ))
                                  ])
                            ]),
                          ),
                        ),


                        Obx(
                              () =>
                              Wrap(
                                alignment: WrapAlignment.start,
                                children: loanCalculatorController
                                    .loanTenuteList.value
                                    .map((i) =>
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: getVerticalSize(8)),
                                      child: InkWell(
                                        onTap: () {
                                          loanCalculatorController
                                              .onTapOnLoanTenure(
                                              i.id!.toInt(), i.name.toString());
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Container(
                                            width: size.width/3.5,
                                            decoration: BoxDecoration(
                                                color: loanCalculatorController
                                                    .selectedLoanTenureId.value
                                                    .toString() == i.id.toString()?
                                                ColorConstant.primaryWhite:ColorConstant.blue26,
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(50))),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: getHorizontalSize(20),
                                                  right: getHorizontalSize(20),
                                                  top: getHorizontalSize(10),
                                                  bottom: getHorizontalSize(10)),
                                              child: Center(
                                                child: Text(
                                                  i.name.toString(),
                                                  style: AppStyle
                                                      .textStyleSFPRORegular
                                                      .copyWith(
                                                      color: loanCalculatorController
                                                          .selectedLoanTenureId.value
                                                          .toString() == i.id.toString()?
                                                      ColorConstant.primaryBlack:ColorConstant.primaryWhite,
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: getFontSize(16)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ))
                                    .toList(),
                              ),
                        ),


                        SizedBox(
                          height: getHorizontalSize(40),
                        ),

                        SizedBox(
                          height: getVerticalSize(50),
                          child: AppElevatedButton(
                            buttonName: 'Process to Loan',
                            textColor: ColorConstant.primaryBlack,
                            fontWeight: FontWeight.w700,
                            onPressed: () {
                              loanCalculatorController.onClickOfProcessToLoan();
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
                ),
              ),
            )
          ],
        ));
  }


}
