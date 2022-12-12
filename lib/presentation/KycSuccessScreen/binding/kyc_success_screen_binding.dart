import '../controller/kyc_success_screen_controller.dart';
import 'package:get/get.dart';

class KycSuccessScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => KycSuccessScreenController());
  }
}
