import 'package:get/get.dart';
import 'package:secure_cash_app/presentation/TransferScanScreen/controller/transfer_scan_screen_controller.dart';
import 'package:secure_cash_app/presentation/TransferScreen/controller/transfer_screen_controller.dart';

class TransferScanScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransferScanScreenController());
  }
}
