import 'package:my_secure_app/presentation/OnBoardingScreen/controller/onboarding_screen_controller.dart';

import 'package:get/get.dart';

class OnBoardingScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardingScreenController());
  }
}
