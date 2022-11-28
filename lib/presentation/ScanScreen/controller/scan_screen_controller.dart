import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';



class ScanScreenController extends GetxController {
  var qrCodeResult="".obs;
  TextEditingController passController = TextEditingController();
  var passIsObsecure = true.obs;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
  void onTapOfPassObsecure(bool val) {
    passIsObsecure.value = !val;
  }

}
