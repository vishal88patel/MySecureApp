
import 'package:get/get.dart';

import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../model/getStasticsModel.dart';

class StatisticScreenController extends GetxController {
  var statisticModel=GetStasticsModel().obs;
  var isIncomeExpense = 1.obs;
  var isWeeklyTime = 1.obs;
  var totalIncome = "".obs;
  var totalExpense = "".obs;
  var lastDaysExpense = "".obs;
  var weekly = false.obs;
  var income = false.obs;
  var type = 0.obs;
  var tType = "credit".obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    callStasticApi(type: type.value,tType:tType.value);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  incomeExpense (var index){
    isIncomeExpense.value = index;
    if(isIncomeExpense.value==2){
      tType.value = "debit";
      callStasticApi(type: type.value,tType:tType.value);
    }else{
      tType.value = "credit";
      callStasticApi(type: type.value,tType:tType.value);
    }
  }

  timeExpense (var index){
    isWeeklyTime.value = index;
    if(isWeeklyTime.value==2){
      type.value = 1;
      callStasticApi(type: type.value,tType:tType.value);
    }else{
      type.value =0;
      callStasticApi(type: type.value,tType:tType.value);
    }
  }

  Future<void> callStasticApi({required int type,required String tType}) async {
    ApiService()
        .callGetApi(
        body: await callStasticApiBody(),
        headerWithToken: true,
        showLoader: true,
        url: "${ApiEndPoints.GET_STASTICS}?type=$type&transaction_type=$tType")
        .then((value) {
      print("callStasticApi"+value.toString());
      if (value!=null&&value['status']) {
        statisticModel.value = GetStasticsModel.fromJson(value);
        totalIncome.value=statisticModel.value.data!.statistic!.totalIncome!.toString();
        totalExpense.value=statisticModel.value.data!.statistic!.totalExpense!.toString();
        lastDaysExpense.value=statisticModel.value.data!.statistic!.lastDaysExpenses!.toString();
      } else {
        UIUtils.hideProgressDialog();
      }
    });
  }

  Future<FormData> callStasticApiBody() async {
    final form = FormData({});
    return form;
  }


}