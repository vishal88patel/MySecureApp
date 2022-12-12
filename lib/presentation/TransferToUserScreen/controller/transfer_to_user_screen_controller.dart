import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';



class TransferToUserScreenController extends GetxController {
  TextEditingController amountCtrl = TextEditingController();
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }


}
