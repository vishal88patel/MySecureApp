import '../controller/pin_screen_controller.dart';
import 'package:get/get.dart';

class PinScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PinScreenController());
  }
}
