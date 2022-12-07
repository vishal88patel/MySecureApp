import '../controller/link_card_bank_screen_controller.dart';
import 'package:get/get.dart';

class LinkCardBankBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LinkCardBankController());
  }
}
