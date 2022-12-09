import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:secureapp/ApiServices/api_service.dart';
import 'package:secureapp/App%20Configurations/api_endpoints.dart';
import 'package:secureapp/presentation/FaqScreen/model/faq_model.dart';
import 'package:secureapp/utils/ConstantsFiles/string_constants.dart';
import 'package:secureapp/utils/HelperFiles/ui_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/network_info.dart';
import '../../../routes/app_routes.dart';



class FaqScreenController extends GetxController {
  var faqModel= FaqsModel().obs;

  var isExpand = 0.obs;
  var isApiCall = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    FaqsApi();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  expandWidget(int index){
    isExpand.value = index;
  }

  Future<void> FaqsApi() async {
    isApiCall.value=false;
    ApiService()
        .callPostApi(
        body: await getBodyWithdrawError(''),
        headerWithToken: true,
        url: ApiEndPoints.FAQS)
        .then((value) {
      print(value);
      if (value['status']) {
        update();

        faqModel.value = FaqsModel.fromJson(value);
        isApiCall.value=true;
        update();

        // for (int i = 0; i < cardListModel.value.data!.length; i++) {
        //   mainCardList.value.add(cardListModel.value.data![i]);
        // }

      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getBodyWithdrawError(String search) async {
    final form = FormData({});
    print(form.toString());
    return form;
  }


}
