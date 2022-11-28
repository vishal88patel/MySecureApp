import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/presentation/HomeScreen/controller/home_screen_controller.dart';
import 'package:my_secure_app/presentation/HomeScreen/widget/payment_list_widget.dart';
import 'package:my_secure_app/presentation/statistic/controller/statistic_screen_controller.dart';
import 'package:shimmer/shimmer.dart';

import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_AppBar .dart';
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
  // var homeController = Get.put(StatisticScreenController());
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
                  height: getVerticalSize(16),
                ),
                AppAppBar(
                  title: "Statistic",
                  icon1: "asset/icons/Back.svg",
                  icon2: "asset/icons/ic_setting_black.svg",
                  titleColor: ColorConstant.naturalBlack,
                  onPressedIcon1: () {
                    Get.back();
                  },
                  onPressedIcon2: () {},
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: getHorizontalSize(20), right: getHorizontalSize(20)),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: ColorConstant.primaryDarkGreen,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        padding: EdgeInsets.symmetric(vertical: getVerticalSize(20)),
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
                                SizedBox(height: getVerticalSize(5),),
                                Text(
                                  "\$5,440",
                                  style: AppStyle.textStyleDMSANS.copyWith(
                                      color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w700,
                                      fontSize: getFontSize(28)),
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
                                SizedBox(height: getVerticalSize(5),),
                                Text(
                                  "\$2,209",
                                  style: AppStyle.textStyleDMSANS.copyWith(
                                      color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w700,
                                      fontSize: getFontSize(28)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getVerticalSize(30),
                      ),


                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(color: ColorConstant.grey8F.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(16)),
                            padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(10),
                                vertical: getVerticalSize(2)),
                            child:  Row(mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Weekly",
                                  style: AppStyle.textStyleDMSANS.copyWith(
                                      color: ColorConstant.naturalBlack,
                                      fontWeight: FontWeight.w400,
                                      fontSize: getFontSize(15)),
                                ),
                                SizedBox(width: getHorizontalSize(5),),
                                Icon(Icons.keyboard_arrow_down_outlined),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                "asset/icons/ic_income.svg",
                                fit: BoxFit.fill,
                              ),
                              SizedBox(width: getHorizontalSize(5),),
                              Text(
                                "Income",
                                style: AppStyle.textStyleDMSANS.copyWith(
                                    color: ColorConstant.naturalBlack,
                                    fontWeight: FontWeight.w400,
                                    fontSize: getFontSize(15)),
                              ),
                              SizedBox(width: getHorizontalSize(5),),

                              SvgPicture.asset(
                                "asset/icons/ic_expense.svg",
                                fit: BoxFit.fill,
                              ),
                              SizedBox(width: getHorizontalSize(5),),
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
                AspectRatio(
                  aspectRatio: 1.4,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 0),
                                child: BarChart(
                                 randomData() ,
                                  swapAnimationDuration: animDuration,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: getVerticalSize(50),),

              ],
            ),
          ),
        ));
  }


  BarChartGroupData makeGroupData(
      int x,
      double y, {
        bool isTouched = false,
        Color barColor = Colors.white,
        double width = 22,
        List<int> showTooltips = const [],
      }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? Color(0xff4CD080) :  Color(0xff4CD080),
          width: 12,borderRadius: BorderRadius.circular(10),
          borderSide: isTouched
              ? BorderSide(color: Colors.yellow)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: Color(0xffFFAE58),
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
    switch (i) {
      case 0:
        return makeGroupData(0, 10, isTouched: i == touchedIndex);
      case 1:
        return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
      case 2:
        return makeGroupData(2, 5, isTouched: i == touchedIndex);
      case 3:
        return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
      case 4:
        return makeGroupData(4, 9, isTouched: i == touchedIndex);
      case 5:
        return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
      case 6:
        return makeGroupData(6, 6.5, isTouched: i == touchedIndex);
      default:
        return throw Error();
    }
  });


  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff8F92A1),
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('Mon', style: style);
        break;
      case 1:
        text = const Text('Tue', style: style);
        break;
      case 2:
        text = const Text('Wed', style: style);
        break;
      case 3:
        text = const Text('Tus', style: style);
        break;
      case 4:
        text = const Text('Fri', style: style);
        break;
      case 5:
        text = const Text('Set', style: style);
        break;
      case 6:
        text = const Text('Sun', style: style);
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
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
              Random().nextInt(widget.availableColors.length)],
            );
          case 1:
            return makeGroupData(
              1,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
              Random().nextInt(widget.availableColors.length)],
            );
          case 2:
            return makeGroupData(
              2,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
              Random().nextInt(widget.availableColors.length)],
            );
          case 3:
            return makeGroupData(
              3,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
              Random().nextInt(widget.availableColors.length)],
            );
          case 4:
            return makeGroupData(
              4,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
              Random().nextInt(widget.availableColors.length)],
            );
          case 5:
            return makeGroupData(
              5,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
              Random().nextInt(widget.availableColors.length)],
            );
          case 6:
            return makeGroupData(
              6,
              Random().nextInt(15).toDouble() + 6,
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