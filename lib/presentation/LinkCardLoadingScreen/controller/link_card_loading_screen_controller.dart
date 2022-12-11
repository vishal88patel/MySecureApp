import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/network_info.dart';
import '../../../routes/app_routes.dart';
import '../../LinkCardEditCardScreen/controller/link_card_edit_card_screen_controller.dart';




class LinkCardLoadingController extends GetxController {
  var cardController = Get.find<LinkCardEditCardController>();
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
