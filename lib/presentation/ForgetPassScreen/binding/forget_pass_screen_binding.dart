import '../controller/forget_pass_screen_controller.dart';
import 'package:get/get.dart';

class ForgetPassScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPassScreenController());
  }
}
