import 'package:get/get.dart';

import '../controller/cc_address_controller.dart';

class CCAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CCAddressController());
  }
}
