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
import '../../LoanCalculator/model/loan_calculation_response.dart';



class LoanStepScreenController extends GetxController {
  var arguments = Get.arguments;
  var loanCalModel= LoanCalculationResponseModel().obs;
 var loanAmount ="".obs;
 var loan_type ="".obs;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    getArguments();
    super.onInit();
  }
  void getArguments() {
    if (arguments != null) {
      loanCalModel.value = arguments['loanCalModel'];
      loanAmount.value = arguments['loanAmount'];
      loan_type.value = arguments['loan_type'];
    }
  }

  @override
  void onClose() {
    super.onClose();
  }


  Future<void> onTapOfProcced() async {

    ApiService()
        .callPostApi(
        body: await getRegisterBody(
            amount: loanCalModel.value.data!.loanAmount.toString(),
            loan_type: loan_type.value,
            month: loanCalModel.value.data!.month.toString(),
            type: "2"),
        headerWithToken: true,
        url: ApiEndPoints.GET_LOAN_CALCULATION)
        .then((value) {
      print(value);
      if (value['status']) {
        LoanCalculationResponseModel loanCalModel =
        LoanCalculationResponseModel.fromJson(value);
        Get.toNamed(AppRoutes.loan_approved,
            arguments: {
              "loanCalModel": loanCalModel,
              "loanAmount": loanCalModel.data!.loanAmount.toString(),
              "loan_type": loan_type.value,
            });
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getRegisterBody({
    required String amount,
    required String month,
    required String type,
    required String loan_type,
  }) async {
    final form = FormData({
      "amount": amount,
      "month": month,
      "type": type,
      "loan_type": loan_type,
    });
    return form;
  }

}
