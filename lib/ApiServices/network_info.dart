import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/HelperFiles/ui_utils.dart';

// For checking internet connectivity
abstract class NetworkInfo {
  static Future<bool> checkNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      Get.closeAllSnackbars();
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      Get.closeAllSnackbars();
      return true;
    } else {
      if (connectivityResult == ConnectivityResult.none) {
        UIUtils.hideProgressDialog();
        Get.snackbar(
            "ERRORMESSAGE".tr,
            "NOINTERNETCONNECTION".tr,
            backgroundColor: Colors.red,
            snackPosition: SnackPosition.BOTTOM);
        checkNetwork();
        return false;
      } else {
        return true;
      }
    }
  }
}
