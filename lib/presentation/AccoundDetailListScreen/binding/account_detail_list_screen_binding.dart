import '../controller/account_detail_list_screen_controller.dart';
import 'package:get/get.dart';

class AccountDetailListScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountDetailListScreenController());
  }
}
