import '../controller/select_bank_list_screen_controller.dart';
import 'package:get/get.dart';

class SelectBankListScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>  SelectBankListScreenController());
  }
}
