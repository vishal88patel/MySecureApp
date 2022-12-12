import '../controller/qrCode_screen_controller.dart';
import 'package:get/get.dart';

class QrCodeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QrCodeScreenController());
  }
}
