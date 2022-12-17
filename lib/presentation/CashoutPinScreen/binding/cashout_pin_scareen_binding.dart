import '../controller/cashout_pin_scareen_controller.dart';
import 'package:get/get.dart';

class CashoutPinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CashoutPinController());
  }
}
