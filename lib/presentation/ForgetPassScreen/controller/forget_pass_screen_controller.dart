import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/api_endpoints.dart';
import 'package:my_secure_app/presentation/LoginScreen/models/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/api_service.dart';
import '../../../ApiServices/network_info.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/regex_utils.dart';
import '../../../utils/HelperFiles/ui_utils.dart';

class ForgetPassScreenController extends GetxController {
  TextEditingController emailController = TextEditingController();
  bool showNext = false;

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

  void onTapOfButton() {
    if (emailController.text.isEmpty) {
      UIUtils.showSnakBar(
        headerText:StringConstants.ERROR,
        bodyText: "Please enter email",
      );
    } else if (emailController.text.isNotEmpty) {
      if (RegexPatterns.emailRegex.hasMatch(emailController.text) == false) {
        UIUtils.showSnakBar(
          headerText: StringConstants.ERROR,
          bodyText: "Please enter Valid email".tr,
        );
      } else {
        checkForgetPassApi();
      }
    } else {}
  }

  Future<void> checkForgetPassApi() async {
    ApiService()
        .callPostApi(
            body: await getBody(emailController.text),
            headerWithToken: false,
            url: ApiEndPoints.FORGOT_PASSWORD)
        .then((value) {
      print(value);
      if (value['status']) {
          Get.toNamed(AppRoutes.loginScreen);
          UIUtils.showSnakBar(
              bodyText: value['message'], headerText: StringConstants.SUCCESS);
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getBody(String text) async {
    final form = FormData({"type": "1", "email": text, "mobile": ""});
    print(form.toString());
    return form;
  }
}
