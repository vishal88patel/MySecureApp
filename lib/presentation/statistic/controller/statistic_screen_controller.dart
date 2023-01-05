
import 'package:get/get.dart';

import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../model/getStasticsModel.dart';

class StatisticScreenController extends GetxController {
  var statisticModel=GetStasticsModel().obs;
  var isIncomeExpense = 1.obs;
  var isWeeklyTime = 1.obs;
  var totalIncome = "0".obs;
  var totalExpense = "0".obs;
  var lastDaysExpense = "0".obs;
  var type = 0.obs;
  var tType = "credit".obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    callStasticApi(type: type.value,tType:tType.value,showLoader: false);
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
      callStasticApi(type: type.value,tType:tType.value,showLoader: true);
    }else{
      tType.value = "credit";
      callStasticApi(type: type.value,tType:tType.value,showLoader: true);
    }
  }

  timeExpense (var index){
    isWeeklyTime.value = index;
    if(isWeeklyTime.value==2){
      type.value = 1;
      callStasticApi(type: type.value,tType:tType.value,showLoader: true);
    }else{
      type.value =0;
      callStasticApi(type: type.value,tType:tType.value,showLoader: true);
    }
  }

  Future<void> callStasticApi({required int type,required String tType,required bool showLoader}) async {
    ApiService()
        .callGetApi(
        body: await callStasticApiBody(),
        headerWithToken: true,
        showLoader: showLoader,
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