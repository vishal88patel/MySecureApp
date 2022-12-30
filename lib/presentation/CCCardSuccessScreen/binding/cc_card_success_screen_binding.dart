import 'package:get/get.dart';

import '../controller/cc_card_success_controller.dart';

class CCCardSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CCCardSuccessController());
  }
}
