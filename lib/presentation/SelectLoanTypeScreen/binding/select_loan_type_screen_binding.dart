import '../controller/select_loan_type_screen_controller.dart';
import 'package:get/get.dart';

class SelectLoanTypeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectLoanTypeScreenController());
  }
}
