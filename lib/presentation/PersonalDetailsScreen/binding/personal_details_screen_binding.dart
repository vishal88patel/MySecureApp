import 'package:get/get.dart';

import '../controller/personal_details_screen_controller.dart';

class PersonalDetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PersonalDetailsScreenController());
  }
}
