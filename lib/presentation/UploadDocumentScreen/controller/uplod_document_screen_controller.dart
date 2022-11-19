import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/api_service.dart';
import '../../../ApiServices/network_info.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import 'package:http/http.dart' as http;

import '../../LoginScreen/models/login_response_model.dart';

class UploadDocumentScreenController extends GetxController {
  File? profileImage;
  File? licenceImageFront;
  File? licenceImageBack;
  var netImage1 = "".obs;
  var netImage2 = "".obs;
  var netImage3 = "".obs;
  var qrCodeResult = "".obs;
  var firstName = "".obs;
  var lastName = "".obs;
  var dob = "".obs;
  var imageUrll = "".obs;
  var userName = "".obs;
  var isVerified = "0".obs;
  var isAgree = false.obs;
  LoginResponseModel? loginResponseModel = LoginResponseModel();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController ssnController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getStoredData();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.onInit();
  }

  void isAgreeCheckBox(){
    isAgree.value=!isAgree.value;
  }

  Future<void> getStoredData() async {
    loginResponseModel =
        (await PrefUtils.getLoginModelData(StringConstants.LOGIN_RESPONSE));
    userName.value = loginResponseModel!.data!.firstName! +
        " " +
        loginResponseModel!.data!.lastName.toString();

    firstNameController.text = loginResponseModel!.data!.firstName.isNull
        ? ""
        : loginResponseModel!.data!.firstName!;
    lastNameController.text = loginResponseModel!.data!.lastName.isNull
        ? ""
        : loginResponseModel!.data!.lastName!;
    mobileController.text = loginResponseModel!.data!.mobile.isNull
        ? ""
        : loginResponseModel!.data!.mobile!;
    dobController.text = loginResponseModel!.data!.dateOfBirth.isNull
        ? ""
        : loginResponseModel!.data!.dateOfBirth!;
    ssnController.text = loginResponseModel!.data!.ssn.isNull
        ? ""
        : loginResponseModel!.data!.ssn!;
    emailController.text = loginResponseModel!.data!.email.isNull
        ? ""
        : loginResponseModel!.data!.email!;
    isVerified.value = PrefUtils.getString(StringConstants.IS_KYC_DONE);
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onClickGetOtp() {
    if (phoneNumberController.text.isEmpty || phoneNumberController.text.isNull) {
      UIUtils.showSnakBar(
          bodyText: "Please Enter Mobile Number",
          headerText: StringConstants.ERROR);
    } else if (phoneNumberController.text.length != 17) {
      UIUtils.showSnakBar(
          bodyText: "Mobile Number Should be 11 digit number",
          headerText: StringConstants.ERROR);
    }else{
      Get.toNamed(AppRoutes.kvcOtpNumber);
    }
  }
  void onClickVerifyOtp() {
    if (otpController.text.isEmpty || otpController.text.isNull) {
      UIUtils.showSnakBar(
          bodyText: "Please Enter Valid OTP",
          headerText: StringConstants.ERROR);
    } else if (otpController.text.length != 4) {
      UIUtils.showSnakBar(
          bodyText: "OTP Should be 4 digit number",
          headerText: StringConstants.ERROR);
    }else{
            Get.toNamed(AppRoutes.uploadDocument1);
    }
  }

  void onClickOfNextButton() {
    if (firstNameController.text.isEmpty || firstNameController.text.isNull) {
      UIUtils.showSnakBar(
          bodyText: "Please Enter First Name",
          headerText: StringConstants.ERROR);
    } else if (lastNameController.text.isEmpty ||
        lastNameController.text.isNull) {
      UIUtils.showSnakBar(
          bodyText: "Please Enter Last Name",
          headerText: StringConstants.ERROR);
    } else if (emailController.text.isEmpty || emailController.text.isNull) {
      UIUtils.showSnakBar(
          bodyText: "Please Enter Email", headerText: StringConstants.ERROR);
    } else if (dobController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter Date of Birth",
          headerText: StringConstants.ERROR);
    } else if (!isAdult(dobController.text)) {
      UIUtils.showSnakBar(
          bodyText: "Under 18 year old are not eligible for register",
          headerText: StringConstants.ERROR);
    } else if (ssnController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter SSN", headerText: StringConstants.ERROR);
    } else if (ssnController.text.length != 9) {
      UIUtils.showSnakBar(
          bodyText: "SSN Should be 9 digit number",
          headerText: StringConstants.ERROR);
    }else if (!isAgree.value) {
      UIUtils.showSnakBar(
          bodyText: "Please confirm your details",
          headerText: StringConstants.ERROR);
    } else {
      Get.toNamed(AppRoutes.uploadDocument2);
    }
  }

  void onClickOfSubmitButton() {
    if (netImage1.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please Click Your E-KYC Profile Selfie",
          headerText: StringConstants.ERROR);
    } else if (netImage2.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please Click Driving Licence Front Photo",
          headerText: StringConstants.ERROR);
    } else if (netImage3.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please Click Driving Licence Back Photo",
          headerText: StringConstants.ERROR);
    } else if (qrCodeResult.isEmpty ||
        qrCodeResult.isNull ||
        qrCodeResult.value == "-1") {
      UIUtils.showSnakBar(
          bodyText: "Please Scan Your Driving Licence",
          headerText: StringConstants.ERROR);
    } else {
      const start1 = "DCS";
      const end1 = "DDE";
      final startIndex1 = qrCodeResult.value.indexOf(start1);
      final endIndex1 =
          qrCodeResult.value.indexOf(end1, startIndex1 + start1.length);
      firstName.value =
          qrCodeResult.value.substring(startIndex1 + start1.length, endIndex1);

      const start2 = "DAC";
      const end2 = "DDF";
      final startIndex2 = qrCodeResult.value.indexOf(start2);
      final endIndex2 =
          qrCodeResult.value.indexOf(end2, startIndex2 + start2.length);
      lastName.value =
          qrCodeResult.value.substring(startIndex2 + start2.length, endIndex2);

      const start3 = "DBB";
      const end3 = "DBA";
      final startIndex3 = qrCodeResult.value.indexOf(start3);
      final endIndex3 =
          qrCodeResult.value.indexOf(end3, startIndex3 + start3.length);
      dob.value =
          qrCodeResult.value.substring(startIndex3 + start3.length, endIndex3);
      print(firstName.value + "," + lastName.value + "," + dob.value);

      scanData(firstName.value, lastName.value, dob.value);
    }
  }

  void scanData(String? fName, String? lName, String? dateOfBirth) {
    if (fName?.toLowerCase().trim() !=
        firstNameController.text.toLowerCase().trim()) {
      UIUtils.showSnakBar(
          bodyText: "Profile details and licence details not match",
          headerText: StringConstants.ERROR);
    } else if (lName?.toLowerCase().trim() !=
        lastNameController.text.toLowerCase().trim()) {
      UIUtils.showSnakBar(
          bodyText: "Last Name is Not match With Driving Licence Last Name",
          headerText: StringConstants.ERROR);
    } else {
      callKycApi();
    }
  }

  callKycApi() async {
    UIUtils.showProgressDialog(isCancellable: false);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer ${await PrefUtils.getString(StringConstants.AUTH_TOKEN)}',
    };

    var request =
        http.MultipartRequest('POST', Uri.parse(ApiEndPoints.KYC_UPDATE));

    request.headers.addAll(headers);

    request.fields['first_name'] = firstNameController.text;
    request.fields['last_name'] = lastNameController.text;
    request.fields['email'] = emailController.text;
    request.fields['mobile'] = mobileController.text;
    request.fields['ssn'] = ssnController.text;
    request.fields['date_of_birth'] = dobController.text;
    request.fields['licence_json'] =
        "{'first_name':${firstName.value.toString()},'last_name':${lastName.value.toString()},'date_of_birth': ${dob.value.toString()}}";

    request.files
        .add(await http.MultipartFile.fromPath("profile", netImage1.value));

    request.files.add(
        await http.MultipartFile.fromPath("licence_front", netImage2.value));

    request.files.add(
        await http.MultipartFile.fromPath("licence_back", netImage3.value));
    var response = await request.send();

    var responsed = await http.Response.fromStream(response);
    final responseData = json.decode(responsed.body);

    if (response.statusCode == 200) {
      UIUtils.hideProgressDialog();
      UIUtils.showSnakBar(
          bodyText: "KYC has been completed successfully",
          headerText: StringConstants.SUCCESS);
      PrefUtils.setString(StringConstants.IS_KYC_DONE, "1");
      Get.offAllNamed(AppRoutes.dashBoardScreen,
          arguments: {"bottomTabCount": 0});
    } else {
      UIUtils.hideProgressDialog();
      UIUtils.showSnakBar(
          bodyText: responseData['message'],
          headerText: StringConstants.SUCCESS);
    }
  }

  Future<FormData> getKycBody({
    required String profile,
    required String licence_front,
    required String licence_back,
    required String licence_json,
  }) async {
    final form = FormData({
      "profile": profile,
      "licence_front": licence_front,
      "licence_back": licence_back,
      "licence_json": licence_json,
    });
    return form;
  }

  Future<void> selectBirthDate(
    BuildContext context,
  ) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900, 8),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
              colorScheme: const ColorScheme.dark(
                  onPrimary: Colors.black, // selected text color
                  onSurface: Colors.white, // default text color
                  primary: Colors.white // circle color
                  ),
              dialogBackgroundColor: Colors.black,
              textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          fontFamily: 'Quicksand'),
                      primary: Colors.white, // color of button's letters
                      backgroundColor: Colors.black, // Background color
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Colors.black,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(50))))),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      final DateFormat formatter = DateFormat('dd-MM-yyyy');
      final String startDate = formatter.format(picked);
      dobController.text = startDate;
      log('startDate $startDate');
    }
  }

  bool isAdult(String birthDateString) {
    String datePattern = "dd-MM-yyyy";

    DateTime birthDate = DateFormat(datePattern).parse(birthDateString);
    DateTime today = DateTime.now();

    int yearDiff = today.year - birthDate.year;
    int monthDiff = today.month - birthDate.month;
    int dayDiff = today.day - birthDate.day;

    return yearDiff > 18 || yearDiff == 18 && monthDiff >= 0 && dayDiff >= 0;
  }
}
