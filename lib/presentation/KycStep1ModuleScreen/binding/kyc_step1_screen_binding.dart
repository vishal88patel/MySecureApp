import '../controller/kyc_step1_screen_controller.dart';
import 'package:get/get.dart';

class KycStep1ScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => KycStep1ScreenController());
  }
}
