import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/network_info.dart';
import '../../../routes/app_routes.dart';



class ProgressScreenController extends GetxController {
  var arguments = Get.arguments;
  var destinationScreen;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getArguments();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getArguments() {
    if (arguments != null) {
      destinationScreen= arguments['destinationRoute'];
        Future.delayed(Duration(milliseconds: 2500), () {
          // Get.toNamed(destinationScreen,);
          Get.toNamed(AppRoutes.successScreen,arguments: {"destinationRoute":destinationScreen} );
        });


    }
  }

}
