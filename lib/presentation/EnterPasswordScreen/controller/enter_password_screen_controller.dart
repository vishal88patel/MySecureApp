import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/presentation/LoginScreen/models/login_response_model.dart';
import 'package:my_secure_app/utils/HelperFiles/pref_utils.dart';
import 'package:platform_device_id/platform_device_id.dart';
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
  String phone="";
  String device_type="";
  String device_id="";
  var arguments = Get.arguments;
  var PaasIsObsecure=true.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getArguments();
    checkDeviceType();
    super.onInit();
  }
  getArguments(){
    if (arguments != null) {
      email = arguments['email'];
      phone = arguments['phone'];
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
  void onTapOfForgetPassButton() {
    Get.toNamed(AppRoutes.forgetPassScreen);
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
        .callPostApi(body: await getLoginBody(email: email,phone:phone,password: passController.text), headerWithToken: false, url: ApiEndPoints.LOGIN).then((value) {
      print(value);
      if (value['status']) {
        UIUtils.showSnakBar(
            bodyText: value['message'],headerText: StringConstants.SUCCESS);
        LoginResponseModel loginResponseModel =LoginResponseModel.fromJson(value);
        PrefUtils.setString(StringConstants.AUTH_TOKEN, loginResponseModel.data!.token.toString());
        PrefUtils.setString(StringConstants.IS_KYC_DONE, loginResponseModel.data!.is_kyc.toString());
        PrefUtils.putObject(StringConstants.LOGIN_RESPONSE, loginResponseModel);
        Get.offAllNamed(AppRoutes.dashBoardScreen,arguments: {"bottomTabCount":0});
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getLoginBody({required String email,required String phone,required String password}) async {
    final form = FormData({
      "type": email.isEmpty?"2":"1",
      "email": email,
      "mobile":phone,
      "password": password,
      "device_id": await PlatformDeviceId.getDeviceId,
      "fcm_token": "empty",
      "devicy_type": device_type,
    });
    return form;
  }

  void onTapOfPassObsecure(bool val) {
    PaasIsObsecure.value=!val;
  }

  void checkDeviceType() {
    if (Platform.isMacOS) {
      device_type = "Ios";
    } else {
      device_type = "Android";
    }
  }
}
