import 'dart:math';

import 'package:flutter/cupertino.dart';
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
      body:  Center(
        child: CupertinoActivityIndicator(
            radius: 23.0, color: ColorConstant.primaryDarkGreen),
      ),
    );
  }
}
