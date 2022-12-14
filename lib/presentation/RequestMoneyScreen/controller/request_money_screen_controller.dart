import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/utils/ConstantsFiles/string_constants.dart';
import 'package:secure_cash_app/utils/HelperFiles/ui_utils.dart';



class RequestMoneyScreenController extends GetxController {
  TextEditingController toController = TextEditingController();
  TextEditingController forNoteController = TextEditingController();
  TextEditingController amountCtrl = TextEditingController();

  List<String> imageList =['asset/icons/profile_image.png','asset/icons/profile_image.png','asset/icons/profile_image.png','asset/icons/profile_image.png','asset/icons/profile_image.png','asset/icons/profile_image.png'];
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

  void onTapNextButton(){
    if(toController.text.isEmpty){
      UIUtils.showSnakBar(
          bodyText: "Please Enter Name, \$Cashtag , Email",
          headerText: StringConstants.ERROR);
    }else{

      Get.toNamed(AppRoutes.requestMoneyAmountScreen);
    }
  }


}
