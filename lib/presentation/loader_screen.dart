import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/routes/app_routes.dart';

import '../Custom Widgets/main_custom_background.dart';

class LoaderScreen extends StatefulWidget {
  String appRoutes1;
  String appRoutes2;
   LoaderScreen(this.appRoutes1,this.appRoutes2) ;

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 400),(){

      Get.toNamed(widget.appRoutes2.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainCutomBackGround(
        child: Image.asset(
          "asset/animations/loader.gif",

          height: 125.0,
          width: 125.0,
        ),
      ),
    );
  }
}
