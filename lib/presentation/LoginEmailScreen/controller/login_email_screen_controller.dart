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



class LoginEmailScreenController extends GetxController {
  TextEditingController phoneController = TextEditingController();
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
    if (phoneController.text.isEmpty) {
      UIUtils.showSnakBar(
        headerText:StringConstants.ERROR,
        bodyText: "Please enter phone number",
      );
    } else if (phoneController.text.length!=11) {
      UIUtils.showSnakBar(
          bodyText: "Mobile Number Should be 11 digit number", headerText: StringConstants.ERROR);
      } else {
        checkLoginApi();
      }
    }

  Future<void> checkLoginApi() async {
    ApiService()
        .callPostApi(
        body: await getBody(phoneController.text),
        headerWithToken: false,
        url: ApiEndPoints.CHECK_USER)
        .then((value) {
      print(value);
      if (value['status']) {
        if (value['message'] == "User is not registered.") {
          Get.toNamed(AppRoutes.creatPasswordScreen);
        } else {
          Get.toNamed(
              AppRoutes.enterPasswordScreen,
              arguments: {
                "email": "",
                "phone": phoneController.text
              });
        }
      } else {
        UIUtils.showSnakBar(bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getBody(String text) async {
    final form = FormData({"type": "2", "email":"" , "mobile": text});
    print(form.toString());
    return form;
  }
}
