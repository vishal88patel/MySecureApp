import 'package:get/get.dart';

import '../controller/cashout_card_list_screen_controller.dart';

class CashoutCardListScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CashoutCardListScreenController());
  }
}
