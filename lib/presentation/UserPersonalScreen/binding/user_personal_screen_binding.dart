import '../controller/user_personal_screen_controller.dart';
import 'package:get/get.dart';

class UserPersonalScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserPersonalScreenController());
  }
}
