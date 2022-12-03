import '../controller/top_add_card1_screen_controller.dart';
import 'package:get/get.dart';

class TopAddCard1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TopAddCard1Controller());
  }
}
