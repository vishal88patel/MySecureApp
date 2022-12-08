import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';



class ScanScreenController extends GetxController {
  var qrCodeResult="".obs;
  TextEditingController passController = TextEditingController();
  var passIsObsecure = true.obs;
  QRViewController? controller;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();

  }
  Future<void> cameraStart() async {
    Future.delayed(Duration(milliseconds: 100), () {
      controller?.resumeCamera();
    });
  }

  @override
  void onClose() {
    controller?.dispose();
    super.onClose();
  }
  void onTapOfPassObsecure(bool val) {
    passIsObsecure.value = !val;
  }

}
