import '../controller/success_screen_controller.dart';
import 'package:get/get.dart';

class SuccessScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SuccessScreenController());
  }
}
