import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:secureapp/presentation/EnterLegalNameDetails/enter_middle_name_screen.dart';
import 'package:secureapp/routes/app_routes.dart';

import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../../loader_screen.dart';

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


  Future<void> checkCashTagValidation() async {
    ApiService()
        .callPostApi(
        body: await getBody(secureTagController.text),
        headerWithToken: false,
        url: ApiEndPoints.CHECK_CASHTAG_VALIDATION)
        .then((value) {
      print(value);
      if (value['status']) {
        Get.to(()=>
            LoaderScreen(AppRoutes.enterAddressScreen),
            transition: Transition.rightToLeft);
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getBody(String text) async {
    final form = FormData({"cashtag": text});
    print(form.toString());
    return form;
  }
}
