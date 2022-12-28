import 'package:get/get.dart';

import '../controller/cc_success_controller.dart';

class CCSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CCSuccessController());
  }
}
