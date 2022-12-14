import 'package:get/get.dart';
import 'package:secure_cash_app/presentation/RequestMoneyScreen/controller/request_money_screen_controller.dart';
import 'package:secure_cash_app/presentation/TransferScanScreen/controller/transfer_scan_screen_controller.dart';
import 'package:secure_cash_app/presentation/TransferScreen/controller/transfer_screen_controller.dart';

class RequestMoneyScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RequestMoneyScreenController());
  }
}
