import '../controller/cash_card_screen_controller.dart';
import 'package:get/get.dart';

class CashCardScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CashCardScreenController());
  }
}
