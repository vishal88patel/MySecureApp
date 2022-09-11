import '../controller/transaction_screen_controller.dart';
import 'package:get/get.dart';

class TransactionScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransactionScreenController());
  }
}
