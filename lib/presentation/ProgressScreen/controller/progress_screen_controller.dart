import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class ProgressScreenController extends GetxController {
  var arguments = Get.arguments;
  var destinationScreen;

  // "BANK_IMAGE": bankImage,
  // "BANK_NAME": bankName,
  var bankName = "".obs;

  var bankImage = "".obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getArguments();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getArguments() {
    if (arguments != null) {
      destinationScreen = arguments['destinationRoute'];
      bankName.value = arguments['BANK_NAME'];
      bankImage.value = arguments['BANK_IMAGE'];
      Future.delayed(Duration(milliseconds: 2500), () {
        // Get.toNamed(destinationScreen,);
        Get.toNamed(AppRoutes.successScreen, arguments: {
          "destinationRoute": destinationScreen,
          "BANK_NAME": bankName.value,
          "BANK_IMAGE": bankImage.value,
        });
      });
    }
  }
}
