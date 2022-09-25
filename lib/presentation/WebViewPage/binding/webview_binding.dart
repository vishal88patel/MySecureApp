import 'package:get/get.dart';

import '../controller/webview_screen_controller.dart';

class WbviewScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WebviewScreenController());
  }
}
