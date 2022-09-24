import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/routes/app_routes.dart';

import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';

class EnterPersonalScreenController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController address01Controller = TextEditingController();
  TextEditingController address02Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController ssnController = TextEditingController();

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
    if (firstNameController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter first name",
          headerText: StringConstants.ERROR);
    } else if (lastNameController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter last name",
          headerText: StringConstants.ERROR);
    }else if (address01Controller.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter first address",
          headerText: StringConstants.ERROR);
    } else if (address02Controller.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter second address",
          headerText: StringConstants.ERROR);
    } else if (cityController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter city", headerText: StringConstants.ERROR);
    } else if (stateController.text.length < 4) {
      UIUtils.showSnakBar(
          bodyText: "Please enter state", headerText: StringConstants.ERROR);
    } else if (zipCodeController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter zipcode", headerText: StringConstants.ERROR);
    } else if (ssnController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter SSN", headerText: StringConstants.ERROR);
    } else {
      Get.toNamed(AppRoutes.personalDetailScreen);
    }
  }
}
