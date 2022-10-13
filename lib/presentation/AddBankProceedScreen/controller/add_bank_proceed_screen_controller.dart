import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/network_info.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';



class AddBankProceedScreenController extends GetxController {
  var arguments = Get.arguments;
  var bankId = "";
  var bankName = "".obs;
  var bankUrl = "".obs;
  var bankScript="".obs;
  var bankImage="".obs;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getArguments();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getArguments() async {
    if (arguments != null) {
      bankId = arguments['BANK_ID'] ?? '';
      bankName.value = arguments['BANK_NAME'] ?? '';
      bankUrl.value = arguments['BANK_URL'] ?? '';
      bankScript.value = arguments['BANK_JS'] ?? '';
      bankImage.value = arguments['BANK_IMAGE'] ?? '';
    }
  }

  Future<void> onClickOfNextButton() async {
    // Map<Permission, PermissionStatus> statuses = await [
    //   Permission.manageExternalStorage,
    // ].request();
    final status = await Permission.manageExternalStorage.request();
    if (status == PermissionStatus.granted) {
      Get.toNamed(AppRoutes.collectDetailScreen,arguments: {
        'BANK_ID': bankId,
        'BANK_NAME':bankName.value,
        'BANK_URL': bankUrl.value,
        'BANK_JS': bankScript.value,
        'BANK_IMAGE': bankImage.value,
      });
    } else if (status == PermissionStatus.denied) {
      UIUtils.showSnakBar(
          bodyText: "Please allow permission", headerText: StringConstants.ERROR);
    } else if (status == PermissionStatus.permanentlyDenied) {
      print('Take the user to the settings page.');
      await openAppSettings();
    }
    // PermissionStatus status = await  Permission.manageExternalStorage.request();
    // if(statuses[Permission.manageExternalStorage]!.isDenied){ //check each permission status after.
    //   print("Location permission is denied.");
    // }else{
    //   Get.toNamed(AppRoutes.collectDetailScreen,arguments: {
    //     'BANK_ID': bankId,
    //     'BANK_NAME':bankName.value,
    //     'BANK_URL': bankUrl.value,
    //     'BANK_JS': bankScript.value,
    //   });
    // }

  }
}
