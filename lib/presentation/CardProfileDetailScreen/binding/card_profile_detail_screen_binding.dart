import '../controller/card_profile_detail_screen_controller.dart';
import 'package:get/get.dart';

class CardProfileDetailScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CardProfileDetailScreenController());
  }
}
