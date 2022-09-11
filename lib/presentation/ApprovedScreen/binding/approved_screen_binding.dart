import '../controller/approved_screen_controller.dart';
import 'package:get/get.dart';

class ApprovedScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApprovedScreenController());
  }
}
