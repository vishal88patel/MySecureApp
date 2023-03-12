import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/presentation/LoginEmailScreen/controller/login_email_screen_controller.dart';
import 'package:platform_device_id/platform_device_id.dart';

import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../../CreatePasswordScreen/controller/create_password_screen_controller.dart';
import '../../EnterAddress/controller/enter_address_screen_controller.dart';
import '../../EnterLegalNameDetails/controller/enter_legel_name_screen_controller.dart';
import '../../EnterPersonalDetails/controller/enter_personal_detail_screen_controller.dart';
import '../../LoginScreen/controller/login_screen_controller.dart';
import '../../LoginScreen/models/login_response_model.dart';
import '../../loader_screen.dart';
import '../model/get_loan_type_response_model.dart';
import 'get_status_income_response_model.dart';

class PersonalScreenController extends GetxController {
  String token = "";

  var loginController = Get.put(LoginScreenController());
  var loginEmailController = Get.put(LoginEmailScreenController());
  var createPasswordController = Get.put(CreatePasswordScreenController());
  var enterPersonalDetailController = Get.put(EnterBirthDateController());
  var enterLegalNameController = Get.put(EnterLegalNameScreenController());
  var enterAddressController = Get.put(EnterAddressScreenController());

  // var enterAddressController = Get.find<EnterBirthDateController>();

  TextEditingController employmentNameController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController annualIncomeController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  var purposeOfOpeningAcc = "".obs;
  var employmentStatus = "Employed".obs;
  String? employmentStatusDropDownValue;
  var setSelectedAnnualIncome = "".obs;
  var setSelectedGender = "".obs;
  String? setSelectedAnnualIncomeDropdown;
  String? setSelectedForGender;
  var dropdownTextForStatus =
      ['Employed', 'Retired', 'Disability', 'Self Employed'].obs;
  var dropdownTextForGender = ['Male', 'Female', 'Other'].obs;
  var dropdownTextForIncome = [
    'Less than \$25,000',
    '\$25,000 - \$50,000',
    '\$50,000 - \$75,000',
    '\$75,000 - \$1,00,000',
    'Greter than \$1,00,000'
  ].obs;
  var loanModel = GetLoanTypeResponseModel().obs;
  var getStatusIncomeResponseModel = GetStatusAndIncomeResponseModel().obs;
  EmployeementStatus statusIncomeObject = EmployeementStatus();
  var selectedLoanId = "1".obs;
  var loanList = [].obs;
  var showJobTitle = false.obs;
  var nameOfBusinessTitle = false.obs;

  String device_type = "";

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getFcmToken();
    employmentNameController.text = setSelectedAnnualIncome.value;
    annualIncomeController.text = setSelectedAnnualIncome.value;
    checkDeviceType();
    getLoanTypeApi();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setSelected(String value) {
    employmentStatus.value = value;
    employmentNameController.text = employmentStatus.value;
    employmentStatusDropDownValue = value;
    dropdownTextForStatus.refresh();
    // Employed', 'Retired', 'Disability','Self Employed
    if (employmentNameController.text == "Retired" ||
        employmentNameController.text == "Disability") {
      showJobTitle.value = false;
      nameOfBusinessTitle.value = false;
    }
    if (employmentNameController.text == "Self Employed") {
      nameOfBusinessTitle.value = true;
      showJobTitle.value = false;
    }
    if (employmentNameController.text == "Employed") {
      showJobTitle.value = true;
      nameOfBusinessTitle.value = false;
    }
    // if(employmentNameController.text=="Disability"){
    //   nameOfBusinessTitle.value=true;
    //   showJobTitle.value=false;
    //
    // }
    else {
      // showJobTitle.value=true;
      // nameOfBusinessTitle.value=true;

    }
  }

  void setAnnualIncome(String value) {
    setSelectedAnnualIncome.value = value;
    annualIncomeController.text = setSelectedAnnualIncome.value;
    setSelectedAnnualIncomeDropdown = setSelectedAnnualIncome.value;
    dropdownTextForIncome.refresh();
  }

  void setGender(String value) {
    setSelectedGender.value = value;
    // annualIncomeController.text=setSelectedAnnualIncome.value;
    setSelectedForGender = setSelectedGender.value;
    dropdownTextForGender.refresh();
  }

  Future<void> getLoanTypeApi() async {
    ApiService()
        .callGetApi(
            body: await getLoanTypeBody(),
            headerWithToken: false,
            url: ApiEndPoints.LOAN_TYPE)
        .then((value) {
      print(value);
      if (value!=null && value['status']) {
        loanModel.value = GetLoanTypeResponseModel.fromJson(value);
        loanList.value = loanModel.value.data ?? [];
      } else {
        UIUtils.showSnakBar(
            bodyText: "Error fatching loan type", headerText: StringConstants.ERROR);
      }
    });
  }

  Future<void> getStatusAndIncome() async {
    ApiService()
        .callGetApi(
            body: await getLoanTypeBody(),
            headerWithToken: false,
            url: ApiEndPoints.GET_STATUS_AND_INCOME_API)
        .then((value) {
      print(value);
      if (value['status']) {
        getStatusIncomeResponseModel.value =
            GetStatusAndIncomeResponseModel.fromJson(value);
        statusIncomeObject =
            getStatusIncomeResponseModel.value.data!.employeementStatus!;
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

  void onClickOfButton() {
    if (employmentNameController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter employment type",
          headerText: StringConstants.ERROR);
    } else if (showJobTitle.value && jobTitleController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter job title",
          headerText: StringConstants.ERROR);
    } else if (setSelectedAnnualIncome.isEmpty || setSelectedAnnualIncome == "") {
      UIUtils.showSnakBar(
          bodyText: "Please enter annual income",
          headerText: StringConstants.ERROR);
    } else if (setSelectedGender.isEmpty || setSelectedGender == "") {
      UIUtils.showSnakBar(
          bodyText: "Please Select Gender", headerText: StringConstants.ERROR);
    }else if (nameOfBusinessTitle.value && businessNameController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please Select Name Of Business", headerText: StringConstants.ERROR);
    } else {
      Get.to(() => LoaderScreen(AppRoutes.purpouseAccountScreen),
          transition: Transition.rightToLeft);

      // Get.toNamed(AppRoutes.purpouseAccountScreen);
    }
  }

  void onClickOfRegisterButton() {
    if (purposeOfOpeningAcc.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter account opening purpose",
          headerText: StringConstants.ERROR);
    } else if (purposeOfOpeningAcc.value != "using_wallet_service" &&
        selectedLoanId.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter loan type",
          headerText: StringConstants.ERROR);
    } else {
      callRegisterApi();
      // Get.toNamed(AppRoutes.personalDetailScreen);
    }
  }

  Future<void> callRegisterApi() async {
    ApiService()
        .callPostApi(
            body: loginController.emailController.text.isEmpty
                ? await getRegisterBody2(
                    type: loginController.emailController.text.isEmpty
                        ? "2"
                        : "1",
                    email: loginController.emailController.text.isEmpty
                        ? ""
                        : loginController.emailController.text,
                    mobile: loginEmailController.phoneController.text.isEmpty
                        ? ""
                        : loginEmailController.phoneController.text,
                    password:
                        createPasswordController.confirmPassController.text,
                    address_1: enterAddressController.address01Controller.text,
                    address_2:
                        enterAddressController.address02Controller.text.isEmpty ? "":enterAddressController.address02Controller.text,
                    city: enterAddressController.cityController.text,
                    state: enterAddressController.selectedState!.value,
                    zip_code: enterAddressController.zipCodeController.text,
                    ssn: enterPersonalDetailController.ssnController.text,
                    name: employmentNameController.text,
                    job_title: jobTitleController.text == ""
                        ? "No Jobe Title"
                        : jobTitleController.text,
                    annual_income: annualIncomeController.text,
                    purpouse_of_opening_account: purposeOfOpeningAcc.value,
                    loan_type: selectedLoanId.value,
                    first_name:
                        enterLegalNameController.firstNameController.text,
                    last_name: enterLegalNameController.lastNameController.text,
                    date_of_birth:
                        enterPersonalDetailController.dobController.text,
                    device_id: await PlatformDeviceId.getDeviceId,
                    fcm_token: token,
                    devicy_type: device_type,
                    middle_name:
                        enterLegalNameController.middleNameController.text,
              cashtag: enterLegalNameController.secureTagController.text
                  )
                : await getRegisterBody(
                    type: loginController.emailController.text.isEmpty
                        ? "2"
                        : "1",
                    email: loginController.emailController.text.isEmpty
                        ? ""
                        : loginController.emailController.text,
                    mobile: loginEmailController.phoneController.text.isEmpty
                        ? ""
                        : loginEmailController.phoneController.text,
                    password:
                        createPasswordController.confirmPassController.text,
                    address_1: enterAddressController.address01Controller.text,
                    address_2: enterAddressController.address02Controller.text.isEmpty ? "":enterAddressController.address02Controller.text,
                    city: enterAddressController.cityController.text,
                    state: enterAddressController.selectedState!.value,
                    zip_code: enterAddressController.zipCodeController.text,
                    ssn: enterPersonalDetailController.ssnController.text,
                    name: employmentNameController.text,
                    job_title: jobTitleController.text == ""
                        ? "No Jobe Title"
                        : jobTitleController.text,
                    annual_income: annualIncomeController.text,
                    purpouse_of_opening_account: purposeOfOpeningAcc.value,
                    loan_type: selectedLoanId.value,
                    first_name:
                        enterLegalNameController.firstNameController.text,
                    last_name: enterLegalNameController.lastNameController.text,
                    date_of_birth: enterPersonalDetailController.dobController.text,
                    device_id: await PlatformDeviceId.getDeviceId,
                    fcm_token: token,
                    devicy_type: device_type,
                    middle_name:
                        enterLegalNameController.middleNameController.text,
                cashtag: "\$"+enterLegalNameController.secureTagController.text
                  ),
            headerWithToken: false,
            url: ApiEndPoints.REGISTER)
        .then((value) {
      print(value);
      if (value['status']) {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.SUCCESS);
        LoginResponseModel loginResponseModel =
            LoginResponseModel.fromJson(value);
        PrefUtils.setString(StringConstants.AUTH_TOKEN,
            loginResponseModel.data!.token.toString());
        PrefUtils.setString(StringConstants.IS_KYC_DONE,
            loginResponseModel.data!.isKyc.toString());
        PrefUtils.putObject(StringConstants.LOGIN_RESPONSE, loginResponseModel);
        PrefUtils.setBool(StringConstants.SHOW_WELCOME_DISLOUGE, true);
        PrefUtils.setString(StringConstants.IS_CASH_CARD, loginResponseModel.data!.isCashCard.toString());

        Get.offAllNamed(AppRoutes.dashBoardScreen,
            arguments: {"bottomTabCount": 0});
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getRegisterBody({
    required String type,
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
    required String cashtag,
  }) async {
    final form = FormData({
      "type": type,
      "email": email,
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
      "date_of_birth": date_of_birth,
      "device_id": device_id,
      "fcm_token": fcm_token,
      "devicy_type": devicy_type,
      "middle_name": middle_name,
      "cashtag": cashtag,
    });
    return form;
  }

  Future<FormData> getRegisterBody2({
    required String type,
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
    required String cashtag,
  }) async {
    final form = FormData({
      "type": type,
      "mobile": mobile,
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
      "date_of_birth": date_of_birth,
      "device_id": device_id,
      "fcm_token": fcm_token,
      "devicy_type": devicy_type,
      "middle_name": middle_name,
      "cashtag": cashtag,
    });
    return form;
  }

  void checkDeviceType() {
    if (kIsWeb) {
      device_type = "Web";
    }  else if (Platform.isMacOS) {
      device_type = "Ios";
    } else {
      device_type = "Android";
    }
  }

  Future<void> getFcmToken() async {
    token = (await FirebaseMessaging.instance.getToken())!;
  }
}
