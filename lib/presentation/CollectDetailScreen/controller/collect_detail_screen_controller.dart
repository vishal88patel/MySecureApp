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
  var arguments = Get.arguments;
  var bankId="";
  var bankUrl="";

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

  Future<void> gotoWeb() async {
    await platformChannel.invokeMethod('goToWeb',{
      "AUTHTOKEN": await PrefUtils.getString(StringConstants.AUTH_TOKEN,),
      "BANK_ID": bankId,
      "BANK_URL": bankUrl,
    });
    platformChannel.setMethodCallHandler(_processEngineOutput);
  }

  Future<void> _processEngineOutput(MethodCall call) async {
    print(call.arguments);
  }

  void getArguments() {
    if (arguments != null) {
      bankId = arguments['BANK_ID'] ?? '';
      bankUrl = arguments['BANK_URL'] ?? '';
      gotoWeb();
    }
  }

}
