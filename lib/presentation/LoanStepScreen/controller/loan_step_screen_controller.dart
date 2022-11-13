import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/network_info.dart';
import '../../../routes/app_routes.dart';
import '../../LoanCalculator/model/loan_calculation_response.dart';



class LoanStepScreenController extends GetxController {
  var arguments = Get.arguments;
  var loanCalModel= LoanCalculationResponseModel().obs;
 var loanAmount ="".obs;
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
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

}
