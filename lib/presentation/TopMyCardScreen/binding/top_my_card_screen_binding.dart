import 'package:get/get.dart';

import '../controller/top_my_card_screen_controller.dart';

class TopMyCardScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TopMyCardScreenController());
  }
}
