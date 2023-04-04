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




class CCAddressController extends GetxController {

  TextEditingController addressController = TextEditingController();
  LoginResponseModel? loginResponseModel=LoginResponseModel();
  var address1="".obs;
  var address2="".obs;
  var city="".obs;
  var state="".obs;

  var color="".obs;
  var arguments = Get.arguments;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getStoredData();
    getArguments();
  }

  @override
  void onClose() {
    super.onClose();
  }
  getArguments(){
    if (arguments != null) {
      color.value = arguments['color'];
    }
  }

  Future<void> getStoredData() async {
    loginResponseModel = (await PrefUtils.getLoginModelData(StringConstants.LOGIN_RESPONSE));
    address1.value=loginResponseModel!.data!.address1.toString();
    address2.value=loginResponseModel!.data!.address2.toString()??" ";
    city.value=loginResponseModel!.data!.city.toString();
    state.value=loginResponseModel!.data!.state.toString();
  }

  onNext(){
    if(addressController.text.isEmpty){
      UIUtils.showSnakBar(
          bodyText: "Please Enter Address",
          headerText: StringConstants.ERROR);
    }else{
      PlaceCashCardApi();
    }
  }

  Future<void> PlaceCashCardApi() async {
    // UIUtils.showProgressDialog(isCancellable: false);
    ApiService()
        .callPostApi(
        body: await PlaceCashCardApiBody(),
        headerWithToken: true,
        showLoader: true,
        url: ApiEndPoints.PLACE_CASHCARD)
        .then((value) {
      print(value);
      if (value['status']) {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.SUCCESS);
        PrefUtils.setString(StringConstants.IS_CASH_CARD,"1");
        Get.toNamed(
            AppRoutes.ccSuccessScreen);

      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }
  Future<FormData> PlaceCashCardApiBody() async {
    final form = FormData({
      "address": addressController.text,
      "color": color.value,
    });
    return form;
  }

}
