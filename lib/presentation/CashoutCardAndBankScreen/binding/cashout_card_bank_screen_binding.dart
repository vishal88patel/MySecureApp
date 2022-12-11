import '../controller/cashout_card_bank_screen_controller.dart';
import 'package:get/get.dart';

class CashoutCardBankBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CashoutCardBankController());
  }
}
