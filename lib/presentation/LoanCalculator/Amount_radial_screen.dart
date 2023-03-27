import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:vibration/vibration.dart';

import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../Custom Widgets/dash_widget.dart';
import '../../theme/app_style.dart';
import '../../utils/ConstantsFiles/string_constants.dart';
import '../../utils/HelperFiles/math_utils.dart';
import '../../utils/HelperFiles/ui_utils.dart';
import 'controller/loan_calculator_screen_controller.dart';

class AmountRadialScreen extends StatefulWidget {
  const AmountRadialScreen({Key? key}) : super(key: key);

  @override
  State<AmountRadialScreen> createState() => _AmountRadialScreenState();
}

class _AmountRadialScreenState extends State<AmountRadialScreen> {
  var loanCalculatorController = Get.put(LoanCalculatorScreenController());

  double _volumeValue = 500;
  bool showInfoDialouge = true;
  double amountBy = 500;
  double amountTotal = 500;
  double amountInto = 0;

  Future<void> onVolumeChanged(double value) async {
    if (await Vibration.hasAmplitudeControl() != null) {
      Vibration.vibrate(amplitude: 50);
    }
    ;
    setState(() {
      if (value.round() > 4999) {
        if (showInfoDialouge) {
          Get.dialog(
            WillPopScope(
              onWillPop: () =>goHome(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(40)),
                child: Center(
                  child: Material(
                    color: Colors.transparent,
                    child: Wrap(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: ColorConstant.primaryWhite,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15))),
                          margin: const EdgeInsets.only(bottom: 20),
                          padding: const EdgeInsets.only(
                            bottom: 20,
                          ),
                          constraints: const BoxConstraints(minWidth: 180),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFFF4F4F6),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15))),
                                padding: EdgeInsets.all(12),
                                child: InkWell(
                                  onTap: () {
                                    // Get.back();
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "asset/icons/information_image.png",
                                            height: 50,
                                          )
                                        ],
                                      ),
                                      Center(
                                        child: Text(
                                          "Info",
                                          textAlign: TextAlign.center,
                                          style: AppStyle.DmSansFont.copyWith(
                                              fontSize: getFontSize(24),
                                              fontWeight: FontWeight.w700,
                                              color: ColorConstant.darkBlue),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getHorizontalSize(12)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Obx(()
                                    => IconButton(onPressed: (){
                                      loanCalculatorController.isAgreeCheckBox();
                                    },
                                        padding: EdgeInsets.symmetric(
                                            horizontal: getHorizontalSize(8)),
                                        constraints: BoxConstraints(),
                                        icon: Icon(loanCalculatorController.isAgree.value
                                            ?Icons.check_box:Icons.check_box_outline_blank,
                                          color: ColorConstant.grey8F,)),
                                    ),
                                    Text(
                                      "Loan Above \$4999 will be \nConverted to Business Loan",
                                      style: AppStyle.textStyleDMSANS.copyWith(
                                          color: ColorConstant.naturalGrey,
                                          fontWeight: FontWeight.w500,
                                          fontSize: getFontSize(20)),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getHorizontalSize(30)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: AppElevatedButton(
                                        buttonColor:
                                            ColorConstant.primaryLightGreen,
                                        buttonName: 'Okay',
                                        radius: 10,
                                        onPressed: () {
                                          if(loanCalculatorController.isAgree.value){
                                            Navigator.pop(context);
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            barrierDismissible: false,
          );

          showInfoDialouge = false;
        }
      }

      amountInto = value / amountBy;
      if (value > 500) {
        amountTotal = amountInto.toInt() * 500;
        _volumeValue = amountTotal;
      }
      loanCalculatorController.selectedLoanAmount.value =
          _volumeValue.toString();
    });
  }
  goHome() {
    UIUtils.showSnakBar(
        headerText: StringConstants.ERROR,
        bodyText: "Please agree to this");
  }
  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
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
                                      "Amount",
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
                                  "Select Loan Amount",
                                  style: AppStyle.DmSansFont.copyWith(
                                      color: ColorConstant.primaryBlack,
                                      fontWeight: FontWeight.w500,
                                      fontSize: getFontSize(20)),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Select the amount needed and the \nreimbursement period",
                                  style: AppStyle.DmSansFont.copyWith(
                                      color: ColorConstant.primaryBlack,
                                      fontWeight: FontWeight.w400,
                                      fontSize: getFontSize(18)),
                                ),
                                SizedBox(
                                  height: getVerticalSize(12),
                                ),
                                Center(
                                  child: Container(
                                    height: 300,
                                    width: 300,
                                    child: Obx(
                                      () => SfRadialGauge(
                                          axes: <RadialAxis>[

                                        RadialAxis(
                                            minimum: 100,
                                            startAngle: 270,
                                            endAngle: 260,
                                            maximum: loanCalculatorController
                                                .maximumAvailableLoan.value
                                                .toDouble(),
                                            showLabels: false,
                                            showTicks: false,
                                            radiusFactor: 0.7,
                                            axisLineStyle: AxisLineStyle(
                                                cornerStyle:
                                                    CornerStyle.bothCurve,
                                                color: ColorConstant.greenF3,
                                                thickness: 20
                                            ),
                                            pointers: <GaugePointer>[
                                              RangePointer(
                                                  value: _volumeValue,
                                                  cornerStyle:
                                                      CornerStyle.bothCurve,
                                                  width: 20,
                                                  color: ColorConstant
                                                      .primaryLightGreen
                                                      .withOpacity(0.6),
                                                  sizeUnit:
                                                      GaugeSizeUnit.logicalPixel,
                                                  gradient: SweepGradient(
                                                    colors: <Color>[
                                                      ColorConstant
                                                          .primaryLightGreen,
                                                      ColorConstant
                                                          .primaryLightGreen,
                                                    ],
                                                  )),
                                              MarkerPointer(
                                                  value: _volumeValue,
                                                  enableDragging: true,
                                                  onValueChanged: onVolumeChanged,
                                                  markerHeight: 34,
                                                  markerWidth: 34,
                                                  markerType: MarkerType.image,
                                                  imageUrl:
                                                      "asset/icons/finger_image.png",
                                                  color: ColorConstant
                                                      .primaryLightGreen,
                                                  borderWidth: 1,
                                                  borderColor: ColorConstant.primaryLightGreen)
                                            ],
                                            annotations: <GaugeAnnotation>[
                                              GaugeAnnotation(
                                                  angle: 90,
                                                  axisValue: 5,
                                                  positionFactor: 0.2,
                                                  widget: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        "Amount",
                                                        style: AppStyle.DmSansFont
                                                            .copyWith(
                                                                color: ColorConstant
                                                                    .primaryBlack,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    getFontSize(
                                                                        20)),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            getVerticalSize(8),
                                                      ),
                                                      Text(
                                                        "\$" +
                                                            _volumeValue
                                                                .ceil()
                                                                .toString(),
                                                        style: AppStyle.DmSansFont
                                                            .copyWith(
                                                                color: ColorConstant
                                                                    .primaryBlack,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    getFontSize(
                                                                        28)),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            getVerticalSize(8),
                                                      ),
                                                      DotWidget(
                                                        dashColor: ColorConstant
                                                            .primaryDarkGreen,
                                                        totalWidth:
                                                            getHorizontalSize(
                                                                120),
                                                        dashHeight: 1,
                                                        dashWidth: 2,
                                                        emptyWidth: 2,
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            getVerticalSize(8),
                                                      ),
                                                      Text(
                                                        "@ ${loanCalculatorController.interestRate}% Per Year",
                                                        style: AppStyle.DmSansFont
                                                            .copyWith(
                                                                color: ColorConstant
                                                                    .primaryBlack,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    getFontSize(
                                                                        14)),
                                                      ),
                                                    ],
                                                  ))
                                            ])
                                      ]),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: getVerticalSize(150),
                                  child: GridView.builder(
                                    itemCount: loanCalculatorController
                                        .loanTenuteList.value.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      childAspectRatio: 2,
                                    ),
                                    itemBuilder: (BuildContext context, int i) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: getVerticalSize(8)),
                                        child: GestureDetector(
                                          onTap: () {
                                            loanCalculatorController
                                                .onTapOnLoanTenure(
                                                    loanCalculatorController
                                                        .loanTenuteList
                                                        .value[i]
                                                        .id!
                                                        .toInt(),
                                                    loanCalculatorController
                                                        .loanTenuteList
                                                        .value[i]
                                                        .name
                                                        .toString());
                                          },
                                          child: Obx(
                                            () => Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Container(
                                                width: size.width / 3.5,
                                                decoration: BoxDecoration(
                                                    color: loanCalculatorController
                                                                .selectedLoanTenureId
                                                                .value
                                                                .toString() ==
                                                            loanCalculatorController
                                                                .loanTenuteList
                                                                .value[i]
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
                                                          .loanTenuteList
                                                          .value[i]
                                                          .name
                                                          .toString(),
                                                      style: AppStyle.DmSansFont.copyWith(
                                                          color: loanCalculatorController
                                                                      .selectedLoanTenureId
                                                                      .value
                                                                      .toString() ==
                                                                  loanCalculatorController
                                                                      .loanTenuteList
                                                                      .value[i]
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
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Spacer(),
                                AppElevatedButton(
                                  radius: 10,
                                  buttonName: 'Process to Loan',
                                  textColor: ColorConstant.primaryWhite,
                                  fontWeight: FontWeight.w700,
                                  onPressed: () {
                                    loanCalculatorController
                                        .onClickOfProcessToLoanFinalStep();
                                    // Get.toNamed(AppRoutes.loanStepScreen);
                                    // Get.offAllNamed(AppRoutes.dashBoardScreen);
                                    // Get.toNamed(AppRoutes.successScreen);
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
                    ),
                  ],
                )),
          )
    );

  }
}
