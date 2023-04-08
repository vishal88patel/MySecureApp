import 'dart:io';
import 'package:get/get.dart';


class WebviewScreenController extends GetxController {
  var arguments = Get.arguments;
  var appBarName = ''.obs;
  var webLink = ''.obs;
  var userAgent = ''.obs;
  RxDouble loadingValue = 0.0.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
    setUserAgentForWebView();
    getArguments();
  }

  getArguments() {
    if (arguments != null) {
      appBarName.value = arguments['appBarName'];
      webLink.value = arguments['webLink'];
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setUserAgentForWebView() {
    if (Platform.isAndroid) {
      userAgent.value = "[ANDROID-WV]";
    } else {
      userAgent.value = "[IOS-WV]";
    }
  }
}
