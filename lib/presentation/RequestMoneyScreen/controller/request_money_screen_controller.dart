import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/utils/ConstantsFiles/string_constants.dart';
import 'package:secure_cash_app/utils/HelperFiles/ui_utils.dart';

import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../model/getCashtagUserModel.dart';
import '../model/recentTransactionModel.dart';



class RequestMoneyScreenController extends GetxController {
  TextEditingController toController = TextEditingController();
  TextEditingController forNoteController = TextEditingController();
  TextEditingController amountCtrl = TextEditingController();
  var cashtagUserModel=GetCashtagUserModel().obs;
  List<String> imageList =['asset/icons/profile_image.png','asset/icons/profile_image.png','asset/icons/profile_image.png','asset/icons/profile_image.png','asset/icons/profile_image.png','asset/icons/profile_image.png'];
  var cashTag="".obs;
  var name="".obs;
  var image="".obs;
  var recentTransactionModel=RecentTransactionModel().obs;
  RxList recentTransactionList=[].obs;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    GetRecentTransactionListApi();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onTapNextButton(){
    if(toController.text.isEmpty){
      UIUtils.showSnakBar(
          bodyText: "Please Enter Name, \$Cashtag , Email",
          headerText: StringConstants.ERROR);
    }else{
      GetCashtagUserApi();
      //
    }
  }

  Future<void> GetCashtagUserApi() async {
    UIUtils.showProgressDialog(isCancellable: false);
    ApiService()
        .callPostApi(
        body: await GetCashtagUserApiBody(),
        headerWithToken: true,
        url: ApiEndPoints.GET_CASHTAG_USRE)
        .then((value) {
      print(value);
      if (value['status']) {
        cashtagUserModel.value = GetCashtagUserModel.fromJson(value);
        name.value= cashtagUserModel.value.data!.name!;
        image.value= cashtagUserModel.value.data!.profilePhotoUrl!;
        cashTag.value= cashtagUserModel.value.data!.cashtag!;
        UIUtils.hideProgressDialog();
        Get.toNamed(AppRoutes.requestMoneyAmountScreen);
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }
  Future<FormData> GetCashtagUserApiBody() async {
    final form = FormData({
      "cashtag": toController.text
    });
    return form;
  }

  Future<void> RequestMoneyApi() async {
    UIUtils.showProgressDialog(isCancellable: false);
    ApiService()
        .callPostApi(
        body: await RequestMoneyApiBody(),
        headerWithToken: true,
        url: ApiEndPoints.REQUEST_MONEY)
        .then((value) {
      print(value);
      if (value['status']) {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.SUCCESS);
        UIUtils.hideProgressDialog();
       // Get.toNamed(AppRoutes.requestMoneyAmountScreen);
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }
  Future<FormData> RequestMoneyApiBody() async {
    final form = FormData({
      "cashtag": toController.text,
      "notes": cashTag.value,
      "amount": amountCtrl.text,
    });
    return form;
  }


  Future<void> GetRecentTransactionListApi() async {
    ApiService()
        .callGetApi(
        body: await GetRecentTransactionApiBody(),
        headerWithToken: true,
        showLoader: true,
        url: ApiEndPoints.RECENT_TRANSACTION)
        .then((value) {
      print(value);
      if (value['status']) {
        recentTransactionList.clear();
        recentTransactionModel.value = RecentTransactionModel.fromJson(value);

          recentTransactionList.value.addAll(recentTransactionModel.value.data!.user??[]);


      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> GetRecentTransactionApiBody() async {
    final form = FormData({});
    return form;
  }
}
