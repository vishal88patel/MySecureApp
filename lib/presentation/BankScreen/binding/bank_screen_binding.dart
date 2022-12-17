import '../controller/bank_screen_controller.dart';
import 'package:get/get.dart';

class BankScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BankScreenController());
  }
}
