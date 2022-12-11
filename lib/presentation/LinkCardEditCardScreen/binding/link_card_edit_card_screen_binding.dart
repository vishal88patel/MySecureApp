import '../controller/link_card_edit_card_screen_controller.dart';
import 'package:get/get.dart';

class LinkCardEditCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LinkCardEditCardController());
  }
}
