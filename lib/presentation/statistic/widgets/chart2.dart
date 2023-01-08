import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import '../model/getStasticsModel.dart';


class ChartWeeklyScreen extends StatefulWidget {
 final iWeek1;
 final iWeek2;
 final iWeek3;
 final iWeek4;
 final eWeek1;
 final eWeek2;
 final eWeek3;
 final eWeek4;

  const ChartWeeklyScreen({Key? key, this.iWeek1, this.iWeek2, this.iWeek3, this.iWeek4, this.eWeek1, this.eWeek2, this.eWeek3, this.eWeek4}) : super(key: key);

  @override
  State<ChartWeeklyScreen> createState() => _ChartWeeklyScreenState();
}

class _ChartWeeklyScreenState extends State<ChartWeeklyScreen> {

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: DChartBar(


          data: [
            {
              'id': 'Income',
              'data': [
                {'domain': 'Week1', 'measure': int.parse(widget.iWeek1.toString())},
                {'domain': 'Week2', 'measure': int.parse(widget.iWeek2.toString())},
                {'domain': 'Week3', 'measure': int.parse(widget.iWeek3.toString())},
                {'domain': 'Week4', 'measure': int.parse(widget.iWeek4.toString())},
              ],
            },
            {
              'id': 'Expense',
              'data': [
                {'domain': 'Week1', 'measure': int.parse(widget.eWeek1.toString())},
                {'domain': 'Week2', 'measure': int.parse(widget.eWeek2.toString())},
                {'domain': 'Week3', 'measure': int.parse(widget.eWeek3.toString())},
                {'domain': 'Week4', 'measure': int.parse(widget.eWeek4.toString())},
              ],
            },
          ],


          measureMin: 0,
          measureMax: 100,
          minimumPaddingBetweenLabel: 1,
          domainLabelPaddingToAxisLine: 16,
          axisLineTick: 2,

          domainLabelColor: Color(0xff8F92A1),
          axisLinePointTick: 2,
          axisLinePointWidth: 0,
          axisLineColor: Colors.transparent,
          measureLabelPaddingToAxisLine: 16,
          barColor: (barData, index, id) => id == 'Income'
              ? Color(0xff4CD080)
              : Color(0xffFFAE58),
          showBarValue: true,
          animate: false,
          barValuePosition: BarValuePosition.outside,
          verticalDirection: true,
        ),
      ),
    );
  }
}
