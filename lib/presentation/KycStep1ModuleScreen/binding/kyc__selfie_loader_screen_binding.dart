
import '../controller/kyc__selfie_loader_screen_controller.dart';
import '../controller/kyc_loader_screen_controller.dart';
import 'package:get/get.dart';

class KycSelfieLoaderScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => KycSelfieLoaderController());
  }
}
