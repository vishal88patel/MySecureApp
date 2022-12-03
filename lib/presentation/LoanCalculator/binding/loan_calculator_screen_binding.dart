import '../controller/loan_calculator_screen_controller.dart';
import 'package:get/get.dart';

class LoanCalculatorScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoanCalculatorScreenController());
  }
}
