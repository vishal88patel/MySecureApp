import 'package:get/get.dart';

import '../controller/cc_style_controller.dart';

class CCStyleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CCStyleController());
  }
}
