import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/ApiServices/api_service.dart';
import 'package:secure_cash_app/App%20Configurations/api_endpoints.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/regex_utils.dart';
import '../../../utils/HelperFiles/ui_utils.dart';

class ForgotPasswordScreenController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  TextEditingController createPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  bool showNext = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationIDRecived = '';
  var createPaasIsObsecure = true.obs;
  var confirmPassIsObsecure = true.obs;
  var isEmailPhone = true.obs;
  var isPhone = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    emailController.clear();
    phoneNumberController.clear();
    otpController.clear();
    confirmPassController.clear();
    createPassController.clear();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onTapOfCreatePassObsecure(bool val) {
    createPaasIsObsecure.value = !val;
  }


  void emailPhoneChange() {
    isEmailPhone.value = !isEmailPhone.value;
  }


  void onTapOfConfirmPassObsecure(bool val) {
    confirmPassIsObsecure.value = !val;
  }

  void onTapOfButton() async{
    log(emailController.text);
    if(emailController.text.isEmpty){
      UIUtils.showSnakBar(
        headerText:StringConstants.ERROR,
        bodyText: "Enter email address ",
      );
    }
    else if (RegexPatterns.emailRegex.hasMatch(emailController.text) == true) {
      sendOtpEmailApi(type: '1',mobile: '');
    }else{
      UIUtils.showSnakBar(
        headerText:StringConstants.ERROR,
        bodyText: "Enter a valid email address ",
      );
    }
  }
  void onTapResetButton(){
    if(isEmailPhone.value){
      if(createPassController.text==confirmPassController.text){
        sendResetPasswordApi(
            type: '1',
            isOtp: '1',
            password: confirmPassController.text,
            otp: otpController.text,
            email: emailController.text,
          mobile: ''
        );
      }else{
        UIUtils.showSnakBar(
            bodyText: "Password is not same",
            headerText: StringConstants.ERROR);
      }

    }else{
      if(createPassController.text==confirmPassController.text){
        sendResetPasswordApi(
            type: '2',
            isOtp: '1',
            password: confirmPassController.text,
            otp: otpController.text,
            email: emailController.text,
            mobile: phoneNumberController.text.trim()
        );
      }else{
        UIUtils.showSnakBar(
            bodyText: "Password is not same",
            headerText: StringConstants.ERROR);
      }

    }

  }
  void onTapEmailVerifyButton(){
    sendResetPasswordApi(
        type: '1',
        isOtp: '2',
        password: confirmPassController.text,
        otp: otpController.text,
        email: emailController.text,
        mobile: ''
    );
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
      await  sendOtpEmailApi(type: '2',mobile:phoneNumberController.text);
 if(isPhone.value){
  UIUtils.showProgressDialog(isCancellable: false);
  log('sdfkksafkakksfh1 ${phoneNumberController.text}');
  log('sdfkksafkakksfh1 ${isPhone.value}');
  String number = phoneNumberController.text
      .replaceAll('(', '')
      .replaceAll(')', '')
      .replaceAll('-', '')
      .replaceRange(5, 7, '');
  log('sdfkksafkakksfh ${number}');
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
      },
      codeSent: (String verificationID, int? resendToken) {
        verificationIDRecived = verificationID;
        Future.delayed(Duration(milliseconds: 1500),(){
          // UIUtils.hideProgressDialog();
          UIUtils.showSnakBar(bodyText: 'OTP Sent Successfully',headerText: StringConstants.SUCCESS);
          UIUtils.hideProgressDialog();
          Get.toNamed(AppRoutes.forgotOtpScreen);
        });
      },
      codeAutoRetrievalTimeout: (String verificationID) {});
  // UIUtils.showProgressDialog(isCancellable: false);
}


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
      UIUtils.showProgressDialog(isCancellable: false);
      print('OTP number ${otpController.text}');
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationIDRecived, smsCode: otpController.text);
      FocusScope.of(context).requestFocus(new FocusNode());
      await auth.signInWithCredential(credential).then((value){
        if (value.user!.uid.isNotEmpty) {
          UIUtils.hideProgressDialog();
          Get.toNamed(AppRoutes.forgotCreatePasswordScreen);

        }
        print('Your are logged in  successfully  ');
      }).catchError((e){
        UIUtils.hideProgressDialog();
        UIUtils.showSnakBar(bodyText: "Otp is Incorrect",headerText: StringConstants.ERROR);
      });
    }
  }

  Future<void> sendOtpEmailApi({required String type,mobile}) async {
    ApiService()
        .callPostApi(
        body: await getBodyEmail(text: emailController.text,type: type,mobile: mobile),
        headerWithToken: true,
        url: ApiEndPoints.SEND_OTP_ON_EMAIL)
        .then((value) {
      print(value);
      if (value['status']) {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.SUCCESS);
        if(type=='2'){
          isPhone.value = true;
          isEmailPhone.value = true;
        }else {
          Get.toNamed(AppRoutes.forgotOtpScreen);
        }

      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }
  Future<FormData> getBodyEmail({required String text,type,mobile}) async {
    final form = FormData({
      "email": text,
      "type": type,
      'mobile' : mobile
    });
    print(form.toString());
    return form;
  }

  Future<void> sendResetPasswordApi({required String type,otp,password,email,isOtp,mobile}) async {
    ApiService()
        .callPostApi(
        body: await getResetPasswordData(type: type,email: email,
            otp: otp,password: password,mobile: mobile),
        headerWithToken: true,
        url: ApiEndPoints.RESET_PASSWORD)
        .then((value) {
      print(value);
      if (value['status']) {
        if(isOtp =='2'){
          UIUtils.showSnakBar(
              bodyText:'OTP Verified Successfully', headerText: StringConstants.SUCCESS);
        }else{
          UIUtils.showSnakBar(
              bodyText: value['message'], headerText: StringConstants.SUCCESS);
        }

        if(isOtp =='2'){
          Get.toNamed(AppRoutes.forgotCreatePasswordScreen);
        }else{
          Get.toNamed(AppRoutes.loginScreen);

        }
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }
  Future<FormData> getResetPasswordData({required String type,otp,password,email,mobile}) async {
    final form = FormData({
      "type": type,
      "otp": otp,
      "password": password,
      "email": email,
      "mobile" : mobile
                            });
    print(form.toString());
    return form;
  }
}
