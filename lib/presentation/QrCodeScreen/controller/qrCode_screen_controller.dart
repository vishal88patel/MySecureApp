import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/network_info.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../LoginScreen/models/login_response_model.dart';



class QrCodeScreenController extends GetxController {
  var arguments = Get.arguments;
  var uuid="No Data".obs;
  LoginResponseModel? loginResponseModel=LoginResponseModel();
  var userName="".obs;
  var upiId="".obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getStoredData();
    getArguments();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getArguments() {
    if (arguments != null) {
      uuid.value = arguments['UUID_ID'] ?? '';
    }
  }
  Future<void> getStoredData() async {
    loginResponseModel = (await PrefUtils.getLoginModelData(StringConstants.LOGIN_RESPONSE));
    userName.value=loginResponseModel!.data!.firstName!+" "+loginResponseModel!.data!.lastName.toString();
    upiId.value=loginResponseModel!.data!.firstName!+loginResponseModel!.data!.cashtag.toString();
  }
}
