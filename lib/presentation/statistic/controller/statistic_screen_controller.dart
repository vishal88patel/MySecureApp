
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

  var iWeek1 = "".obs;
  var iWeek2 = "".obs;
  var iWeek3 = "".obs;
  var iWeek4 = "".obs;
  var eWeek1 = "".obs;
  var eWeek2 = "".obs;
  var eWeek3 = "".obs;
  var eWeek4 = "".obs;

  var total1 = 0.obs;
  var total2 = 0.obs;
  var total3 = 0.obs;
  var total4 = 0.obs;
  var total5 = 0.obs;
  var total6 = 0.obs;
  var total7 = 0.obs;


  var iDay1 = 0.0.obs;
  var iDay2 = 0.0.obs;
  var iDay3 = 0.0.obs;
  var iDay4 = 0.0.obs;
  var iDay5 = 0.0.obs;
  var iDay6 = 0.0.obs;
  var iDay7 = 0.0.obs;

  var igraph3 = 0.0.obs;
  var egraph3 = 0.0.obs;
  var totalGraph3 = 0.0.obs;
  var percentGraph3 = 0.0.obs;
  RxDouble finalpercentGraph3 = 0.00.obs;




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

        iWeek1.value=double.parse(statisticModel.value.data!.statistic!.monthlyData!.week1!.income.toString()).toInt().toString();
        iWeek2.value=double.parse(statisticModel.value.data!.statistic!.monthlyData!.week2!.income.toString()).toInt().toString();
        iWeek3.value=double.parse(statisticModel.value.data!.statistic!.monthlyData!.week3!.income.toString()).toInt().toString();
        iWeek4.value=double.parse(statisticModel.value.data!.statistic!.monthlyData!.week4!.income.toString()).toInt().toString();

        eWeek1.value=double.parse(statisticModel.value.data!.statistic!.monthlyData!.week1!.expens.toString()).toInt().toString();
        eWeek2.value=double.parse(statisticModel.value.data!.statistic!.monthlyData!.week2!.expens.toString()).toInt().toString();
        eWeek3.value=double.parse(statisticModel.value.data!.statistic!.monthlyData!.week3!.expens.toString()).toInt().toString();
        eWeek4.value=double.parse(statisticModel.value.data!.statistic!.monthlyData!.week4!.expens.toString()).toInt().toString();


        total1.value=int.parse(statisticModel.value.data!.statistic!.weeklyData![0].income!.toString())+int.parse(statisticModel.value.data!.statistic!.weeklyData![0].expens!.toString());
        total2.value=int.parse(statisticModel.value.data!.statistic!.weeklyData![1].income!.toString())+int.parse(statisticModel.value.data!.statistic!.weeklyData![1].expens!.toString());
        total3.value=int.parse(statisticModel.value.data!.statistic!.weeklyData![2].income!.toString())+int.parse(statisticModel.value.data!.statistic!.weeklyData![2].expens!.toString());
        total4.value=int.parse(statisticModel.value.data!.statistic!.weeklyData![3].income!.toString())+int.parse(statisticModel.value.data!.statistic!.weeklyData![3].expens!.toString());
        total5.value=int.parse(statisticModel.value.data!.statistic!.weeklyData![4].income!.toString())+int.parse(statisticModel.value.data!.statistic!.weeklyData![4].expens!.toString());
        total6.value=int.parse(statisticModel.value.data!.statistic!.weeklyData![5].income!.toString())+int.parse(statisticModel.value.data!.statistic!.weeklyData![5].expens!.toString());
        total7.value=int.parse(statisticModel.value.data!.statistic!.weeklyData![6].income!.toString())+int.parse(statisticModel.value.data!.statistic!.weeklyData![6].expens!.toString());


        iDay1.value=int.parse(statisticModel.value.data!.statistic!.weeklyData![0].income!.toString())==0?0:int.parse(statisticModel.value.data!.statistic!.weeklyData![0].income!.toString())*100/total1.value.toInt();
        iDay2.value=int.parse(statisticModel.value.data!.statistic!.weeklyData![1].income!.toString())==0?0:int.parse(statisticModel.value.data!.statistic!.weeklyData![1].income!.toString())*100/total2.value.toInt();
        iDay3.value=int.parse(statisticModel.value.data!.statistic!.weeklyData![2].income!.toString())==0?0:int.parse(statisticModel.value.data!.statistic!.weeklyData![2].income!.toString())*100/total3.value.toInt();
        iDay4.value=int.parse(statisticModel.value.data!.statistic!.weeklyData![3].income!.toString())==0?0:int.parse(statisticModel.value.data!.statistic!.weeklyData![3].income!.toString())*100/total4.value.toInt();
        iDay5.value=int.parse(statisticModel.value.data!.statistic!.weeklyData![4].income!.toString())==0?0:int.parse(statisticModel.value.data!.statistic!.weeklyData![4].income!.toString())*100/total5.value.toInt();
        iDay6.value=int.parse(statisticModel.value.data!.statistic!.weeklyData![5].income!.toString())==0?0:int.parse(statisticModel.value.data!.statistic!.weeklyData![5].income!.toString())*100/total6.value.toInt();
        iDay7.value=int.parse(statisticModel.value.data!.statistic!.weeklyData![6].income!.toString())==0?0:int.parse(statisticModel.value.data!.statistic!.weeklyData![6].income!.toString())*100/total7.value.toInt();


        igraph3.value=int.parse(statisticModel.value.data!.statistic!.totalIncome!.toString()).toDouble();
        egraph3.value=int.parse(statisticModel.value.data!.statistic!.totalExpense!.toString()).toDouble();
        totalGraph3.value=igraph3.value+egraph3.value;
        percentGraph3.value=egraph3.value==0?0.0:egraph3.value/totalGraph3.value;
        //finalpercentGraph3.value=percentGraph3.value*100;
        print("percentGraph3:"+percentGraph3.value.toString());
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