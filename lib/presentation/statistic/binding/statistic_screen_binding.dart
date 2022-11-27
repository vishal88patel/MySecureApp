import '../controller/statistic_screen_controller.dart';
import 'package:get/get.dart';

class StatisticScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>  StatisticScreenController());
  }
}
