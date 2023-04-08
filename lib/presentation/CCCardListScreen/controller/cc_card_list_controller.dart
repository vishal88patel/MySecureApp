import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:secure_cash_app/presentation/ScanScreen/controller/scan_screen_controller.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../CCCardScreen/model/cashcard_model.dart';
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





class CCCardListController extends GetxController {
  var cashCardModel=CashCardModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    callGetCashCardApi();
  }

  @override
  void onClose() {
    super.onClose();
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

}
