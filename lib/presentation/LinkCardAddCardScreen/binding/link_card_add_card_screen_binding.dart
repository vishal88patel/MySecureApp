import 'package:get/get.dart';

import '../controller/link_card_add_card_screen_controller.dart';

class LinkCardAddCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LinkCardAddCardController());
  }
}
