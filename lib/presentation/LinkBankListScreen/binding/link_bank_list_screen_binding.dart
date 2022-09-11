import '../controller/link_bank_list_screen_controller.dart';
import 'package:get/get.dart';

class LinkBankListScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LinkBankListScreenController());
  }
}
