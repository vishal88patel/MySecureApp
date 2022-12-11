import '../controller/link_card_success_screen_controller.dart';
import 'package:get/get.dart';

class LinkCardSuccessScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LinkCardSuccessScreenController());
  }
}
