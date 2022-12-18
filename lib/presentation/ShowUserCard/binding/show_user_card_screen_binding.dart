import '../controller/show_user_card_screen_controller.dart';
import 'package:get/get.dart';

class ShowUserCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShowUserCardScreenCardController());
  }
}
