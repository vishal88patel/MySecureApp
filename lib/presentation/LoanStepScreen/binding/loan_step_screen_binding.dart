import '../controller/loan_step_screen_controller.dart';
import 'package:get/get.dart';

class LoanStepScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoanStepScreenController());
  }
}
