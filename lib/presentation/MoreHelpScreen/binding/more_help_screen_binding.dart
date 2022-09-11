import '../controller/more_help_screen_controller.dart';
import 'package:get/get.dart';

class MoreHelpScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MoreHelpScreenController());
  }
}
