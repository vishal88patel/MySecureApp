import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/presentation/EnterLegalNameDetails/enter_middle_name_screen.dart';
import 'package:my_secure_app/routes/app_routes.dart';

import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';

class EnterLegalNameScreenController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController secureTagController = TextEditingController();



  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    secureTagController = TextEditingController(text: '\$');
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
    } else if (middleNameController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter middle name",
          headerText: StringConstants.ERROR);
    }else if (lastNameController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter last name",
          headerText: StringConstants.ERROR);
    } else {
      // Get.toNamed(AppRoutes.enterAddressScreen);

      // Get.to(EnterMiddleNameDetailScreen(),
      //   transition: Transition.rightToLeft,
      //   duration:   Duration(milliseconds: 500),);
    }
  }
}
