import '../controller/create_password_screen_controller.dart';
import 'package:get/get.dart';

class CreatePasswordScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreatePasswordScreenController());
  }
}
