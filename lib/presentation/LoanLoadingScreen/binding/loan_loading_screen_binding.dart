
import 'package:get/get.dart';

import '../controller/loan_loading_screen_controller.dart';

class LoanLoadingScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoanLoadingController());
  }
}
