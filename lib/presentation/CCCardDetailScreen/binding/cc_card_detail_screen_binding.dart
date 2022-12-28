import 'package:get/get.dart';

import '../controller/cc_card_detail_controller.dart';

class CCCardDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CCCardDetailController());
  }
}
