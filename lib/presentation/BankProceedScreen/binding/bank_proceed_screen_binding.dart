import 'package:get/get.dart';
import '../controller/bank_proceed_screen_controller.dart';

class BankProceedScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BankProceedScreenController());
  }
}
