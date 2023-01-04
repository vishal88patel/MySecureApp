import 'package:get/get.dart';

import '../controller/cc_card_list_controller.dart';

class CCCardListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CCCardListController());
  }
}
