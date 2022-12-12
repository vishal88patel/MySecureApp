import '../controller/kyc_success2_screen_controller.dart';
import 'package:get/get.dart';

class KycSuccess2ScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => KycSuccess2ScreenController());
  }
}
