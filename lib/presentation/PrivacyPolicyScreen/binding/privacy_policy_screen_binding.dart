import '../controller/privacy_policy_screen_controller.dart';
import 'package:get/get.dart';

class PrivacyPolicyScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PrivacyPolicyScreenController());
  }
}
