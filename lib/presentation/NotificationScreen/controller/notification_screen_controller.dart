import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/network_info.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/pref_utils.dart';



class NotificationScreenController extends GetxController {
var  showNotiFiBadge=false.obs;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getStoredData();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.onInit();
  }
  Future<void> getStoredData() async {

    if(PrefUtils.getString(StringConstants.IS_KYC_DONE)=="0"){
      showNotiFiBadge.value=true;
    }else{
      showNotiFiBadge.value=false;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

}
