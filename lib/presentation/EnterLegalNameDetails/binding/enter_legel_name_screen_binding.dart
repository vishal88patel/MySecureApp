import '../controller/enter_legel_name_screen_controller.dart';
import 'package:get/get.dart';

class EnterLegalNameScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EnterLegalNameScreenController());
  }
}
