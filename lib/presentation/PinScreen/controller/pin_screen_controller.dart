import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/api_service.dart';
import '../../../ApiServices/network_info.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';



class PinScreenController extends GetxController {
  final pinController = TextEditingController();
  var arguments = Get.arguments;
  var uuid="".obs;
  var email="".obs;
  var name="".obs;
  var amount="".obs;
  var profile_pic="".obs;
  var isPin=0.obs;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getArguments();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
  Future<void> callTransactionApi() async {
    ApiService()
        .callPostApi(
        body: await getTransactionApiBody(),
        headerWithToken: true,
        url: ApiEndPoints.TRANSACTION)
        .then((value) {
      print(value);
      if (value['status']) {
        Get.toNamed(AppRoutes.bankDetailScreen);
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getTransactionApiBody() async {
    final form = FormData({
      "uuid": uuid.value,
      "amount": amount.value,
      "pin": pinController.text
    });
    return form;
  }

  void getArguments() {
    if (arguments != null) {
      uuid.value = arguments['UUID_ID'] ?? '';
      email.value = arguments['EMAIL'] ?? '';
      name.value = arguments['NAME'] ?? '';
      profile_pic.value = arguments['IMAGE'] ?? '';
      isPin.value = arguments['IS_PIN'] ?? '';
      amount.value = arguments['AMOUNT'] ?? '';
    }
  }
}
