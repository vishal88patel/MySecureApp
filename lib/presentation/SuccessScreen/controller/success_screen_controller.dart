import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/network_info.dart';
import '../../../routes/app_routes.dart';



class SuccessScreenController extends GetxController {
  var destinationScreen;
  var arguments = Get.arguments;
  var bankName = "".obs;

  var bankImage = "".obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    getArguments();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onclickofButton() {
    if(destinationScreen==AppRoutes.dashBoardScreen){
      Future.delayed(Duration(milliseconds: 2500), () {
        // Get.toNamed(destinationScreen,);
        Get.toNamed(AppRoutes.dashBoardScreen,arguments: {"bottomTabCount":0} );
      });
    }else{
      Future.delayed(Duration(milliseconds: 2500), () {
        // Get.toNamed(destinationScreen,);
        Get.toNamed(AppRoutes.accountDetailListScreen );
      });
    }
  }

  void getArguments() {
    if (arguments != null) {
      if (arguments != null) {
        destinationScreen= arguments['destinationRoute'];
        if(destinationScreen==AppRoutes.accountDetailListScreen){
          bankName.value = arguments['BANK_NAME'];
          bankImage.value = arguments['BANK_IMAGE'];
        }

      }
    }
  }

}
