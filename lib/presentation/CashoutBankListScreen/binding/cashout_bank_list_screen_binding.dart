import '../controller/cashout_bank_list_screen_controller.dart';
import 'package:get/get.dart';

class CashoutBankListScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CashoutBankListScreenController());
  }
}
