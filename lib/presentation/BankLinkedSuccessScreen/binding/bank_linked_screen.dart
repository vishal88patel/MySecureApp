import '../controller/bank_linked_success_screen.dart';
import 'package:get/get.dart';

class BankLinkesSuccessScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BankLinkesSuccessScreenController());
  }
}
