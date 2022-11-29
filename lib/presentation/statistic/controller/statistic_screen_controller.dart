
import 'package:get/get.dart';

class StatisticScreenController extends GetxController {

  var isIncomeExpense = 0.obs;

  @override
  void onReady() {
    // WidgetsBinding.instance
    //     .addPostFrameCallback((_) => showWelcomeDialouge());
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  incomeExpense (var index){
    isIncomeExpense.value = index;
  }

}