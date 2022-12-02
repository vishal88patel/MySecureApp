import '../controller/bitcoin_screen_controller.dart';
import 'package:get/get.dart';

class NotificationScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BitCoinScreenController());
  }
}
