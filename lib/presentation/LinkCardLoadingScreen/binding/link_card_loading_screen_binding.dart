
import 'package:get/get.dart';

import '../controller/link_card_loading_screen_controller.dart';

class LinkCardLoadingScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LinkCardLoadingController());
  }
}
