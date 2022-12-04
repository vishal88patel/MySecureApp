import '../controller/kyc_select_step_screen_controller.dart';
import 'package:get/get.dart';

class KycSelectStepBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => KycSelectStepController());
  }
}
