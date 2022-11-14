import 'dart:convert';
import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../../utils/HelperFiles/ui_utils.dart';



class CardScreenController extends GetxController {

  TextEditingController nameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  var netImage1 = "".obs;
  var netImage2 = "".obs;
  var cardTypeImage = "".obs;

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
          bodyText: "Please enter card number",
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
    } else if (netImage1.toString().isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please Select Card Front Image",
          headerText: StringConstants.ERROR);
    } else if (netImage2.toString().isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please Select Card Back Image",
          headerText: StringConstants.ERROR);
    } else {
      checkCardType(cardNumberController.text);
      // Get.toNamed(AppRoutes.personalDetailScreen);
    }
  }

  /*Future<void> callAddCardApi(String type) async {
    ApiService()
        .callPostApi(
        body: await getRegisterBody(
            holder_name: nameController.text,
            card_number: cardNumberController.text,
            expire_year: expDateController.text.split("/")[1],
            expire_month: expDateController.text.split("/")[0],
            cvv: cvvController.text,
            card_type: type,
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
  }*/

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
        UIUtils.showSnakBar(
          headerText: StringConstants.ERROR,
          bodyText: "Please enter Valid card",
        );
        break;
    }
  }

  void checkCardImage(String number) {
    var type = detectCCType(number);

    switch (type) {
      case CreditCardType.visa:
        cardTypeImage.value="asset/Visa_image.png";
        break;

      case CreditCardType.mastercard:
        cardTypeImage.value="asset/master_card_back.png";
        break;
      default:
        cardTypeImage.value="";
        break;
    }
  }

  Future<void> callAddCardApi(String type) async {
    UIUtils.showProgressDialog(isCancellable: false);
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
        await http.MultipartFile.fromPath("card_front", netImage1.value));

    request.files.add(
        await http.MultipartFile.fromPath("card_back", netImage2.value));
    var response = await request.send();

    var responsed = await http.Response.fromStream(response);
    final responseData = json.decode(responsed.body);

    if (response.statusCode == 200) {
      UIUtils.hideProgressDialog();
      UIUtils.showSnakBar(
          bodyText: "Card Added Successfully",
          headerText: StringConstants.SUCCESS);
      Get.offAllNamed(AppRoutes.dashBoardScreen,
          arguments: {"bottomTabCount": 0});
    } else {
      UIUtils.hideProgressDialog();
      UIUtils.showSnakBar(
          bodyText: responseData['message'],
          headerText: StringConstants.SUCCESS);
    }
  }
}
