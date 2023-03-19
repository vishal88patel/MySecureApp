import 'package:get/get.dart';

import '../controller/privacy_details_screen_controller.dart';

class PrivacyDetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PrivacyDetailsScreenController());
  }
}
