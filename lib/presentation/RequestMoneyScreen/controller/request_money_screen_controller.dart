import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/utils/ConstantsFiles/string_constants.dart';
import 'package:secure_cash_app/utils/HelperFiles/ui_utils.dart';

import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../CashoutAmountScreen/model/getWallet.dart';
import '../model/getCashtagUserModel.dart';
import '../model/recentTransactionModel.dart';



class RequestMoneyScreenController extends GetxController {
  TextEditingController toController = TextEditingController();
  TextEditingController forNoteController = TextEditingController();
  TextEditingController amountCtrl = TextEditingController();
  var cashtagUserModel=GetCashtagUserModel().obs;
     var containerHeight = 50.obs;
  TextEditingController passController = TextEditingController();
  var cashTag="".obs;
  var name="".obs;
  var image="".obs;
  var uuid="".obs;
  var recentTransactionModel=RecentTransactionModel().obs;
  RxList recentTransactionList=[].obs;

  var date="".obs;
  var dropHeight=200.00.obs;
  var animContainerHeighr=85.00.obs;
  var selectedMethod="Select Payment Method".obs;
  var isFirstOpen = false.obs;
  var balance="00000".obs;
  var walletModel=GetWallet().obs;
  var isPin=0.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    final now = new DateTime.now();
    date.value = DateFormat.yMMMMd('en_US').format(now).toString();
    containerHeight.value = 50;
    GetRecentTransactionListApi();
    callGetWalletApi(pageNo: 1);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void requestClick(){
    containerHeight.value = 150;
    RequestMoneyApi();
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

  void onTapReqButton(){
    if(int.parse(amountCtrl.text.toString())<=0){
      UIUtils.showSnakBar(
          headerText: StringConstants.ERROR,
          bodyText: "Please Enter Valid Amount");
    }
    else{
      Get.toNamed(AppRoutes.requestToScreen);

    }

  }

  /*void onTapPayButton(){
    if(int.parse(balance.value)<int.parse(amountCtrl.text)){
      UIUtils.showSnakBar(
          headerText: StringConstants.ERROR,
          bodyText: "Insufficient Wallet Balance");
    }
    else{
      Get.toNamed(AppRoutes.requestSummeryScreen);

    }
  }*/

  void onTapOfprocessToPay(){
    if (selectedMethod.value =="Select Payment Method" ||selectedMethod.value.isEmpty) {
      UIUtils.showSnakBar(
        headerText: StringConstants.ERROR,
        bodyText: "Please select method",
      );
    } else {
      Get.toNamed(AppRoutes.requestPasswordScreen);
    }

  }

  void onClickOfContinueToPay(){
    if (passController.text.isEmpty) {
      UIUtils.showSnakBar(
        headerText: StringConstants.ERROR,
        bodyText: "Please enter password",
      );
    } else {
      callTransactionApi();
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
        uuid.value= cashtagUserModel.value.data!.uuid!;
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
   // UIUtils.showProgressDialog(isCancellable: false);
    ApiService()
        .callPostApi(
        body: await RequestMoneyApiBody(),
        headerWithToken: true,
        showLoader: false,
        url: ApiEndPoints.REQUEST_MONEY)
        .then((value) {
      print(value);
      if (value['status']) {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.SUCCESS);
        //UIUtils.hideProgressDialog();
        Get.toNamed(AppRoutes.requestSuccessScreen);
       // containerHeight.value=50;
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

  Future<void> callGetWalletApi({required int pageNo}) async {
    ApiService()
        .callGetApi(
        body: await getWalletApiBody(),
        headerWithToken: true,
        showLoader: false,
        url: ApiEndPoints.GET_WALLET+"?page=$pageNo")
        .then((value) {
      print(value);
      if (value!=null&&value['status']) {
        walletModel.value = GetWallet.fromJson(value);
        isPin.value= walletModel.value.data!.isPin!;
        balance.value= walletModel.value.data!.walletBalance!;

      } else {
        UIUtils.hideProgressDialog();
        // UIUtils.showSnakBar(
        //     bodyText: value['message']??'', headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getWalletApiBody() async {
    final form = FormData({});
    return form;
  }

  Future<void> callTransactionApi() async {
    UIUtils.showProgressDialog(isCancellable: false);
   /* ApiService()
        .callPostApi(
        body: await getTransactionApiBody(),
        headerWithToken: true,
        url: ApiEndPoints.TRANSACTION)
        .then((value) {
      print(value);
      if (value['status']) {
        UIUtils.hideProgressDialog();
        Get.toNamed(AppRoutes.requestSuccessScreen);
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });*/
  }
  Future<FormData> getTransactionApiBody() async {
    final form = FormData({
      "uuid": uuid.value.toString(),
      "amount": amountCtrl.text.toString(),
      "pin": passController.text
    });
    return form;
  }


  void onChangeOfExpansonTile() {
    if(dropHeight.value==600){
      isFirstOpen.value = false;
      dropHeight.value=200;
    }else{
      isFirstOpen.value = true;
      dropHeight.value=600;
    }
    if(animContainerHeighr.value==420){
      animContainerHeighr.value=85;
    }else{
      animContainerHeighr.value=420;
    }
  }

  void onTaoOfItem(String s) {
    selectedMethod.value=s;
    onChangeOfExpansonTile();
  }

}
