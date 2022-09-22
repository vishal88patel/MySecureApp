import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/presentation/LoginScreen/models/login_response_model.dart';
import 'package:my_secure_app/utils/HelperFiles/pref_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/api_service.dart';
import '../../../ApiServices/network_info.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';

class EnterPasswordScreenController extends GetxController {
  TextEditingController passController = TextEditingController();
  String email="";
  var arguments = Get.arguments;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getArguments();
    super.onInit();
  }
  getArguments(){
    if (arguments != null) {
      email = arguments['email'];
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onTapOfNextButton() {
    if (passController.text.isEmpty) {
      UIUtils.showSnakBar(
        headerText: StringConstants.ERROR,
        bodyText: "Please enter password",
      );
    } else {
      callLoginApi();
    }
  }

  Future<void> callLoginApi() async {
    ApiService()
        .callPostApi(
            body: await getLoginBody(email: email,password: passController.text),
            headerWithToken: false,
            url: ApiEndPoints.LOGIN)
        .then((value) {
      print(value);
      if (value['status']) {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: "ERRORMESSAGE".tr);
        LoginResponseModel loginResponseModel =LoginResponseModel.fromJson(value);
        PrefUtils.setString(StringConstants.AUTH_TOKEN, loginResponseModel.data!.token.toString());
        PrefUtils.putObject(StringConstants.LOGINRESPONSE, loginResponseModel);
        Get.toNamed(AppRoutes.dashBoardScreen);

      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: "ERRORMESSAGE".tr);
      }
    });
  }

  Future<FormData> getLoginBody({required String email,required String password}) async {
    final form = FormData({"type": "1",
      "type": "1",
      "email": email,
      "mobile": "",
      "password": password,
    });
    return form;
  }
}
