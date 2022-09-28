import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/network_info.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../EnterPasswordScreen/models/login_response_model.dart';



class CollectDetailScreenController extends GetxController {
  static const platformChannel = MethodChannel('GET_DETAIL_CHANNEL');

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    gotoWeb();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> gotoWeb() async {
    await platformChannel.invokeMethod('goToWeb');
    platformChannel.setMethodCallHandler(_processEngineOutput);
  }
  Future<void> _processEngineOutput(MethodCall call) async {
    print(call.arguments);
  }

}
