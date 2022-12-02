import '../controller/top_add_card_fill_screen_controller.dart';
import 'package:get/get.dart';

class TopAddCardFillBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TopAddCardFillController());
  }
}
