import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/presentation/EnterPersonalDetails/nam_pad.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../Custom Widgets/app_textField.dart';
import 'controller/forgot_password_screen_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  var forgotPasswordScreenController = Get.find<ForgotPasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor,
        body: SingleChildScrollView(
          child: Container(
              height: size.height,
              color: ColorConstant.buttonGreen.withOpacity(0.3),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: getVerticalSize(20)),
                    child: SafeArea(
                      child: Stack(
                        children: [
                          Column( crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            border: Border.all(
                                                color:
                                                ColorConstant.backBorder)),
                                        padding: EdgeInsets.all(6),
                                        child: Icon(
                                          Icons.arrow_back_ios_new_outlined,size: 22,),
                                      ),
                                    ),
                                    Text(
                                      "Forgot Password",
                                      style: AppStyle.DmSansFont.copyWith(
                                          color: ColorConstant.primaryBlack,
                                          fontWeight: FontWeight.w700,
                                          fontSize: getFontSize(20)),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                          border: Border.all(color: Colors.transparent)),
                                      padding: EdgeInsets.all(10),
                                      child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.transparent,),
                                    ),                      ],
                                ),
                              ),
                              SizedBox(
                                height: getVerticalSize(120),
                              ),


                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                      ),
                                      color:  ColorConstant.backgroundColor
                                  ),

                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        SizedBox(
                                          height: getVerticalSize(100),
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Obx(()=> Text(
                                                  forgotPasswordScreenController.isEmailPhone.value?
                                                  "Enter your email ":
                                                      "Enter your phone number",
                                                  style: AppStyle.DmSansFont.copyWith(
                                                      color: ColorConstant.grey8F,
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: getFontSize(20)),
                                                ),
                                              ),
                                              SizedBox(
                                                height: getVerticalSize(20),
                                              ),
                                              Obx(
                                                    ()=> SizedBox(
                                                    child: AppTextField(
                                                      readOnly:  forgotPasswordScreenController.isEmailPhone.value
                                                          ?false:true,
                                                      controller: forgotPasswordScreenController.isEmailPhone.value
                                                          ?forgotPasswordScreenController.emailController
                                                          :forgotPasswordScreenController.phoneNumberController,
                                                      keyBordType: TextInputType.emailAddress,
                                                      hintText:forgotPasswordScreenController.isEmailPhone.value
                                                          ?"Email"
                                                          : "Phone Number ",
                                                    )),
                                              ),

                                              Row(mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Obx(
                                                  ()=> TextButton(
                                                        onPressed: (){
                                                          forgotPasswordScreenController.emailPhoneChange();
                                                        },
                                                        child:  Text(
                                                          forgotPasswordScreenController.isEmailPhone.value?
                                                          "Using phone number" : "Using email ",
                                                          style: AppStyle.DmSansFont.copyWith(
                                                              color: ColorConstant.primaryDarkGreen,
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: getFontSize(20)),
                                                        ),),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: getVerticalSize(20),
                                              ),

                                              AppElevatedButton(
                                                  buttonName: 'Get OTP',
                                                  textColor: ColorConstant.primaryWhite,
                                                  onPressed: () {
                                                    if(forgotPasswordScreenController.isEmailPhone.value){
                                                      forgotPasswordScreenController.onTapOfButton();
                                                    }else{
                                                      forgotPasswordScreenController.onClickGetOtp(context);
                                                    }

                                                  }),
                                              SizedBox(
                                                height: getVerticalSize(30),
                                              ),

                                            ],
                                          ),
                                        ),
                                        Obx(()=> Column(
                                            children: [
                                              if(!forgotPasswordScreenController.isEmailPhone.value)
                                                NumPad(
                                                type: 'PHONE',
                                                controller: forgotPasswordScreenController.phoneNumberController,
                                                delete: () {
                                                  HapticFeedback.lightImpact();

                                                  if( forgotPasswordScreenController.phoneNumberController.text.isNotEmpty){
                                                    forgotPasswordScreenController.phoneNumberController.text = forgotPasswordScreenController.phoneNumberController.text
                                                        .substring(0, forgotPasswordScreenController.phoneNumberController.text.length - 1);

                                                  }
                                                },
                                                // do something with the input numbers
                                                onSubmit: () {
                                                  debugPrint('Your code: ${forgotPasswordScreenController.phoneNumberController.text}');
                                                },
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),


                          Positioned(right: 10,
                            top: getVerticalSize(60),
                            child: Center(
                                child: Image.asset('asset/icons/birthDate_image.png',
                                  height: getVerticalSize(220),)
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ));


  }
}
