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
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../../EnterPasswordScreen/models/login_response_model.dart';
import '../../LoanCalculator/model/loan_calculation_response.dart';



class LoanApprovedSScreenController extends GetxController {
  var arguments = Get.arguments;
  var userName="".obs;
  var loanCalModel= LoanCalculationResponseModel().obs;
  LoginResponseModel? loginResponseModel=LoginResponseModel();
  var HeadeName="".obs;
  var loan_type="".obs;
  var loanAmount="".obs;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getStoredData();
    getArguments();
    super.onInit();
  }
  Future<void> getStoredData() async {
    loginResponseModel = (await PrefUtils.getLoginModelData(StringConstants.LOGIN_RESPONSE));
    HeadeName.value=loginResponseModel!.data!.firstName!+" "+loginResponseModel!.data!.lastName.toString();
  }

  void getArguments() {
    if (arguments != null) {
      loanCalModel.value = arguments['loanCalModel'];
      loan_type.value = arguments['loan_type'];
      getoNext();
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getoNext() {
    Future.delayed(Duration(milliseconds: 5000), () {
      Get.offAllNamed(AppRoutes.dashBoardScreen,arguments: {"bottomTabCount":1});

    });
  }



}
