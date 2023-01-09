import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/presentation/statistic/controller/statistic_screen_controller.dart';
import 'package:secure_cash_app/presentation/statistic/widgets/chart2.dart';
import 'package:secure_cash_app/presentation/statistic/widgets/recent_expenses_widget.dart';

import '../../App Configurations/color_constants.dart';
import '../../theme/app_style.dart';
import '../../utils/HelperFiles/math_utils.dart';

class StatisticScreen extends StatefulWidget {
  List<Color> get availableColors => const <Color>[
        Colors.purpleAccent,
        Colors.yellow,
        Colors.lightBlue,
        Colors.orange,
        Colors.pink,
        Colors.redAccent,
      ];

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  var statisticController = Get.put(StatisticScreenController());
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getVerticalSize(26),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: getHorizontalSize(22),
                      right: getHorizontalSize(22)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Statistic",
                        style: AppStyle.textStyleDMSANS.copyWith(
                            color: ColorConstant.naturalBlack,
                            fontWeight: FontWeight.w700,
                            fontSize: getFontSize(22)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(28),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: getHorizontalSize(20),
                      right: getHorizontalSize(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: ColorConstant.primaryDarkGreen,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: getVerticalSize(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Income",
                                  style: AppStyle.textStyleDMSANS.copyWith(
                                      color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w400,
                                      fontSize: getFontSize(18)),
                                ),
                                SizedBox(
                                  height: getVerticalSize(5),
                                ),
                                Obx(
                                  () => Text(
                                    "\$" +
                                        statisticController.totalIncome.value
                                            .toString(),
                                    style: AppStyle.textStyleDMSANS.copyWith(
                                        color: ColorConstant.primaryWhite,
                                        fontWeight: FontWeight.w700,
                                        fontSize: getFontSize(28)),
                                  ),
                                ),
                              ],
                            ),
                            SvgPicture.asset(
                              "asset/icons/ic_divider.svg",
                              fit: BoxFit.fill,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Expense",
                                  style: AppStyle.textStyleDMSANS.copyWith(
                                      color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w400,
                                      fontSize: getFontSize(18)),
                                ),
                                SizedBox(
                                  height: getVerticalSize(5),
                                ),
                                Obx(
                                  () => Text(
                                    "\$" +
                                        statisticController.totalExpense.value
                                            .toString(),
                                    style: AppStyle.textStyleDMSANS.copyWith(
                                        color: ColorConstant.primaryWhite,
                                        fontWeight: FontWeight.w700,
                                        fontSize: getFontSize(28)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getVerticalSize(30),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: ColorConstant.naturalGrey
                                    .withOpacity(0.10)),
                            padding: EdgeInsets.symmetric(
                                vertical: getVerticalSize(3),
                                horizontal: getHorizontalSize(3)),
                            child: Obx(
                              () => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      statisticController.timeExpense(1);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: statisticController
                                                      .isWeeklyTime.value ==
                                                  1
                                              ? ColorConstant.primaryWhite
                                              : Colors.transparent),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: getHorizontalSize(10),
                                            vertical: getVerticalSize(8)),
                                        child: Text(
                                          "Weekly",
                                          style: AppStyle.textStyleDMSANS
                                              .copyWith(
                                                  color: statisticController
                                                              .isWeeklyTime
                                                              .value ==
                                                          1
                                                      ? ColorConstant.darkGreen
                                                      : ColorConstant.greyBD,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: getFontSize(16)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      statisticController.timeExpense(2);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: statisticController
                                                      .isWeeklyTime.value ==
                                                  2
                                              ? ColorConstant.primaryWhite
                                              : Colors.transparent),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: getHorizontalSize(10),
                                            vertical: getVerticalSize(8)),
                                        child: Text(
                                          "Monthly",
                                          style: AppStyle.textStyleDMSANS
                                              .copyWith(
                                                  color: statisticController
                                                              .isWeeklyTime
                                                              .value ==
                                                          2
                                                      ? ColorConstant.darkGreen
                                                      : ColorConstant.greyBD,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: getFontSize(16)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                "asset/icons/ic_income.svg",
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                width: getHorizontalSize(5),
                              ),
                              Text(
                                "Income",
                                style: AppStyle.textStyleDMSANS.copyWith(
                                    color: ColorConstant.naturalBlack,
                                    fontWeight: FontWeight.w400,
                                    fontSize: getFontSize(15)),
                              ),
                              SizedBox(
                                width: getHorizontalSize(5),
                              ),
                              SvgPicture.asset(
                                "asset/icons/ic_expense.svg",
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                width: getHorizontalSize(5),
                              ),
                              Text(
                                "Expense",
                                style: AppStyle.textStyleDMSANS.copyWith(
                                    color: ColorConstant.naturalBlack,
                                    fontWeight: FontWeight.w400,
                                    fontSize: getFontSize(15)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getVerticalSize(30),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => statisticController.isWeeklyTime.value == 1
                      ? AspectRatio(
                          aspectRatio: 1.95,
                          child: Stack(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 0),
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0),
                                        child: BarChart(
                                          randomData(),
                                          swapAnimationDuration: animDuration,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : statisticController.statisticModel.value.data != null
                          ? Obx(() => ChartWeeklyScreen(
                              iWeek1: statisticController.iWeek1.value == "0"
                                  ? "1"
                                  : statisticController.iWeek1.value,
                              iWeek2: statisticController.iWeek2.value == "0"
                                  ? "1"
                                  : statisticController.iWeek2.value,
                              iWeek3: statisticController.iWeek3.value == "0"
                                  ? "1"
                                  : statisticController.iWeek3.value,
                              iWeek4: statisticController.iWeek4.value == "0"
                                  ? "1"
                                  : statisticController.iWeek4.value,
                              eWeek1: statisticController.eWeek1.value == "0"
                                  ? "1"
                                  : statisticController.eWeek1.value,
                              eWeek2: statisticController.eWeek2.value == "0"
                                  ? "1"
                                  : statisticController.eWeek2.value,
                              eWeek3: statisticController.eWeek3.value == "0"
                                  ? "1"
                                  : statisticController.eWeek3.value,
                              eWeek4: statisticController.eWeek4.value == "0"
                                  ? "1"
                                  : statisticController.eWeek4.value))
                          : Container(),
                ),
                SizedBox(
                  height: getVerticalSize(30),
                ),
                SizedBox(
                  height: getVerticalSize(30),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: ColorConstant.naturalGrey.withOpacity(0.10)),
                    padding: EdgeInsets.symmetric(
                        vertical: getVerticalSize(5),
                        horizontal: getHorizontalSize(5)),
                    child: Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              statisticController.incomeExpense(1);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: statisticController
                                              .isIncomeExpense.value ==
                                          1
                                      ? ColorConstant.primaryWhite
                                      : Colors.transparent),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getHorizontalSize(45),
                                    vertical: getVerticalSize(15)),
                                child: Text(
                                  "Income",
                                  style: AppStyle.textStyleDMSANS.copyWith(
                                      color: statisticController
                                                  .isIncomeExpense.value ==
                                              1
                                          ? ColorConstant.darkGreen
                                          : ColorConstant.greyBD,
                                      fontWeight: FontWeight.w500,
                                      fontSize: getFontSize(22)),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              statisticController.incomeExpense(2);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: statisticController
                                              .isIncomeExpense.value ==
                                          2
                                      ? ColorConstant.primaryWhite
                                      : Colors.transparent),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getHorizontalSize(45),
                                    vertical: getVerticalSize(15)),
                                child: Text(
                                  "Expenses",
                                  style: AppStyle.textStyleDMSANS.copyWith(
                                      color: statisticController
                                                  .isIncomeExpense.value ==
                                              2
                                          ? ColorConstant.darkGreen
                                          : ColorConstant.greyBD,
                                      fontWeight: FontWeight.w500,
                                      fontSize: getFontSize(22)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: getVerticalSize(20),
                        left: getHorizontalSize(20),
                        right: getHorizontalSize(20)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 9),
                                  child: Text(
                                    'Category Chart',
                                    style: AppStyle.textStyleDMSANS.copyWith(
                                        color: ColorConstant.primaryBlack,
                                        fontWeight: FontWeight.w700,
                                        fontSize: getFontSize(24)),
                                  ),
                                ),
                                SizedBox(
                                  height: getVerticalSize(10),
                                ),
                                Text(
                                  'Last 7 days expenses',
                                  style: AppStyle.textStyleDMSANS.copyWith(
                                      color: ColorConstant.grey8F,
                                      fontWeight: FontWeight.w400,
                                      fontSize: getFontSize(20)),
                                ),
                              ]),
                          Obx(
                            () => Text(
                              "\$" +
                                  statisticController.totalIncome.value
                                      .toString(),
                              style: AppStyle.textStyleDMSANS.copyWith(
                                  color: ColorConstant.primaryBlack,
                                  fontWeight: FontWeight.w700,
                                  fontSize: getFontSize(24)),
                            ),
                          ),
                        ])),
                SizedBox(
                  height: getVerticalSize(40),
                ),
                Align(
                    alignment: Alignment.center,
                    child: Container(
                        height: getSize(200.00),
                        width: getSize(200.00),
                        decoration: BoxDecoration(
                            color: ColorConstant.primaryWhite,
                            borderRadius: BorderRadius.circular(100)),
                        child:
                            Stack(alignment: Alignment.centerLeft, children: [
                          /* Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  height: getSize(200.00),
                                  width: getSize(200.00),
                                  child: CircularProgressIndicator(
                                      value: 0.3,
                                      backgroundColor: Colors.teal,
                                      strokeWidth: 20,
                                      color: Colors.green))),*/
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  height: getSize(200.00),
                                  width: getSize(200.00),
                                  child: Obx(
                                    () => CircularProgressIndicator(
                                        value: statisticController
                                            .percentGraph3.value,
                                        strokeWidth: 20,
                                        backgroundColor: Colors.green,
                                        color: Colors.orange),
                                  )))
                        ]))),
                Align(
                    alignment: Alignment.center,
                    child: Padding(
                        padding: EdgeInsets.only(left: 15, top: 50, right: 15),
                        child: Obx(
                          () => statisticController.isIncomeExpense.value == 1
                              ? Column(children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: size.width / 2.4,
                                        child: Row(
                                          children: [
                                            Container(
                                                height: getSize(10.00),
                                                width: getSize(10.00),
                                                margin: EdgeInsets.only(
                                                    top: 6, bottom: 8),
                                                decoration: BoxDecoration(
                                                    color: ColorConstant
                                                        .primaryOrange,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            getHorizontalSize(
                                                                15.00)))),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 8, top: 1, bottom: 1),
                                              child: Text(
                                                'Wallet Credit',
                                                style: AppStyle.textStyleDMSANS
                                                    .copyWith(
                                                        color: ColorConstant
                                                            .primaryOrange,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            getFontSize(18)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                                height: getSize(10.00),
                                                width: getSize(10.00),
                                                margin: EdgeInsets.only(
                                                    left: 32,
                                                    top: 6,
                                                    bottom: 8),
                                                decoration: BoxDecoration(
                                                    color: ColorConstant
                                                        .buttonGreen,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            getHorizontalSize(
                                                                3.00)))),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 8, top: 1),
                                              child: Text(
                                                'Loan Amount Credit',
                                                style: AppStyle.textStyleDMSANS
                                                    .copyWith(
                                                        color: ColorConstant
                                                            .buttonGreen,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            getFontSize(18)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: getVerticalSize(6),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: size.width / 2.4,
                                        child: Row(
                                          children: [
                                            Container(
                                                height: getSize(10.00),
                                                width: getSize(10.00),
                                                margin: EdgeInsets.only(
                                                    top: 6, bottom: 8),
                                                decoration: BoxDecoration(
                                                    color: ColorConstant
                                                        .primaryDarkGreen,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            getHorizontalSize(
                                                                15.00)))),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 8, top: 1, bottom: 1),
                                              child: Text(
                                                'Add money by card',
                                                style: AppStyle.textStyleDMSANS
                                                    .copyWith(
                                                        color: ColorConstant
                                                            .primaryDarkGreen,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            getFontSize(18)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                                height: getSize(10.00),
                                                width: getSize(10.00),
                                                margin: EdgeInsets.only(
                                                    left: 32,
                                                    top: 6,
                                                    bottom: 8),
                                                decoration: BoxDecoration(
                                                    color: ColorConstant
                                                        .appProgressBarColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            getHorizontalSize(
                                                                15.00)))),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 8, top: 1),
                                              child: Text(
                                                'Add money by Bank',
                                                style: AppStyle.textStyleDMSANS
                                                    .copyWith(
                                                        color: ColorConstant
                                                            .appProgressBarColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            getFontSize(18)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  /*Container(
                                    height: getSize(6.00),
                                    width: getSize(6.00),
                                    margin: EdgeInsets.only(
                                        left: 32, top: 6, bottom: 8),
                                    decoration: BoxDecoration(
                                        color: ColorConstant.darkGreen,
                                        borderRadius: BorderRadius.circular(
                                            getHorizontalSize(3.00)))),
                                Padding(
                                  padding: EdgeInsets.only(left: 8, bottom: 1),
                                  child: Text(
                                    'Coffee',
                                    style: AppStyle.textStyleDMSANS.copyWith(
                                        color: ColorConstant.darkGreen,
                                        fontWeight: FontWeight.w500,
                                        fontSize: getFontSize(18)),
                                  ),
                                )*/
                                ])
                              : Column(children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: size.width / 2.4,
                                        child: Row(
                                          children: [
                                            Container(
                                                height: getSize(10.00),
                                                width: getSize(10.00),
                                                margin: EdgeInsets.only(
                                                    top: 6, bottom: 8),
                                                decoration: BoxDecoration(
                                                    color: ColorConstant
                                                        .primaryOrange,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            getHorizontalSize(
                                                                15.00)))),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 8, top: 1, bottom: 1),
                                              child: Text(
                                                'Wallet send money',
                                                style: AppStyle.textStyleDMSANS
                                                    .copyWith(
                                                        color: ColorConstant
                                                            .primaryOrange,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            getFontSize(18)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                                height: getSize(10.00),
                                                width: getSize(10.00),
                                                margin: EdgeInsets.only(
                                                    left: 32,
                                                    top: 6,
                                                    bottom: 8),
                                                decoration: BoxDecoration(
                                                    color: ColorConstant
                                                        .buttonGreen,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            getHorizontalSize(
                                                                3.00)))),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 8, top: 1),
                                              child: Text(
                                                'Loan repayment',
                                                style: AppStyle.textStyleDMSANS
                                                    .copyWith(
                                                        color: ColorConstant
                                                            .buttonGreen,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            getFontSize(18)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: getVerticalSize(6),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: size.width / 2.4,
                                        child: Row(
                                          children: [
                                            Container(
                                                height: getSize(10.00),
                                                width: getSize(10.00),
                                                margin: EdgeInsets.only(
                                                    top: 6, bottom: 8),
                                                decoration: BoxDecoration(
                                                    color: ColorConstant
                                                        .primaryDarkGreen,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            getHorizontalSize(
                                                                15.00)))),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 8, top: 1, bottom: 1),
                                              child: Text(
                                                'Cash out',
                                                style: AppStyle.textStyleDMSANS
                                                    .copyWith(
                                                        color: ColorConstant
                                                            .primaryDarkGreen,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            getFontSize(18)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  /*Container(
                                    height: getSize(6.00),
                                    width: getSize(6.00),
                                    margin: EdgeInsets.only(
                                        left: 32, top: 6, bottom: 8),
                                    decoration: BoxDecoration(
                                        color: ColorConstant.darkGreen,
                                        borderRadius: BorderRadius.circular(
                                            getHorizontalSize(3.00)))),
                                Padding(
                                  padding: EdgeInsets.only(left: 8, bottom: 1),
                                  child: Text(
                                    'Coffee',
                                    style: AppStyle.textStyleDMSANS.copyWith(
                                        color: ColorConstant.darkGreen,
                                        fontWeight: FontWeight.w500,
                                        fontSize: getFontSize(18)),
                                  ),
                                )*/
                                ]),
                        ))),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getVerticalSize(30),
                      horizontal: getHorizontalSize(20)),
                  child: Text(
                    'Recent Expenses',
                    style: AppStyle.textStyleDMSANS.copyWith(
                        color: ColorConstant.primaryBlack,
                        fontWeight: FontWeight.w700,
                        fontSize: getFontSize(24)),
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(25),
                ),
                Obx(
                  () => statisticController.statisticModel.value.data != null
                      ? statisticController.statisticModel.value.data!
                              .userTransaction!.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: statisticController.statisticModel
                                  .value.data!.userTransaction!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return RecentExpenses(
                                  title: statisticController.statisticModel
                                      .value.data!.userTransaction![index].notes
                                      .toString(),
                                  amount: statisticController
                                      .statisticModel
                                      .value
                                      .data!
                                      .userTransaction![index]
                                      .amount
                                      .toString(),
                                  image: "asset/icons/img_history.png",
                                  status: statisticController
                                      .statisticModel
                                      .value
                                      .data!
                                      .userTransaction![index]
                                      .status
                                      .toString(),
                                  transactionStatus: statisticController
                                      .statisticModel
                                      .value
                                      .data!
                                      .userTransaction![index]
                                      .transactionStatus
                                      .toString(),
                                  date: statisticController.statisticModel.value
                                      .data!.userTransaction![index].createdAt
                                      .toString(),
                                );
                              })
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                    padding:
                                        EdgeInsets.all(getVerticalSize(20)),
                                    child: Container(
                                        width: double.infinity,
                                        height: getVerticalSize(40),
                                        margin: EdgeInsets.symmetric(
                                            horizontal: getHorizontalSize(20)),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color:
                                                ColorConstant.primaryAppTextF1),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "No New Transactions",
                                                  style: AppStyle.DmSansFont
                                                      .copyWith(
                                                          color: ColorConstant
                                                              .naturalGrey3,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize:
                                                              getFontSize(20)),
                                                )
                                              ],
                                            ),
                                          ],
                                        )))
                              ],
                            )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.all(getVerticalSize(20)),
                                child: Container(
                                    width: double.infinity,
                                    height: getVerticalSize(40),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: getHorizontalSize(20)),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: ColorConstant.primaryAppTextF1),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "No New Transactions",
                                              style:
                                                  AppStyle.DmSansFont.copyWith(
                                                      color: ColorConstant
                                                          .naturalGrey3,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          getFontSize(20)),
                                            )
                                          ],
                                        ),
                                      ],
                                    )))
                          ],
                        ),
                ),
                SizedBox(
                  height: getVerticalSize(50),
                ),
              ],
            ),
          ),
        ));
  }

  BarChartGroupData makeGroupData(
    double total,
    int day,
    double income, {
    bool isTouched = false,
    Color barColor = Colors.white,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: day,
      barRods: [
        BarChartRodData(
          toY: isTouched ? income + 1 : income,
          color: isTouched ? Color(0xff4CD080) : Color(0xff4CD080),
          width: 12,
          borderRadius: BorderRadius.circular(10),
          borderSide: isTouched
              ? BorderSide(color: Colors.yellow)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 100,
            color: Color(0xffFFAE58),
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff8F92A1),
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text(
          statisticController
              .statisticModel.value.data!.statistic!.weeklyData![0].id
              .toString(),
        );
        break;
      case 1:
        text = Text(
          statisticController
              .statisticModel.value.data!.statistic!.weeklyData![1].id
              .toString(),
        );
        break;
      case 2:
        text = Text(
          statisticController
              .statisticModel.value.data!.statistic!.weeklyData![2].id
              .toString(),
        );
        break;
      case 3:
        text = Text(
          statisticController
              .statisticModel.value.data!.statistic!.weeklyData![3].id
              .toString(),
        );
        break;
      case 4:
        text = Text(
          statisticController
              .statisticModel.value.data!.statistic!.weeklyData![4].id
              .toString(),
        );
        break;
      case 5:
        text = Text(
          statisticController
              .statisticModel.value.data!.statistic!.weeklyData![5].id
              .toString(),
        );
        break;
      case 6:
        text = Text(
          statisticController
              .statisticModel.value.data!.statistic!.weeklyData![6].id
              .toString(),
        );
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  BarChartData randomData() {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(
              0,
              0,
              statisticController.iDay1.value.toDouble(),
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
          case 1:
            return makeGroupData(
              0,
              1,
              statisticController.iDay2.value.toDouble(),
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
          case 2:
            return makeGroupData(
              0,
              2,
              statisticController.iDay3.value.toDouble(),
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
          case 3:
            return makeGroupData(
              0,
              3,
              statisticController.iDay4.value.toDouble(),
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
          case 4:
            return makeGroupData(
              0,
              4,
              statisticController.iDay5.value.toDouble(),
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
          case 5:
            return makeGroupData(
              0,
              5,
              statisticController.iDay6.value.toDouble(),
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
          case 6:
            return makeGroupData(
              0,
              6,
              statisticController.iDay6.value.toDouble(),
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
          default:
            return throw Error();
        }
      }),
      gridData: FlGridData(show: false),
    );
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
      animDuration + const Duration(milliseconds: 50),
    );
    if (isPlaying) {
      await refreshState();
    }
  }
}
