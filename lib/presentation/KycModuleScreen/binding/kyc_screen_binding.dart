import '../controller/kyc_screen_controller.dart';
import 'package:get/get.dart';

class KycScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => KycScreenController());
  }
}
