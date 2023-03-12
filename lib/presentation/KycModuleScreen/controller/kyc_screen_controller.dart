import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
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
import '../../../utils/HelperFiles/regex_utils.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../../LoginScreen/models/login_response_model.dart';



class KycScreenController extends GetxController {

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  LoginResponseModel? loginResponseModel = LoginResponseModel();

  var isLoaderShow = false.obs;
  var kycFrom = 2.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationIDRecived = '';

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

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getStoredData() async {
    loginResponseModel =
    (await PrefUtils.getLoginModelData(StringConstants.LOGIN_RESPONSE));
    emailController.text = loginResponseModel!.data!.email.isNull
        ? ""
        : loginResponseModel!.data!.email!;
    /*phoneNumberController.text = loginResponseModel!.data!.mobile.isNull
        ? ""
        : loginResponseModel!.data!.mobile!;*/

  }


  void onTapOfSendOtpEmailButton() {
    if (emailController.text.isEmpty) {
      UIUtils.showSnakBar(
        headerText: StringConstants.ERROR,
        bodyText: "Please enter email",
      );
    } else if (emailController.text.isNotEmpty) {
      if (RegexPatterns.emailRegex.hasMatch(emailController.text) ==
          false) {
        UIUtils.showSnakBar(
          headerText: StringConstants.ERROR,
          bodyText: "Please enter Valid email",
        );
      } else {
        sendOtpEmailApi();
      }
    } else {}
  }

  Future<void> sendOtpEmailApi() async {
    ApiService()
        .callPostApi(
        body: await getBodyEmail(emailController.text,"1",""),
        headerWithToken: true,
        url: ApiEndPoints.SEND_OTP_ON_EMAIL)
        .then((value) {
      print(value);
      if (value['status']) {
        kycFrom.value=1;
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.SUCCESS);
        Get.toNamed(AppRoutes.kycOtpScreen);
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getBodyEmail(String email,String type,String number) async {
    final form = FormData({"email": email,"type": type,"mobile": type});
    print(form.toString());
    return form;
  }

  Future<void> sendOtpPhoneApi() async {
    ApiService()
        .callPostApi(
        body: await getBodyEmail("","2",phoneNumberController.text),
        headerWithToken: true,
        showLoader: false,
        url: ApiEndPoints.SEND_OTP_ON_EMAIL)
        .then((value) {
      print(value);
      if (value['status']) {
        kycFrom.value=2;
        /*UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.SUCCESS);*/
        //Get.toNamed(AppRoutes.kycOtpScreen);
      } else {
        /*UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);*/
      }
    });
  }

  void onClickGetOtp(BuildContext context) async {

    if (phoneNumberController.text.isEmpty ||
        phoneNumberController.text.isNull) {
      UIUtils.showSnakBar(
          bodyText: "Please Enter Mobile Number",
          headerText: StringConstants.ERROR);
    } else if (phoneNumberController.text.length != 17) {
      UIUtils.showSnakBar(
          bodyText: "Mobile Number Should be 11 digit number",
          headerText: StringConstants.ERROR);
    } else {
      isLoaderShow.value=true;
      UIUtils.showProgressDialog(isCancellable: false);
      log('sdfkksafkakksfh1 ${phoneNumberController.text}');
      String number = phoneNumberController.text
          .replaceAll('(', '')
          .replaceAll(')', '')
          .replaceAll('-', '')
          .replaceRange(5, 7, '');
      log('sdfkksafkakksfh ${number}');
      sendOtpPhoneApi();
      auth.verifyPhoneNumber(
          phoneNumber: phoneNumberController.text,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await auth
                .signInWithCredential(credential)
                .then((value) => print('You are logged in successfully'));
          },
          verificationFailed: (FirebaseAuthException exception) {
            UIUtils.hideProgressDialog();
            print('exception.message ${exception.message}');
            UIUtils.showSnakBar(bodyText: "Verification Failed",headerText: StringConstants.ERROR);
            isLoaderShow.value=false;
          },
          codeSent: (String verificationID, int? resendToken) {
            verificationIDRecived = verificationID;
            UIUtils.hideProgressDialog();
            Future.delayed(Duration(milliseconds: 1500),(){
              // UIUtils.hideProgressDialog();
              UIUtils.showSnakBar(bodyText: 'OTP Sent Successfully',headerText: StringConstants.SUCCESS);
              isLoaderShow.value=false;
              Get.toNamed(AppRoutes.kycOtpScreen);

            });
          },
          codeAutoRetrievalTimeout: (String verificationID) {});
      // UIUtils.showProgressDialog(isCancellable: false);

    }
  }

  void onClickVerifyOtp(BuildContext context) async {
    if (otpController.text.isEmpty || otpController.text.isNull) {
      UIUtils.showSnakBar(
          bodyText: "Please Enter Valid OTP",
          headerText: StringConstants.ERROR);
    } else if (otpController.text.length!=6 && otpController.text.length!=4) {
      UIUtils.showSnakBar(
          bodyText: "OTP Should be 4 or 6 digit number",
          headerText: StringConstants.ERROR);
    } else {
      if(kycFrom==1){
        verifyOtpEmailApi("1");
      }else{
        UIUtils.showProgressDialog(isCancellable: false);

        print('OTP number ${otpController.text}');
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationIDRecived, smsCode: otpController.text);
        FocusScope.of(context).requestFocus(new FocusNode());

        await auth.signInWithCredential(credential).then((value){
          if (value.user!.uid.isNotEmpty) {
            UIUtils.hideProgressDialog();
            verifyOtpEmailApi("2");
            isLoaderShow.value=false;

          }
          print('Your are logged in  successfully  ');
        }).catchError((e){
          UIUtils.hideProgressDialog();
          UIUtils.showSnakBar(bodyText: "Otp is Incorrect",headerText: StringConstants.ERROR);
          isLoaderShow.value=false;

        });

      }

    }
  }
  Future<void> verifyOtpEmailApi(String type) async {
    ApiService()
        .callPostApi(showLoader: true,
        body: await getBodyVerifyOtp(type,otpController.text.toString()),
        headerWithToken: true,
        url: ApiEndPoints.VERIFY_OTP_OF_EMAIL)
        .then((value) {
      print(value);
      if (value['status']) {
        PrefUtils.setString(StringConstants.IS_OTP_DONE, "1");
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.SUCCESS);
        Get.toNamed(AppRoutes.kycOtpSuccessScreen);
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getBodyVerifyOtp(String type,String otp) async {
    final form = FormData({"type": type,"otp":otp});
    print(form.toString());
    return form;
  }

}
