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
import '../model/cashcard_model.dart';



class CCCardController extends GetxController {
  var showCard = false.obs;
  var cashCardModel=CashCardModel().obs;
  LoginResponseModel? loginResponseModel=LoginResponseModel();
  var cardNumber="".obs;
  var cardName="".obs;
  var cardCvv="".obs;
  var cardExpYear="".obs;
  var cardExpMonth="".obs;
  var time="".obs;
  var pin="".obs;
  var status="0".obs;
  var isLock="".obs;
  var card_status="".obs;

  var state = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getStoredData();
    callGetCashCardApi();
  }

  @override
  void onClose() {
    super.onClose();
  }
  Future<void> getStoredData() async {
    loginResponseModel = (await PrefUtils.getLoginModelData(StringConstants.LOGIN_RESPONSE));
    cardName.value=loginResponseModel!.data!.firstName.toString()+" "+loginResponseModel!.data!.lastName.toString();

  }

  getTime(time) {
    if (!DateTime.now().difference(time).isNegative) {
      if (DateTime.now().difference(time).inMinutes < 1) {
        return "a few seconds ago";
      } else if (DateTime.now().difference(time).inMinutes < 60) {
        return "${DateTime.now().difference(time).inMinutes} minutes ago";
      } else if (DateTime.now().difference(time).inMinutes < 1440) {
        return "${DateTime.now().difference(time).inHours} hours ago";
      } else if (DateTime.now().difference(time).inMinutes > 1440) {
        return "${DateTime.now().difference(time).inDays} days ago";
      }
    }
  }

  Future<void> callGetCashCardApi() async {
    ApiService()
        .callGetApi(
        body: await getGetCashCardApiBody(),
        headerWithToken: true,
        showLoader: true,
        url: ApiEndPoints.GET_CASHCARD)
        .then((value) {
      print(value);
      if (value!=null&&value['status']) {
        cashCardModel.value = CashCardModel.fromJson(value);
        cardNumber.value= cashCardModel.value.data!.cardNumber!;
        cardCvv.value= cashCardModel.value.data!.cvv!;
        cardExpYear.value= cashCardModel.value.data!.expYear!;
        cardExpMonth.value= cashCardModel.value.data!.expMonth!;
        time.value= cashCardModel.value.data!.updatedAt!.toString();
        pin.value= cashCardModel.value.data!.pin!;
        isLock.value= cashCardModel.value.data!.isLock!;
        status.value= cashCardModel.value.data!.status!;
        card_status.value= cashCardModel.value.data!.order_status!;
        if(isLock.value.toString()=="0"){
          state.value=false;
        }else{
          state.value=true;
        }



      } else {
        UIUtils.hideProgressDialog();
        // UIUtils.showSnakBar(
        //     bodyText: value['message']??'', headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getGetCashCardApiBody() async {
    final form = FormData({});
    return form;
  }

  Future<void> UpdateCashCardLockApi() async {
    // UIUtils.showProgressDialog(isCancellable: false);
    ApiService()
        .callPostApi(
        body: await UpdateCashCardLockApiBody(),
        headerWithToken: true,
        showLoader: true,
        url: ApiEndPoints.UPDATE_CASHCARD_LOCK)
        .then((value) {
      print(value);
      if (value['status']) {

      } else {

      }
    });
  }
  Future<FormData> UpdateCashCardLockApiBody() async {
    final form = FormData({
      "is_lock": state.value?"1":"0",
    });
    return form;
  }
}
