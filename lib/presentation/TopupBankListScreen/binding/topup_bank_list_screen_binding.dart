import '../controller/topup_bank_list_screen_controller.dart';
import 'package:get/get.dart';

class TopupBankListScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TopupBankListScreenController());
  }
}
