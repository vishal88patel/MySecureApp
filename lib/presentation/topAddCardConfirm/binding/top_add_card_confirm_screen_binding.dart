import '../controller/top_add_card_confirm_screen_controller.dart';
import 'package:get/get.dart';

class TopAddCardConfirmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TopAddCardConfirmController());
  }
}
