import '../controller/my_bank_account_list_screen_controller.dart';
import 'package:get/get.dart';

class MyBankAccountListScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyBankAccountListScreenController());
  }
}
