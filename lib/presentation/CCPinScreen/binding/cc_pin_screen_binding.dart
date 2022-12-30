import 'package:get/get.dart';

import '../controller/cc_pin_controller.dart';

class CCPinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CCPinController());
  }
}
