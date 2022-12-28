import 'package:get/get.dart';

import '../controller/cc_intro_controller.dart';

class CCIntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CCIntroController());
  }
}
