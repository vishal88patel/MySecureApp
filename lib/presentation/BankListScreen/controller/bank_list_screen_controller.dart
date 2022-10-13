import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/api_service.dart';
import '../../../ApiServices/network_info.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../../LinkBankListScreen/model/bank_list_response_model.dart';



class BankListScreenController extends GetxController {
  var bankListModel=BankListResponseModel().obs;
   RxList mainBankList=[].obs;
  var pageNumber=1.obs;
  var lastPage=0.obs;
  var bankScript="".obs;
  late ScrollController controller;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    controller = ScrollController()..addListener(_scrollListener);
    callGetBankListApi(pageNo: pageNumber.value);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }


  Future<void> callGetBankListApi({required int pageNo}) async {
    ApiService()
        .callGetApi(
        body: await getBankApiBody(),
        headerWithToken: true,
        showLoader: pageNo==1?true:false,
        url: ApiEndPoints.GET_BANKLIST+"?page=$pageNo")
        .then((value) {
      print(value);
      if (value['status']) {
        bankListModel.value = BankListResponseModel.fromJson(value);
        lastPage.value= bankListModel.value.data!.lastPage!;
        bankScript.value= bankListModel.value.data!.bankStript!;
        mainBankList.addAll(bankListModel.value.data!.banks??[]);
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getBankApiBody() async {
    final form = FormData({});
    return form;
  }

  void _scrollListener() {

    if (controller.position.pixels == controller.position.maxScrollExtent) {
      pageNumber.value++;
      if(pageNumber.value<=lastPage.value){
        callGetBankListApi(pageNo: pageNumber.value);
      }

    }
  }
}
