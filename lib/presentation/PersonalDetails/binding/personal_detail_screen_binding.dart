import '../controller/personal_detail_screen_controller.dart';
import 'package:get/get.dart';

class PersonalScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PersonalScreenController());
  }
}
