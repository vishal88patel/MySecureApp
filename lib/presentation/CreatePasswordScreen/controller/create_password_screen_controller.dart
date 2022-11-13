import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/presentation/EnterLegalNameDetails/enter_first_name_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/network_info.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';



class CreatePasswordScreenController extends GetxController {
  TextEditingController createPassController=TextEditingController();
  TextEditingController confirmPassController=TextEditingController();

  var createPaasIsObsecure=true.obs;
  var confirmPassIsObsecure=true.obs;

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

  void onTapOfCreatePassObsecure(bool val) {
    createPaasIsObsecure.value=!val;
  }
  void onTapOfConfirmPassObsecure(bool val) {
    confirmPassIsObsecure.value=!val;
  }

  void onTapOfNextButton() {
    if(createPassController.text.isEmpty){
      UIUtils.showSnakBar(
        headerText:StringConstants.ERROR,
        bodyText: "Please enter password",
      );
    }else if(confirmPassController.text.isEmpty){
      UIUtils.showSnakBar(
        headerText: StringConstants.ERROR,
        bodyText: "Please enter confirm Password",
      );
    }else if(createPassController.text!=confirmPassController.text){
      UIUtils.showSnakBar(
        headerText: StringConstants.ERROR,
        bodyText: "Password did not matched",
      );
    }else{
      // Get.toNamed(AppRoutes.enterLegalNameScreen);
      Get.to(EnterFirstNameDetailScreen(),transition: Transition.rightToLeft);
    }
  }

}
