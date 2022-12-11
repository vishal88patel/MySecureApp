import 'dart:convert';

import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../App Configurations/api_endpoints.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../../LinkCardAddCardScreen/controller/link_card_add_card_screen_controller.dart';
import '../../LoginScreen/models/login_response_model.dart';
import '../../NormalScreen/WelcomeScreen.dart';

class LinkCardEditCardController extends GetxController {
  var cardController = Get.put(LinkCardAddCardController());
  TextEditingController nameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  var readOnly = true.obs;
  var cardName = "".obs;
  var cardNumber = "".obs;
  var cardDate = "".obs;
  var cardCvv = "".obs;

  var progress1 = false.obs;
  var progress2 = false.obs;
  var progress3 = false.obs;
  var progress4 = false.obs;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    setData();

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
  void setData(){
    nameController.text=cardController.nameController.text.toString();
    cardNumberController.text=cardController.cardNumberController.text.toString();
    expDateController.text=cardController.expDateController.text.toString();
    cvvController.text=cardController.cvvController.text.toString();
    cardName.value=cardController.nameController.text.toString();
    cardNumber.value=cardController.cardNumberController.text.toString();
    cardDate.value=cardController.expDateController.text.toString();
    cardCvv.value=cardController.cvvController.text.toString();
  }
  void progress(String number){
    progress1.value=true;
    Future.delayed(Duration(milliseconds: 1000), () {
      progress2.value=true;
      Future.delayed(Duration(milliseconds: 1000), () {
        progress3.value=true;
        checkCardType(number);
      });
    });
  }

  void checkCardType(String number) {
    var type = detectCCType(number);
    // assert(type == CreditCardType.visa);
    switch (type) {
      case CreditCardType.visa:
        callAddCardApi("visa");
        break;

      case CreditCardType.mastercard:
        callAddCardApi("mastercard");

        break;
      case CreditCardType.discover:
        callAddCardApi("discover");

        break;

      case CreditCardType.dinersclub:
        callAddCardApi("dinersclub");

        break;

      case CreditCardType.jcb:
        callAddCardApi("jcb");

        break;

      case CreditCardType.unionpay:
        callAddCardApi("unionpay");

        break;

      case CreditCardType.maestro:
        callAddCardApi("maestro");

        break;

      case CreditCardType.mir:
        callAddCardApi("mir");

        break;

      case CreditCardType.elo:
        callAddCardApi("elo");

        break;

      default:
        callAddCardApi("any");
        break;
    }
  }

  Future<void> callAddCardApi(String type) async {
    //UIUtils.showProgressDialog(isCancellable: false);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
      'Bearer ${await PrefUtils.getString(StringConstants.AUTH_TOKEN)}',
    };

    var request =
    http.MultipartRequest('POST', Uri.parse(ApiEndPoints.SAVE_CREDITCARD));

    request.headers.addAll(headers);
    request.fields['holder_name'] = nameController.text;
    request.fields['card_number'] = cardNumberController.text;
    request.fields['expire_year'] = expDateController.text.split("/")[1];
    request.fields['expire_month'] = expDateController.text.split("/")[0];
    request.fields['cvv'] = cvvController.text;
    request.fields['card_type'] = type;

    request.files.add(
        await http.MultipartFile.fromPath("card_front",cardController.netImage1.value));

    request.files.add(
        await http.MultipartFile.fromPath("card_back", cardController.netImage2.value));
    var response = await request.send();

    var responsed = await http.Response.fromStream(response);
    final responseData = json.decode(responsed.body);
    print(responseData.toString());
    if (response.statusCode == 200) {
      progress4.value=true;
      //UIUtils.hideProgressDialog();
      UIUtils.showSnakBar(
          bodyText: "Card Added Successfully",
          headerText: StringConstants.SUCCESS);
      Get.toNamed(AppRoutes.linkCardSuccessScreen);
    } else {
      //UIUtils.hideProgressDialog();
      UIUtils.showSnakBar(
          bodyText: responseData['message'],
          headerText: StringConstants.SUCCESS);
    }
  }
}
