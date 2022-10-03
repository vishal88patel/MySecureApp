import 'package:get/get.dart';
import '../controller/add_bank_proceed_screen_controller.dart';

class AddBankProceedScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddBankProceedScreenController());
  }
}
