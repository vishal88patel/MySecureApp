import 'package:get/get.dart';
import 'package:secure_cash_app/presentation/TransferScreen/controller/transfer_screen_controller.dart';

class TransferScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransferScreenController());
  }
}
