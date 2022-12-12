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
import '../../LoanCalculator/model/loan_calculation_response.dart';
import '../../LoginScreen/models/login_response_model.dart';



class KycSuccessScreenController extends GetxController {
  var arguments = Get.arguments;
  var userName="".obs;
  var loanCalModel= LoanCalculationResponseModel().obs;
  LoginResponseModel? loginResponseModel=LoginResponseModel();
  var HeadeName="".obs;
  var loan_type="".obs;
  var loanAmount="".obs;
  var type=0.obs;


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getArguments() {
    if (arguments != null) {
      type.value = arguments['API_TYPE'];
    }
  }



}
