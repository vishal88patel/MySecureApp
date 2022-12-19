import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'controller/collect_detail_screen_controller.dart';

class CollectDetailScreen extends StatelessWidget {
  var collectDetailController = Get.find<CollectDetailScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Image.asset(
        "asset/splash_image.png",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fill,
      ),
    );
  }
}
