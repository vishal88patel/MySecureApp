import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/network_info.dart';
import '../../../routes/app_routes.dart';
import '../../LinkCardEditCardScreen/controller/link_card_edit_card_screen_controller.dart';




class LoanLoadingController extends GetxController {
  var progress1 = false.obs;
  var progress2 = false.obs;
  var progress3 = false.obs;
  var progress4 = false.obs;
  var readOnly = true.obs;
  var maximumAvailableLoan = 0.obs;
  var arguments = Get.arguments;
  @override
  void onReady() {
    super.onReady();
  }
  void getArguments() {
    if (arguments!=null) {

      maximumAvailableLoan.value = arguments['AMOUNT'];

    }else{
      maximumAvailableLoan.value=15000;
    }
  }
  void progress(){
    progress1.value=true;
    Future.delayed(Duration(milliseconds: 1000), () {
      progress2.value=true;
      Future.delayed(Duration(milliseconds: 1000), () {
        progress3.value=true;
        Future.delayed(Duration(milliseconds: 1000), () {
          progress4.value=true;

        });
      });
    });
  }

  @override
  void onInit() {
    progress();
    getArguments();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
