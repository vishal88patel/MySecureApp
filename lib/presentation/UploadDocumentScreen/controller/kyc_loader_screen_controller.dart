import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/presentation/UploadDocumentScreen/controller/uplod_document_screen_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/network_info.dart';
import '../../../routes/app_routes.dart';



class KycLoaderController extends GetxController {
  var documentController = Get.find<UploadDocumentScreenController>();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    documentController.onClickOfSubmitButton();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
