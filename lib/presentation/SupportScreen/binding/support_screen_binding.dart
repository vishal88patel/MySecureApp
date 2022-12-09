import '../controller/support_screen_controller.dart';
import 'package:get/get.dart';

class SupportScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SupportScreenController());
  }
}
