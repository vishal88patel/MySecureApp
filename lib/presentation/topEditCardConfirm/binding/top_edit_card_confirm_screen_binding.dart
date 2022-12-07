import '../controller/top_edit_card_confirm_screen_controller.dart';
import 'package:get/get.dart';

class TopEditCardConfirmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TopEditCardConfirmController());
  }
}
