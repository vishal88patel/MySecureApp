
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'dart:io';
import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../../CreatePasswordScreen/controller/create_password_screen_controller.dart';
import '../../EnterPersonalDetails/controller/enter_personal_detail_screen_controller.dart';
import '../../LoginScreen/controller/login_screen_controller.dart';
import '../model/get_loan_type_response_model.dart';
import '../model/register_response_model.dart';

class PersonalScreenController extends GetxController {
 // var loginController = Get.find<LoginScreenController>();
 // var createPasswordController = Get.find<CreatePasswordScreenController>();
 // var enterPersonalDetailController = Get.find<EnterPersonalScreenController>();

  TextEditingController employmentNameController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController annualIncomeController = TextEditingController();
  var purposeOfOpeningAcc = "".obs;

  var loanModel = GetLoanTypeResponseModel().obs;
  var selectedLoanId = "".obs;
  var loanList = [].obs;


  String device_type="";
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    checkDeviceType();
    getLoanTypeApi();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getLoanTypeApi() async {
    ApiService()
        .callGetApi(
        body: await getLoanTypeBody(),
        headerWithToken: false,
        url: ApiEndPoints.LOAN_TYPE)
        .then((value) {
      print(value);
      if (value['status']) {
        loanModel.value = GetLoanTypeResponseModel.fromJson(value);
        loanList.value = loanModel.value.data ?? [];
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getLoanTypeBody() async {
    final form = FormData({});
    return form;
  }

  void onTapOnLoanTile(id) {
    selectedLoanId.value = id.toString();
  }

  void onTapOfBorroeOrPErsonalLoan(String s) {
    purposeOfOpeningAcc.value = s;
  }

  void onClickOfRegisterButton() {
    if (employmentNameController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter employment name",
          headerText: StringConstants.ERROR);
    } else if (jobTitleController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter job title",
          headerText: StringConstants.ERROR);
    } else if (annualIncomeController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter annual income",
          headerText: StringConstants.ERROR);
    } else if (purposeOfOpeningAcc.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter account opening purpose",
          headerText: StringConstants.ERROR);
    } else if (purposeOfOpeningAcc.value != "using_wallet_service" &&
        selectedLoanId.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter loan type",
          headerText: StringConstants.ERROR);
    } else {
     // callRegisterApi();
      // Get.toNamed(AppRoutes.personalDetailScreen);
    }
  }

  /*Future<void> callRegisterApi() async {
    ApiService()
        .callPostApi(
        body: await getRegisterBody(
            type: "1",
            email: loginController.emailController.text,
            mobile: "",
            password: createPasswordController.confirmPassController.text,
            address_1: enterPersonalDetailController.address01Controller.text,
            address_2: enterPersonalDetailController.address02Controller.text,
            city: enterPersonalDetailController.cityController.text,
            state: enterPersonalDetailController.stateController.text,
            zip_code: enterPersonalDetailController.zipCodeController.text,
            ssn: enterPersonalDetailController.ssnController.text,
            name: employmentNameController.text,
            job_title: jobTitleController.text,
            annual_income: annualIncomeController.text,
            purpouse_of_opening_account: purposeOfOpeningAcc.value,
            loan_type: selectedLoanId.value,
            first_name: enterPersonalDetailController.firstNameController.text,
            last_name: enterPersonalDetailController.lastNameController.text,
            date_of_birth:"",
          device_id: await PlatformDeviceId.getDeviceId,
          fcm_token: "empty",
          devicy_type: device_type,
          middle_name: enterPersonalDetailController.firstNameController.text,
        ),
        headerWithToken: false,
        url: ApiEndPoints.REGISTER)
        .then((value) {
      print(value);
      if (value['status']) {
        UIUtils.showSnakBar(bodyText: value['message'], headerText: StringConstants.SUCCESS);
        Get.offAllNamed(AppRoutes.loginScreen);
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }*/

  Future<FormData> getRegisterBody({required String type,
    required String email,
    required String mobile,
    required String password,
    required String address_1,
    required String address_2,
    required String city,
    required String state,
    required String zip_code,
    required String ssn,
    required String name,
    required String job_title,
    required String annual_income,
    required String purpouse_of_opening_account,
    required String loan_type,
    required String first_name,
    required String last_name,
    required String date_of_birth,
    required String? device_id,
    required String fcm_token,
    required String devicy_type,
    required String middle_name,
  }) async {
    final form = FormData({
      "type": "1",
      "email": email,
      // "mobile": "",
      "address_1": address_1,
      "address_2": address_2,
      "city": city,
      "state": state,
      "zip_code": zip_code,
      "ssn": ssn,
      "name": name,
      "job_title": job_title,
      "annual_income": annual_income,
      "purpouse_of_opening_account": purpouse_of_opening_account,
      "password": password,
      "loan_type": loan_type,
      "first_name": first_name,
      "last_name": last_name,
      "date_of_birth": "25-8-2022",
      "device_id": device_id,
      "fcm_token": fcm_token,
      "devicy_type": devicy_type,
      "middle_name": middle_name,
    });
    return form;
  }

  void checkDeviceType() {
    if (Platform.isMacOS) {
      device_type = "Ios";
    } else {
      device_type = "Android";
    }
  }
}
