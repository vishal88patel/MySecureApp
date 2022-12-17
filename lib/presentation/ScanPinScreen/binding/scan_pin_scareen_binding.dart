import 'package:get/get.dart';

import '../controller/scan_pin_controller.dart';

class ScanPinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScanPinController());
  }
}
