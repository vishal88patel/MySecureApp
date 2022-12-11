import 'package:get/get.dart';

import '../controller/topup_card_list_screen_controller.dart';


class TopupCardListScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TopupCardListScreenController());
  }
}
