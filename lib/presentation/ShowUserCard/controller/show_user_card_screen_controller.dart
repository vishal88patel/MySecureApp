import 'dart:convert';

import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../App Configurations/api_endpoints.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/math_utils.dart';
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../../LinkCardAddCardScreen/controller/link_card_add_card_screen_controller.dart';
import '../../LoginScreen/models/login_response_model.dart';
import '../../NormalScreen/WelcomeScreen.dart';

class ShowUserCardScreenCardController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController routingNumber = TextEditingController();
  TextEditingController bankAccountNumber = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  var readOnly = true.obs;
  var cardName = "".obs;
  var usercardNumber = "".obs;
  var usercardDate = "".obs;
  var cardCvv = "".obs;
  var isCvvHide=true.obs;

  var progress1 = false.obs;
  var progress2 = false.obs;
  var progress3 = false.obs;
  var progress4 = false.obs;

  Rx<LoginResponseModel> loginModel=LoginResponseModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getStroredData();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
  void onClickOfAddCardButton(BuildContext context) {
    if (nameController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter card holder name",
          headerText: StringConstants.ERROR);
    } else if (cardNumberController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter card number",
          headerText: StringConstants.ERROR);
    } else if (cardNumberController.text.trim().length<12) {
      UIUtils.showSnakBar(
          bodyText: "Please enter 12 digit card number",
          headerText: StringConstants.ERROR);
    } else if (expDateController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter expiry month and year",
          headerText: StringConstants.ERROR);
    } else if (!expDateController.text.contains("/") || expDateController.text.length!=5) {
      UIUtils.showSnakBar(
          bodyText: "Please enter proper expiry month and year(exp:12/34)",
          headerText: StringConstants.ERROR);
    } else if (cvvController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter CVV",
          headerText: StringConstants.ERROR);
    }
    else{
      Get.toNamed(AppRoutes.linkCardLoadingScreen);
    }
  }



  Future<void> getStroredData() async {
    loginModel.value = (await PrefUtils.getLoginModelData(StringConstants.LOGIN_RESPONSE))!;
    nameController.text=loginModel.value.data!.firstName.toString()+" "+ loginModel.value.data!.lastName.toString();
    cardNumberController.text=loginModel.value.data!.cardNumber.toString();
    bankAccountNumber.text=loginModel.value.data!.accountNumber.toString();
    routingNumber.text=loginModel.value.data!.routeNumber.toString();
    expDateController.text=dateConverter(loginModel.value.data!.expiredAt.toString()).substring(0,5);
    cvvController.text=loginModel.value.data!.cvv.toString();
    cardName.value=nameController.text.toString();
    usercardNumber.value=cardNumberController.text.toString();
    usercardDate.value=expDateController.text.toString();
    cardCvv.value=cvvController.text.toString();
  }

  void onTapOfPassObsecure(value) {
    isCvvHide.value=!value;
  }
}
