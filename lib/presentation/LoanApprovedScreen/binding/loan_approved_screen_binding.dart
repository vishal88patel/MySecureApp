import '../controller/loan_approved_screen_controller.dart';
import 'package:get/get.dart';

class LoanApprovedScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoanApprovedSScreenController());
  }
}
