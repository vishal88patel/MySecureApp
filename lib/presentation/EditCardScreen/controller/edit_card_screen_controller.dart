import 'dart:convert';

import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../../utils/HelperFiles/ui_utils.dart';


class EditCardController extends GetxController {

  TextEditingController nameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  var readOnly = false.obs;
  var cardId = "".obs;
  var cardName = "".obs;
  var cardNumber = "".obs;
  var cardMonth = "".obs;
  var cardYear = "".obs;
  var cardCvv = "".obs;
  var cardType = "".obs;
  var arguments = Get.arguments;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getArguments();


    super.onInit();
  }

  void getArguments() {
    if (arguments != null) {
      cardId.value =  arguments['id'];
       cardName.value =  arguments['cardName'];
       cardNumber.value =  arguments['cardNumber'];
       cardMonth.value =  arguments['expireMonth'];
       cardYear.value = arguments['expireYear'];
       cardCvv.value =  arguments['cardCvv'];
       cardType.value =  arguments['cardType'];
       setData();
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
  void onClickOfUpdateCardButton(BuildContext context) {

    var expDate=expDateController.text.split("/");
    var now = new DateTime.now();
    var formatterMonth = new DateFormat('MM');
    var formatterYear = new DateFormat('yyyy');
    String month = formatterMonth.format(now);
    String year = formatterYear.format(now);
    print("${expDate[0]},${expDate[1]},$month,${year.substring(2,4)}");
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
    }else if (int.parse(expDate[0])>12) {
      UIUtils.showSnakBar(
          bodyText: "Please enter valid expiry month and year",
          headerText: StringConstants.ERROR);
    } else if (int.parse(expDate[1])<int.parse(year.substring(2,4))) {
      UIUtils.showSnakBar(
          bodyText: "Expiry date should be greater than current month and year",
          headerText: StringConstants.ERROR);
    } else if (int.parse(expDate[1])<=int.parse(year.substring(2,4)) && int.parse(expDate[1]) == int.parse(year.substring(2,4)) && int.parse(expDate[0])<=int.parse(month)) {
      UIUtils.showSnakBar(
          bodyText: "Expiry date should be greater than current month and year",
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
      checkCardType(cardNumberController.text,context);
    }
  }
  void setData(){
    nameController.text=cardName.value.toString();
    cardNumberController.text=cardNumber.value.toString();
    expDateController.text=cardMonth.value.toString()+"/"+cardYear.value.toString();
    cvvController.text=cardCvv.value.toString();
  }
  void checkCardType(String number,BuildContext context) {
    var type = detectCCType(number);
    // assert(type == CreditCardType.visa);
    switch (type) {
      case CreditCardType.visa:
        callUpdateCardApi("visa",context);
        break;

      case CreditCardType.mastercard:
        callUpdateCardApi("mastercard",context);

        break;
      case CreditCardType.discover:
        callUpdateCardApi("discover",context);

        break;

      case CreditCardType.dinersclub:
        callUpdateCardApi("dinersclub",context);

        break;

      case CreditCardType.jcb:
        callUpdateCardApi("jcb",context);

        break;

      case CreditCardType.unionpay:
        callUpdateCardApi("unionpay",context);

        break;

      case CreditCardType.maestro:
        callUpdateCardApi("maestro",context);

        break;

      case CreditCardType.mir:
        callUpdateCardApi("mir",context);

        break;

      case CreditCardType.elo:
        callUpdateCardApi("elo",context);

        break;

      default:
        callUpdateCardApi("any",context);
        break;
    }
  }

  Future<void> callUpdateCardApi(String type ,BuildContext context) async {
    //UIUtils.showProgressDialog(isCancellable: false);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
      'Bearer ${await PrefUtils.getString(StringConstants.AUTH_TOKEN)}',
    };

    var request =
    http.MultipartRequest('POST', Uri.parse(ApiEndPoints.SAVE_CREDITCARD));

    request.headers.addAll(headers);
    request.fields['id'] = cardId.value;
    request.fields['holder_name'] = nameController.text;
    request.fields['card_number'] = cardNumberController.text;
    request.fields['expire_year'] = expDateController.text.split("/")[1];
    request.fields['expire_month'] = expDateController.text.split("/")[0];
    request.fields['cvv'] = cvvController.text;
    request.fields['card_type'] = cardType.value;

    var response = await request.send();

    var responsed = await http.Response.fromStream(response);
    final responseData = json.decode(responsed.body);
    print(responseData.toString());
    if (response.statusCode == 200) {
      //UIUtils.hideProgressDialog();
      UIUtils.showSnakBar(
          bodyText: "Card Update Successfully",
          headerText: StringConstants.SUCCESS);


      Future.delayed(Duration(milliseconds: 1000), () {
        Navigator.pop(context);
      });


    } else {
      //UIUtils.hideProgressDialog();
      UIUtils.showSnakBar(
          bodyText: responseData['message'],
          headerText: StringConstants.SUCCESS);
    }
  }

  Future<void> DeleteCardApi(BuildContext context) async {
    // UIUtils.showProgressDialog(isCancellable: false);
    ApiService()
        .callPostApi(
        body: await DeleteCardApiBody(),
        headerWithToken: true,
        showLoader: true,
        url: ApiEndPoints.DELETE_CARD)
        .then((value) {
      print(value);
      if (value['status']) {
        UIUtils.showSnakBar(
            bodyText: value['message']??'', headerText: StringConstants.SUCCESS);
        Future.delayed(Duration(milliseconds: 1000), () {
          Navigator.pop(context);
        });
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message']??'', headerText: StringConstants.ERROR);

      }
    });
  }
  Future<FormData> DeleteCardApiBody() async {
    final form = FormData({
      "id": cardId.value,
    });
    return form;
  }
}
