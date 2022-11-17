import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../../loader_screen.dart';

class CreatePasswordScreenController extends GetxController {
  TextEditingController createPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  var createPaasIsObsecure = true.obs;
  var confirmPassIsObsecure = true.obs;

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
    createPaasIsObsecure.value = !val;
  }

  void onTapOfConfirmPassObsecure(bool val) {
    confirmPassIsObsecure.value = !val;
  }

  void onTapOfNextButton() {
    if (createPassController.text.isEmpty) {
      UIUtils.showSnakBar(
        headerText: StringConstants.ERROR,
        bodyText: "Please enter password",
      );
    } else if (confirmPassController.text.isEmpty) {
      UIUtils.showSnakBar(
        headerText: StringConstants.ERROR,
        bodyText: "Please enter confirm Password",
      );
    } else if (createPassController.text != confirmPassController.text) {
      UIUtils.showSnakBar(
        headerText: StringConstants.ERROR,
        bodyText: "Password did not matched",
      );
    } else {
      // Get.toNamed(AppRoutes.enterLegalNameScreen);
      Get.to(
          () => LoaderScreen(
                AppRoutes.enterLegalNameScreen,
              ),
          transition: Transition.rightToLeft);
      // Get.to(EnterFirstNameDetailScreen(),transition: Transition.rightToLeft);
    }
  }
}
