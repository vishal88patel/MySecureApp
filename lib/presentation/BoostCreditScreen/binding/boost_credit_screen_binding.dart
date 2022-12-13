import '../controller/boost_credit_screen_controller.dart';
import 'package:get/get.dart';

class BoostCreditScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BoostCreditScreenController());
  }
}
