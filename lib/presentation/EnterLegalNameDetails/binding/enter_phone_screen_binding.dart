import '../controller/enter_legel_name_screen_controller.dart';
import 'package:get/get.dart';

import '../controller/enter_phone_screen_controller.dart';

class EnterPhoneScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EnterPhoneScreenController());
  }
}
