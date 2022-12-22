import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../LoginScreen/models/login_response_model.dart';
import '../../NormalScreen/WelcomeScreen.dart';
import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'dart:convert';
import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../camera_screen.dart';


class LinkCardAddCardController extends GetxController {

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


  void onClickOfAddCardButton(BuildContext context) {
    var expDate=expDateController.text.split("/");
    var now = new DateTime.now();
    var formatterMonth = new DateFormat('MM');
    var formatterYear = new DateFormat('yyyy');
    String month = formatterMonth.format(now);
    String year = formatterYear.format(now);

    print("expmonth"+int.parse(expDate[0]).toString()+":"+month.toString()+"----"+"expmonth"+int.parse(expDate[1]).toString()+":"+year.substring(2,4).toString());
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
    } else if (int.parse(expDate[1])<=int.parse(year.substring(2,4))) {
      if(int.parse(expDate[1]) == int.parse(year.substring(2,4)) && int.parse(expDate[0])<=int.parse(month)){
        UIUtils.showSnakBar(
            bodyText: "Please enter valid expiry month and year",
            headerText: StringConstants.ERROR);
      }else{
        UIUtils.showSnakBar(
            bodyText: "Please enter valid expiry year and year",
            headerText: StringConstants.ERROR);
      }

    } else if (!expDateController.text.contains("/") || expDateController.text.length!=5) {
      UIUtils.showSnakBar(
          bodyText: "Please enter proper expiry month and year(exp:12/34)",
          headerText: StringConstants.ERROR);
    } else if (cvvController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter CVV",
          headerText: StringConstants.ERROR);

    }
    /*  else if (netImage1.toString().isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please Select Card Front Image",
          headerText: StringConstants.ERROR);
    } else if (netImage2.toString().isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please Select Card Back Image",
          headerText: StringConstants.ERROR);
    } */
    else {
      //checkCardType(cardNumberController.text);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const LinkCardCameraScreen(
              image: 1,title: 'Scan the front of your card',
            )),
      );
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

  void checkCardImage(String number) {
    var type = detectCCType(number);

    switch (type) {
      case CreditCardType.visa:
        cardTypeImage.value="asset/icons/ic_visa.png";
        break;

      case CreditCardType.mastercard:
        cardTypeImage.value="asset/icons/master_card_back.png";
        break;
      default:
        cardTypeImage.value="";
        break;
    }
  }


}
