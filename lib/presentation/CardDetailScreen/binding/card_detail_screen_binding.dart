import '../controller/card_detail_screen_controller.dart';
import 'package:get/get.dart';

class CardScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CardScreenController());
  }
}
