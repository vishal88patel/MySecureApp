
import '../controller/card_loader_screen_controller.dart';
import 'package:get/get.dart';

class CardLoaderScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CardLoaderController());
  }
}
