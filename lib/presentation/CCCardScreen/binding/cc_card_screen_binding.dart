import 'package:get/get.dart';

import '../controller/cc_card_controller.dart';

class CCCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CCCardController());
  }
}
