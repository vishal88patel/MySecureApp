import 'package:get/get.dart';

import '../controller/cc_order_controller.dart';

class CCOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CCOrderController());
  }
}
