import '../controller/auth_option_screen_controller.dart';
import 'package:get/get.dart';

class AuthOptionScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthOptionScreenController());
  }
}
