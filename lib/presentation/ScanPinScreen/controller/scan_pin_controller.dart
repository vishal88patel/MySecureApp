import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:secure_cash_app/presentation/ScanScreen/controller/scan_screen_controller.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../CashoutAmountScreen/controller/cashout_amount_scareen_controller.dart';
import '../../CashoutAmountScreen/model/getWallet.dart';
import '../../CashoutPinScreen/cashout_failed_screen.dart';
import '../../LoginScreen/models/login_response_model.dart';
import '../../NormalScreen/WelcomeScreen.dart';
import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import 'package:intl/intl.dart';

import '../../ScanScreen/scan_success_screen.dart';



class ScanPinController extends GetxController {
  TextEditingController pinController = TextEditingController();
  var uuid="".obs;
  var walletModel=GetWallet().obs;
  var isPin=0.obs;
  var scanController = Get.find<ScanScreenController>();
  var arguments = Get.arguments;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getArguments();

    //controller = ScrollController()..addListener(_scrollListener);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.onInit();
  }
  void getArguments() {
    if (arguments!=null && arguments['uuid'] != null ) {

      uuid.value = arguments['uuid'];
      callGetWalletApi(pageNo: 1);
    }else{
      callGetWalletApi(pageNo: 1);
    }
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
        // uuid.value= walletModel.value.data!.uuid!;


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
        body: await getBodyWithdrawError(scanController.amountController.text,pinController.text.toString()),
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

  void clickOnTransaction(){
    if (pinController.text.isEmpty) {
      UIUtils.showSnakBar(
        headerText: StringConstants.ERROR,
        bodyText: "Please Enter PIN",
      );
    }else if(pinController.text.length<4){
      UIUtils.showSnakBar(
        headerText: StringConstants.ERROR,
        bodyText: "Please Enter 4 Digit PIN",
      );
    }
    else {
      callTransactionApi();
    }
  }

  Future<void> callTransactionApi() async {
    UIUtils.showProgressDialog(isCancellable: false);
    ApiService()
        .callPostApi(
        body: await getTransactionApiBody(),
        headerWithToken: true,
        url: ApiEndPoints.TRANSACTION)
        .then((value) {
      print(value);
      if (value['status']) {
        UIUtils.hideProgressDialog();
        Get.to(ScanSuccessScreen());
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }
  Future<FormData> getTransactionApiBody() async {
    final form = FormData({
      "uuid": uuid.value.toString(),
      "amount": scanController.amountController.text.toString(),
      "pin": pinController.text
    });
    return form;
  }



}
