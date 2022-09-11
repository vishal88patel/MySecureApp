import '../controller/progress_screen_controller.dart';
import 'package:get/get.dart';

class ProgressScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProgressScreenController());
  }
}
