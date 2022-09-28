import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';



class CardScreenController extends GetxController {

  TextEditingController nameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

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

  void onClickOfAddCardButton() {
    if (nameController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter card holder name",
          headerText: StringConstants.ERROR);
    } else if (cardNumberController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter job title",
          headerText: StringConstants.ERROR);
    } else if (expDateController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter expiry month and year",
          headerText: StringConstants.ERROR);
    } else if (cvvController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter CVC",
          headerText: StringConstants.ERROR);
    } else {
      callAddCardApi();
      // Get.toNamed(AppRoutes.personalDetailScreen);
    }
  }

  Future<void> callAddCardApi() async {
    ApiService()
        .callPostApi(
        body: await getRegisterBody(
            holder_name: nameController.text,
            card_number: cardNumberController.text,
            expire_year: expDateController.text.split("/")[1],
            expire_month: expDateController.text.split("/")[0],
            cvv: cvvController.text,
            card_type: "1",
        ),
        headerWithToken: false,
        url: ApiEndPoints.SAVE_CREDITCARD)
        .then((value) {
      print(value);
      if (value['status']) {
        UIUtils.showSnakBar(bodyText: value['message'], headerText: StringConstants.SUCCESS);
        Get.offAllNamed(AppRoutes.progressScreen);
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getRegisterBody({
    required String holder_name,
    required String card_number,
    required String expire_year,
    required String expire_month,
    required String cvv,
    required String card_type,
  }) async {
    final form = FormData({
      "holder_name": holder_name,
      "card_number": card_number,
      "expire_year": expire_year,
      "expire_month": expire_month,
      "cvv": cvv,
      "card_type": card_type,
    });
    return form;
  }

}
