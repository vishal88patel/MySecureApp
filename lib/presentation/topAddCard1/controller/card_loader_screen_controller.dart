import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:secureapp/presentation/topEditCardConfirm/controller/top_edit_card_confirm_screen_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/network_info.dart';
import '../../../routes/app_routes.dart';
import 'package:secureapp/presentation/topAddCard1/controller/top_add_card1_screen_controller.dart';




class CardLoaderController extends GetxController {
  var cardController = Get.find<TopEditCardConfirmController>();
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    cardController.progress(cardController.cardNumberController.text);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
