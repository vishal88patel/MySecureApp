import 'package:secure_cash_app/presentation/OnBoardingScreen/controller/onboarding_screen_controller.dart';

import 'package:get/get.dart';
import 'package:secure_cash_app/presentation/instructionScreen/controller/instruction_screen_controller.dart';

class InstructionScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InstructionScreenController());
  }
}
