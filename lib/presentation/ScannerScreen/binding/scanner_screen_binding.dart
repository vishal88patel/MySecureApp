import '../controller/scanner_screen_controller.dart';
import 'package:get/get.dart';

class ScannerScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScannerScreenController());
  }
}
