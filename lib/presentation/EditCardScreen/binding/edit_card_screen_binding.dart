import '../controller/edit_card_screen_controller.dart';
import 'package:get/get.dart';

class EditCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditCardController());
  }
}
