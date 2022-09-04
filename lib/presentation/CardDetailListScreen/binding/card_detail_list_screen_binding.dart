import '../controller/card_detail_list_screen_controller.dart';
import 'package:get/get.dart';

class CardDetailListScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CardDetailListScreenController());
  }
}
