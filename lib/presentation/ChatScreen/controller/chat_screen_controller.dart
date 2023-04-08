
import 'dart:io';

import 'package:get/get.dart';



class ChatScreenController extends GetxController {
  var arguments = Get.arguments;
  var appBarName = ''.obs;
  var webLink = ''.obs;
  var userAgent = ''.obs;
  RxDouble loadingValue = 0.0.obs;
  var isLoading =true.obs;


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    setUserAgentForWebView();
    getArguments();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
  getArguments() {
    if (arguments != null) {
      appBarName.value = arguments['appBarName'];
      webLink.value = arguments['webLink'];
    }
  }

  void setUserAgentForWebView() {
    if (Platform.isAndroid) {
      userAgent.value = "[ANDROID-WV]";
    } else {
      userAgent.value = "[IOS-WV]";
    }
  }
}
