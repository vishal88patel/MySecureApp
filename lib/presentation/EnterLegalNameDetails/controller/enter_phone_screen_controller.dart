import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/presentation/EnterLegalNameDetails/enter_middle_name_screen.dart';
import 'package:secure_cash_app/routes/app_routes.dart';

import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/regex_utils.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../../loader_screen.dart';

class EnterPhoneScreenController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController dollarController = TextEditingController(text: "");



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

  onTapOfNextButton() {
    if (phoneController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter phone number",
          headerText: StringConstants.ERROR);
    }  else {
      if (RegexPatterns.phoneRegex.hasMatch(phoneController.text.trim()) == false) {
        UIUtils.showSnakBar(
          headerText: StringConstants.ERROR,
          bodyText: "Please enter Valid phone number",
        );
      } else {
        checkPhoneValidation();
      }
      // Get.toNamed(AppRoutes.enterAddressScreen);

      // Get.to(EnterMiddleNameDetailScreen(),
      //   transition: Transition.rightToLeft,
      //   duration:   Duration(milliseconds: 500),);
    }
  }


  Future<void> checkPhoneValidation() async {
    ApiService()
        .callPostApi(
        body: await getBody(phoneController.text),
        headerWithToken: false,
        url: ApiEndPoints.CHECK_PHONE)
        .then((value) {
      print(value);
      if (value['status'] && value['message']== "User is not registered.") {
        Get.to(()=>
            LoaderScreen(AppRoutes.enterSecureTagScreen),
            transition: Transition.rightToLeft);
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getBody(String text) async {
    final form = FormData({
      "type": "2",
      "email": "",
      "mobile": text,
    });
    print(form.toString());
    return form;
  }
}
