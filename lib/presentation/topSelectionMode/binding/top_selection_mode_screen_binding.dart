import '../controller/top_selection_mode_screen_controller.dart';
import 'package:get/get.dart';

class TopSelectionModeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TopSelectionModeController());
  }
}
