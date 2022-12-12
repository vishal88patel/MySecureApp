import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/regex_utils.dart';
import '../../../utils/HelperFiles/ui_utils.dart';

class ForgotPasswordScreenController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  TextEditingController createPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  bool showNext = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationIDRecived = '';
  var createPaasIsObsecure = true.obs;
  var confirmPassIsObsecure = true.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onTapOfCreatePassObsecure(bool val) {
    createPaasIsObsecure.value = !val;
  }

  void onTapOfVerifyButton() async{

    await verifyCode();


  }

  void onTapOfConfirmPassObsecure(bool val) {
    confirmPassIsObsecure.value = !val;
  }

  void onTapOfButton() async{
    if(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*"
    r"+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailController.text)){
      UIUtils.showSnakBar(
        headerText:StringConstants.ERROR,
        bodyText: "value is email",
      );
      Get.toNamed(AppRoutes.forgotOtpScreen);
    }else if(RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').
    hasMatch(emailController.text)){
      UIUtils.showSnakBar(
        headerText:StringConstants.ERROR,
        bodyText: "value is phone",
      );
      await getOTP();
      Get.toNamed(AppRoutes.forgotOtpScreen);


    }else{
      UIUtils.showSnakBar(
        headerText:StringConstants.ERROR,
        bodyText: "Enter a valid email address or phone number",
      );
    }
  }

  getOTP() {
    log('+++ +91${emailController.text.trim()}');
    auth.verifyPhoneNumber(
        phoneNumber: '+1${emailController.text.trim()}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth
              .signInWithCredential(credential)
              .then((value) => {
          log('+++ +91  ${value}'),

              Get.toNamed(AppRoutes.forgotOtpScreen)
          });
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(' --+ ${exception.message}');
        },
        codeSent: (String verificationID, int? resendToken) {
          verificationIDRecived = verificationID;

        },
        codeAutoRetrievalTimeout: (String verificationID) {});
  }

   verifyCode() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationIDRecived, smsCode:otpController.text);

    await auth.signInWithCredential(credential).then((value) =>
    {

      Get.toNamed(AppRoutes.forgotCreatePasswordScreen)});
  }


}
