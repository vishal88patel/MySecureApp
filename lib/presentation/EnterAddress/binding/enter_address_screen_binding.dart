import '../controller/enter_address_screen_controller.dart';
import 'package:get/get.dart';

class EnterAddressScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EnterAddressScreenController());
  }
}
