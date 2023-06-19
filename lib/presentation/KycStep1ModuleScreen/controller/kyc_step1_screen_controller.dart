import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:secure_cash_app/App%20Configurations/color_constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/api_service.dart';
import '../../../ApiServices/network_info.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/math_utils.dart';
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../../utils/HelperFiles/regex_utils.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../../LoginScreen/models/login_response_model.dart';
import '../front_back_licence_screen.dart';
import '../kyc_select_proof_screen.dart';



class KycStep1ScreenController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
 // TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController ssnController = TextEditingController();

  LoginResponseModel? loginResponseModel = LoginResponseModel();
  File? profileImage;
  File? licenceImageFront;
  File? licenceImageBack;
  var netImage1 = "".obs; //profile
  var netImage2 = "".obs; //licence_front
  var netImage3 = "".obs; //licence_back
  var netImage4 = "".obs; //passport
  var netImage5 = "".obs; //selfie_with_document
  var qrCodeResult = "".obs;
  var firstName = "".obs;
  var lastName = "".obs;
  var dob = "".obs;
  var isVerified = "0".obs;
  var readOnly = true.obs;
  var isAgree = false.obs;
  var step2 = false.obs;
  var apiTy = 0.obs;
  DateTime selectedDate = DateTime.now();


  var progress1 = false.obs;
  var progress2 = false.obs;
  var progress3 = false.obs;
  var progress4 = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    getStoredData();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
  void isAgreeCheckBox() {
    isAgree.value = !isAgree.value;
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
              colorScheme: ColorScheme.light(
                  onPrimary: ColorConstant.primaryDarkGreen, // selected text color
                  onSurface: Colors.white, // default text color
                  primary: Colors.white // circle color
              ),
              dialogBackgroundColor: ColorConstant.primaryDarkGreen,
              textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                      textStyle: TextStyle(
                          color: ColorConstant.primaryDarkGreen,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          fontFamily: 'Quicksand'),
                      primary: Colors.white, // color of button's letters
                      backgroundColor: ColorConstant.primaryDarkGreen, // Background color
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: ColorConstant.primaryLightGreen,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(50))))),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      final DateFormat formatter = DateFormat('MM/dd/yyyy');
      final String startDate = formatter.format(picked);
      dobController.text = startDate;
      log('startDate $startDate');
    }
  }
  bool isAdult(String birthDateString) {
    String datePattern = "dd/MM/yyyy";

    DateTime birthDate = DateFormat(datePattern).parse(birthDateString);
    DateTime today = DateTime.now();

    int yearDiff = today.year - birthDate.year;
    int monthDiff = today.month - birthDate.month;
    int dayDiff = today.day - birthDate.day;

    return yearDiff > 18 || yearDiff == 18 && monthDiff >= 0 && dayDiff >= 0;
  }

  Future<void> getStoredData() async {
    loginResponseModel =
    (await PrefUtils.getLoginModelData(StringConstants.LOGIN_RESPONSE));
    firstNameController.text = loginResponseModel!.data!.firstName.isNull
        ? ""
        : loginResponseModel!.data!.firstName!;
    lastNameController.text = loginResponseModel!.data!.lastName.isNull
        ? ""
        : loginResponseModel!.data!.lastName!;
    emailController.text = loginResponseModel!.data!.email.isNull
        ? ""
        : loginResponseModel!.data!.email!;
    /*phoneNumberController.text = loginResponseModel!.data!.mobile.isNull
        ? ""
        : loginResponseModel!.data!.mobile!;*/
    dobController.text = loginResponseModel!.data!.dateOfBirth.isNull
        ? ""
        : dateConverter(loginResponseModel!.data!.dateOfBirth!.toString());
    ssnController.text = loginResponseModel!.data!.ssn.isNull
        ? ""
        : loginResponseModel!.data!.ssn!;
    isVerified.value = PrefUtils.getString(StringConstants.IS_KYC_DONE);
  }

  void onClickOfNextButton(BuildContext context) {
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
          bodyText: "Please enter Social Security Number", headerText: StringConstants.ERROR);
    } else if (ssnController.text.length != 9) {
      UIUtils.showSnakBar(
          bodyText: "Social Security Number Should be 9 digit number",
          headerText: StringConstants.ERROR);
    } else if (!isAgree.value) {
      UIUtils.showSnakBar(
          bodyText: "Please confirm your details",
          headerText: StringConstants.ERROR);
    } else {

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => KycSelectProofScreen()),
      );
     /* Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const FrontBackLicenceCameraScreen(
              image: 2,
              title:
              'Scan the front of your\ndriver' 's license or state ID',
            )),
      );*/
    }
  }

  void progress() {
    progress1.value = true;
    Future.delayed(Duration(milliseconds: 1000), () {
      progress2.value = true;
      Future.delayed(Duration(milliseconds: 1000), () {
        progress3.value = true;
        Future.delayed(Duration(milliseconds: 1000), () {
          progress4.value = true;
          UIUtils.showSnakBar(
              bodyText: "KYC Document Uploaded Successfully",
              headerText: StringConstants.SUCCESS);
          if(apiTy.value==3){
            Get.toNamed(AppRoutes.kycSuccess2Screen,arguments: {
              "API_TYPE": apiTy.value
            });
          }else{
            Get.toNamed(AppRoutes.kycSuccessScreen,arguments: {
              "API_TYPE": apiTy.value
            });
          }

          progress1.value = false;
          progress2.value = false;
          progress3.value = false;
          progress4.value = false;

        });
      });
    });
  }

  void progressLevel2() {
    progress1.value = true;
    Future.delayed(Duration(milliseconds: 1000), () {
      progress2.value = true;
      Future.delayed(Duration(milliseconds: 1000), () {
        progress3.value = true;
        Future.delayed(Duration(milliseconds: 1000), () {
          progress4.value = true;
          UIUtils.showSnakBar(
              bodyText: "KYC has been completed successfully",
              headerText: StringConstants.SUCCESS);
        });
      });
    });
  }
  void onClickOfSubmitIdButton() {
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
      callKycStep1IdApi();
    }
  }

  void onClickOfSubmitPassButton() {
    if (netImage4.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please Click Your E-KYC Profile Selfie",
          headerText: StringConstants.ERROR);
    } else {
      callKycStep1PassApi();
    }
  }

  void onClickOfSubmitStep2Button() {
    if (netImage5.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please Click Your E-KYC Profile Selfie",
          headerText: StringConstants.ERROR);
    } else {
      callKycStep2Api();
    }
  }

  callKycStep1IdApi() async {
    firstNameController.text="N/A";
    lastNameController.text="N/A";
    emailController.text="N/A";
    ssnController.text="N/A";
    dobController.text="N/A";
    firstName.value="N/A";
    lastName.value="N/A";
    dob.value="N/A";
    //  UIUtils.showProgressDialog(isCancellable: false);
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
    request.fields['mobile'] = "";
    request.fields['ssn'] = ssnController.text;
    request.fields['kyc_status'] = "1";
    request.fields['kyc_type'] = "1";
    request.fields['date_of_birth'] = dobController.text;
    request.fields['licence_json'] = "{'first_name':${firstName.value.toString()},'last_name':${lastName.value.toString()},'date_of_birth': ${dob.value.toString()}}";

    request.files.add(await http.MultipartFile.fromPath("profile", netImage1.value));

    request.files.add(await http.MultipartFile.fromPath("licence_front", netImage2.value));

    request.files.add(await http.MultipartFile.fromPath("licence_back", netImage3.value));

    var response = await request.send();

    var responsed = await http.Response.fromStream(response);

    final responseData = json.decode(responsed.body);

    if (response.statusCode == 200) {
      apiTy.value=1;
      //   UIUtils.hideProgressDialog();
      progress();
      PrefUtils.setString(StringConstants.IS_KYC_DONE, "2");
    } else {
      //  UIUtils.hideProgressDialog();
      UIUtils.showSnakBar(
          bodyText: responseData['message'],
          headerText: StringConstants.SUCCESS);
    }
  }

  callKycStep1PassApi() async {

    //  UIUtils.showProgressDialog(isCancellable: false);
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
    request.fields['mobile'] = "";
    request.fields['ssn'] = ssnController.text;
    request.fields['kyc_status'] = "1";
    request.fields['kyc_type'] = "2";
    request.fields['date_of_birth'] = dobController.text;

    request.files.add(await http.MultipartFile.fromPath("passport_image", netImage4.value));

    var response = await request.send();

    var responsed = await http.Response.fromStream(response);

    final responseData = json.decode(responsed.body);

    if (response.statusCode == 200) {
      apiTy.value=2;
      //   UIUtils.hideProgressDialog();
      progress();

      PrefUtils.setString(StringConstants.IS_KYC_DONE, "1");

    } else {
      //  UIUtils.hideProgressDialog();
      UIUtils.showSnakBar(
          bodyText: responseData['message'],
          headerText: StringConstants.SUCCESS);
    }
  }

  callKycStep2Api() async {

    //  UIUtils.showProgressDialog(isCancellable: false);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
      'Bearer ${await PrefUtils.getString(StringConstants.AUTH_TOKEN)}',
    };

    var request =
    http.MultipartRequest('POST', Uri.parse(ApiEndPoints.KYC_UPDATE));

    request.headers.addAll(headers);
    request.fields['kyc_status'] = "3";
    request.files.add(await http.MultipartFile.fromPath("selfi_with_document", netImage5.value));

    var response = await request.send();

    var responsed = await http.Response.fromStream(response);

    final responseData = json.decode(responsed.body);

    if (response.statusCode == 200) {
      apiTy.value=3;
      //   UIUtils.hideProgressDialog();
      progress();
      step2.value=true;
      PrefUtils.setString(StringConstants.IS_KYC_DONE, "3");
    } else {
      //  UIUtils.hideProgressDialog();
      UIUtils.showSnakBar(
          bodyText: responseData['message'],
          headerText: StringConstants.SUCCESS);
    }
  }
  goToHome() {
    Get.offAllNamed(AppRoutes.dashBoardScreen,
        arguments: {"bottomTabCount": 0});
  }
}
