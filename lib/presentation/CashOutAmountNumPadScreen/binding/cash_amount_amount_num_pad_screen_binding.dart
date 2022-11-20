import '../controller/cash_out_amount_num_pad_screen_controller.dart';
import 'package:get/get.dart';

class CashOutAmountNumPadScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CashOutAmountNumPadScreenController());
  }
}
