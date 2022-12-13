import '../controller/chat_screen_controller.dart';
import 'package:get/get.dart';

class ChatScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatScreenController());
  }
}
