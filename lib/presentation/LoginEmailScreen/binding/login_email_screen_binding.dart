import '../controller/login_email_screen_controller.dart';
import 'package:get/get.dart';

class LoginEmailScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginEmailScreenController());
  }
}
