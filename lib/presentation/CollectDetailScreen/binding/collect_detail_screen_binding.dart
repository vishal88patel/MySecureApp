import '../controller/collect_detail_screen_controller.dart';
import 'package:get/get.dart';

class CollectDetailScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CollectDetailScreenController());
  }
}
