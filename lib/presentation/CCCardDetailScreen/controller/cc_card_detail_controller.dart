import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:secure_cash_app/presentation/ScanScreen/controller/scan_screen_controller.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import 'package:http/http.dart' as http;
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../CashoutAmountScreen/controller/cashout_amount_scareen_controller.dart';
import '../../CashoutAmountScreen/model/getWallet.dart';
import '../../CashoutPinScreen/cashout_failed_screen.dart';
import '../../LoginScreen/models/login_response_model.dart';
import '../../NormalScreen/WelcomeScreen.dart';
import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import 'package:intl/intl.dart';

import '../../ScanScreen/scan_success_screen.dart';
import '../cc_camera_screen.dart';



class CCCardDetailController extends GetxController {
  var showCard = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  var arguments = Get.arguments;
  var netImage1 = "".obs;
  var netImage2 = "".obs;
  var id = "".obs;
  var cardTypeImage = "".obs;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getArguments();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getArguments(){

    if (arguments != null) {
      id.value = arguments['id'];
      print(id.value.toString());
    }

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
    } else if (int.parse(expDate[0])>12) {
      UIUtils.showSnakBar(
          bodyText: "Please enter valid expiry month and year",
          headerText: StringConstants.ERROR);
    } else if (int.parse(expDate[1])<=int.parse(year.substring(2,4))) {
      if(int.parse(expDate[1]) == int.parse(year.substring(2,4)) && int.parse(expDate[0])<=int.parse(month)){
        UIUtils.showSnakBar(
            bodyText: "Expiry date should be greater than current month and year",
            headerText: StringConstants.ERROR);
      }else{
        UIUtils.showSnakBar(
            bodyText: "Expiry date should be greater than current month and year",
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
    else {
      //checkCardType(cardNumberController.text);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const CCCardCameraScreen(
              image: 1,title: 'Scan the front of your card',
            )),
      );
    }
  }

  Future<void> callAddCardApi() async {
    UIUtils.showProgressDialog(isCancellable: false);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
      'Bearer ${await PrefUtils.getString(StringConstants.AUTH_TOKEN)}',
    };

    var request =
    http.MultipartRequest('POST', Uri.parse(ApiEndPoints.ACTIVE_CASHCARD));

    request.headers.addAll(headers);
    request.fields['card_number'] = cardNumberController.text.replaceAll(" ", "");
    request.fields['exp_year'] ="20${expDateController.text.split("/")[1]}";
    request.fields['exp_month'] =expDateController.text.split("/")[0].toString();
    request.fields['cvv'] = cvvController.text;
    request.fields['id'] = id.value;

    request.files.add(
        await http.MultipartFile.fromPath("card_front_image",netImage1.value));

    request.files.add(
        await http.MultipartFile.fromPath("card_back_image", netImage2.value));
    var response = await request.send();

    var responsed = await http.Response.fromStream(response);
    final responseData = json.decode(responsed.body);
    print(responseData.toString());
    if (responseData['status']) {
      UIUtils.hideProgressDialog();
      UIUtils.showSnakBar(
          bodyText: "Card Activated Successfully",
          headerText: StringConstants.SUCCESS);
      Get.toNamed(AppRoutes.ccCardSuccessScreen);
    } else {
      Get.back();
      Get.back();
      UIUtils.hideProgressDialog();
      UIUtils.showSnakBar(
          bodyText: responseData['message'],
          headerText: StringConstants.SUCCESS);
    }
  }


}
