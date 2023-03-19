import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/App%20Configurations/color_constants.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';
import 'package:secure_cash_app/App%20Configurations/color_constants.dart';

import '../../routes/app_routes.dart';

class LoanLoaderScreen extends StatefulWidget {
  String appRoutes;
  Map<String,dynamic> value;

  LoanLoaderScreen(this.appRoutes,this.value);

  @override
  State<LoanLoaderScreen> createState() => _LoanLoaderScreenState();
}

class _LoanLoaderScreenState extends State<LoanLoaderScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
    new AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    _animationController.addListener(() => setState(() {}));
    _animationController.repeat();
    Future.delayed(Duration(milliseconds: 6000), () {
      Get.toNamed(AppRoutes.loan_approved,
          arguments: widget.value);
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
