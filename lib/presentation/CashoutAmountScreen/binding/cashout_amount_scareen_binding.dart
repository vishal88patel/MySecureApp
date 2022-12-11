import '../controller/cashout_amount_scareen_controller.dart';
import 'package:get/get.dart';

class CashoutAmountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CashoutAmountController());
  }
}
