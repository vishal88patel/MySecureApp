import '../controller/gif_screen_controller.dart';
import 'package:get/get.dart';

class GifScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GifScreenController());
  }
}
