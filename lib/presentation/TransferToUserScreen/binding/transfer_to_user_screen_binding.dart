import 'package:get/get.dart';
import 'package:secure_cash_app/presentation/TransferScreen/controller/transfer_screen_controller.dart';
import 'package:secure_cash_app/presentation/TransferToUserScreen/controller/transfer_to_user_screen_controller.dart';

class TransferToUserScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransferToUserScreenController());
  }
}
