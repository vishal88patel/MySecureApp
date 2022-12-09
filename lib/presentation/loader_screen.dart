import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/App%20Configurations/color_constants.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';
import 'package:secure_cash_app/App%20Configurations/color_constants.dart';

class LoaderScreen extends StatefulWidget {
  String appRoutes;

  LoaderScreen(this.appRoutes);

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
    new AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    _animationController.addListener(() => setState(() {}));
    _animationController.repeat();
    Future.delayed(Duration(milliseconds: 1000), () {
      Get.offNamed(widget.appRoutes.toString());
    });
    _animationController.repeat(max: 1);
    _animationController.forward();
    super.initState();
  }
  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: getVerticalSize(100),left: getHorizontalSize(40)),
              child: RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(_animationController),
                child: GradientCircularProgressIndicator(
                  radius: 35,
                  gradientColors: [
                    ColorConstant.buttonGreen,
                    ColorConstant.blueFF,
                    ColorConstant.buttonGreen,
                  ],
                  strokeWidth: 10.0,
                ),
              ),
            ),
          ),
    );
  }
}
class GradientCircularProgressIndicator extends StatelessWidget {
  final double radius;
  final List<Color> gradientColors;
  final double strokeWidth;

  GradientCircularProgressIndicator({
    required this.radius,
    required this.gradientColors,
    this.strokeWidth = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.fromRadius(radius),
      painter: GradientCircularProgressPainter(
        radius: radius,
        gradientColors: gradientColors,
        strokeWidth: strokeWidth,
      ),
    );
  }
}

class GradientCircularProgressPainter extends CustomPainter {
  GradientCircularProgressPainter({
    required this.radius,
    required this.gradientColors,
    required this.strokeWidth,
  });
  final double radius;
  final List<Color> gradientColors;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    size = Size.fromRadius(radius);
    double offset = strokeWidth / 2;
    Rect rect = Offset(offset, offset) &
    Size(size.width - strokeWidth, size.height - strokeWidth);
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    paint.shader =
        SweepGradient(colors: gradientColors, startAngle: 0.0, endAngle: 2 * pi)
            .createShader(rect);
    canvas.drawArc(rect, 0.0, 2 * pi, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
