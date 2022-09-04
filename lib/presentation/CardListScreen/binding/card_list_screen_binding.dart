import '../controller/card_list_screen_controller.dart';
import 'package:get/get.dart';

class CardListScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CardListScreenController());
  }
}
