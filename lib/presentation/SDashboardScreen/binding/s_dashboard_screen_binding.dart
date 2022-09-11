import '../controller/s_dashboard_screen_controller.dart';
import 'package:get/get.dart';

class SDashBoardScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SDashBoardScreenController());
  }
}
