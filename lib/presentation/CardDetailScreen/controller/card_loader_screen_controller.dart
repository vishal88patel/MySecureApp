import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/presentation/UploadDocumentScreen/controller/uplod_document_screen_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/network_info.dart';
import '../../../routes/app_routes.dart';
import 'card_detail_screen_controller.dart';



class CardLoaderController extends GetxController {
  var cardController = Get.find<CardScreenController>();
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    cardController.checkCardType(cardController.cardNumberController.text);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
