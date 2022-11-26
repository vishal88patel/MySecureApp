import 'package:get/get.dart';

import '../controller/enter_password_screen_controller.dart';

class EnterPasswordScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EnterPasswordScreenController());
  }
}
