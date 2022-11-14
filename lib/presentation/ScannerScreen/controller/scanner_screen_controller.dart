import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/network_info.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/pref_utils.dart';



class ScannerScreenController extends GetxController {
  var scanBarcode="Unknown".obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {


    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
