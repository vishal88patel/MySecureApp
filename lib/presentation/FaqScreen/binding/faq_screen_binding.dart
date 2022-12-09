import '../controller/faq_screen_controller.dart';
import 'package:get/get.dart';

class FaqScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FaqScreenController());
  }
}
