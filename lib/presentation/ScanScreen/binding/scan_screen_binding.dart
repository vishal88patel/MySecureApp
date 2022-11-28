import 'package:get/get.dart';
import '../controller/scan_screen_controller.dart';

class ScanScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScanScreenController());
  }
}
