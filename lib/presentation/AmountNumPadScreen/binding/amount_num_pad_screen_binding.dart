import '../controller/amount_num_pad_screen_controller.dart';
import 'package:get/get.dart';

class AmountNumPadScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AmountNumPadScreenController());
  }
}
