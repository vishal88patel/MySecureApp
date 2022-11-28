import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';


class ChartWeeklyScreen extends StatefulWidget {
  const ChartWeeklyScreen({Key? key}) : super(key: key);

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
              'id': 'Bar 1',
              'data': [
                {'domain': 'Week1', 'measure': 7},
                {'domain': 'Week2', 'measure': 3},
                {'domain': 'Week3', 'measure': 4},
                {'domain': 'Week4', 'measure': 6},
              ],
            },
            {
              'id': 'Bar 2',
              'data': [
                {'domain': 'Week1', 'measure': 4},
                {'domain': 'Week2', 'measure': 10},
                {'domain': 'Week3', 'measure': 2},
                {'domain': 'Week4', 'measure': 1},
              ],
            },
          ],


          measureMin: 0,
          measureMax: 8,
          minimumPaddingBetweenLabel: 1,
          domainLabelPaddingToAxisLine: 16,
          axisLineTick: 2,

          domainLabelColor: Color(0xff8F92A1),
          axisLinePointTick: 2,
          axisLinePointWidth: 0,
          axisLineColor: Colors.transparent,
          measureLabelPaddingToAxisLine: 16,
          barColor: (barData, index, id) => id == 'Bar 1'
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
