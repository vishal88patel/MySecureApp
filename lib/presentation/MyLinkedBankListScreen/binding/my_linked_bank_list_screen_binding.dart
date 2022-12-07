import '../controller/my_linked_bank_list_screen_controller.dart';
import 'package:get/get.dart';

class MyLinkedBankListScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyLinkedBankListScreenController());
  }
}
