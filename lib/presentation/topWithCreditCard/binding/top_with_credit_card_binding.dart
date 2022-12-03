import '../controller/top_with_credit_card_controller.dart';
import 'package:get/get.dart';

class TTopWithCreditCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TopWithCreditCardController());
  }
}
