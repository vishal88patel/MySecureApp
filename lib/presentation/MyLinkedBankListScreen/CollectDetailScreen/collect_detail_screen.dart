import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:secure_cash_app/App%20Configurations/color_constants.dart';

import 'controller/collect_detail_screen_controller.dart';

class CollectDetailScreen extends StatelessWidget {
  var collectDetailController = Get.find<CollectDetailScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: SizedBox(
          width: 32,
          height: 32,
          child: CircularProgressIndicator(color: ColorConstant.primaryDarkGreen,),
        ),
      )
    );
  }
}
