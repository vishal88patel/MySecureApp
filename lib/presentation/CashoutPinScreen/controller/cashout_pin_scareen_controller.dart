import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../CashoutAmountScreen/controller/cashout_amount_scareen_controller.dart';
import '../../CashoutAmountScreen/model/getWallet.dart';
import '../../LoginScreen/models/login_response_model.dart';
import '../../NormalScreen/WelcomeScreen.dart';
import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import 'package:intl/intl.dart';

import '../cashout_failed_screen.dart';


class CashoutPinController extends GetxController {
  TextEditingController pinController = TextEditingController();

  var walletModel=GetWallet().obs;
  var isPin=0.obs;
  var amountNumPadController =
  Get.find<CashoutAmountController>();
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    callGetWalletApi(pageNo: 1);
    //controller = ScrollController()..addListener(_scrollListener);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
  Future<void> callGetWalletApi({required int pageNo}) async {
    ApiService()
        .callGetApi(
        body: await getWalletApiBody(),
        headerWithToken: true,
        showLoader: pageNo==1?true:false,
        url: ApiEndPoints.GET_WALLET+"?page=$pageNo")
        .then((value) {
      print(value);
      if (value!=null&&value['status']) {
        walletModel.value = GetWallet.fromJson(value);
        isPin.value= walletModel.value.data!.isPin!;


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

  void onTapOfListTile(BuildContext context) {
    UIUtils.showProgressDialog(isCancellable: false);
    Future.delayed(Duration(milliseconds: 2000), () {
      WithdrawErrorApi(context);
    });
  }

  Future<void> WithdrawErrorApi(BuildContext context) async {
    ApiService()
        .callPostApi(
        body: await getBodyWithdrawError(amountNumPadController.amountController.text,pinController.text.toString()),
        headerWithToken: true,
        url: ApiEndPoints.WITHDRAW_ERROR)
        .then((value) {
      print(value);
      if (value['status']) {

      } else {
        if(value["type"]=="1"){
          UIUtils.hideProgressDialog();
          UIUtils.showSnakBar(
              bodyText: value['message']??'', headerText: StringConstants.ERROR);
        }else{
          UIUtils.hideProgressDialog();
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CashoutFailedScreen()),
          );
        }
      }
    });
  }

  Future<FormData> getBodyWithdrawError(String amount,String pin) async {
    final form = FormData({"amount": amount,"pin":pin});
    print(form.toString());
    return form;
  }

   goHome() {
    Get.offAllNamed(AppRoutes.dashBoardScreen,
        arguments: {"bottomTabCount": 0});
  }

}
