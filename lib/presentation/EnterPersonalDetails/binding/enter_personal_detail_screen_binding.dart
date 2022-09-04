import '../controller/enter_personal_detail_screen_controller.dart';
import 'package:get/get.dart';

class EnterPersonalScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EnterPersonalScreenController());
  }
}
