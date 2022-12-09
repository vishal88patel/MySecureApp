import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:secureapp/routes/app_routes.dart';
import 'package:secureapp/theme/app_style.dart';
import 'package:secureapp/utils/HelperFiles/math_utils.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../Custom Widgets/app_textField.dart';
import '../EnterPersonalDetails/nam_pad.dart';
import 'controller/kyc_screen_controller.dart';

class KycOtpScreen extends StatelessWidget {
  var kycController = Get.find<KycScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                height: size.height,
                child: Stack(
                  children: [
                    Image.asset('asset/icons/background_image.png',
                        fit: BoxFit.cover,width: double.infinity),
                    SafeArea(
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: getVerticalSize(10),
                                    ),
                                    Row(
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
                                                border: Border.all(color: ColorConstant.primaryWhite.withOpacity(0.3))),
                                            padding: EdgeInsets.all(6),
                                            child: Icon(
                                                Icons.arrow_back_ios_new_outlined,size: 22,color: ColorConstant.primaryWhite),
                                          ),
                                        ),
                                        Text(
                                          "Enter Your OTP",
                                          style: AppStyle.DmSansFont.copyWith(
                                              color: ColorConstant.primaryWhite,
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
                                    SizedBox(
                                      height: getVerticalSize(57),
                                    ),
                                    Center(
                                      child: SvgPicture.asset(
                                        "asset/icons/splash_image.svg",

                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(
                                      height: getVerticalSize(40),
                                    ),
                                    SizedBox(
                                      height: getVerticalSize(43),
                                    ),
                                    TextFormField(
                                      readOnly: true,
                                      style: TextStyle(color: ColorConstant.primaryWhite,),
                                      decoration: InputDecoration(
                                        hintText: 'OTP',
                                        hintStyle: AppStyle.DmSansFont.copyWith(
                                            color: ColorConstant.primaryWhite,
                                            fontWeight: FontWeight.w400,
                                            fontSize: getFontSize(16)),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: ColorConstant.primaryAppTextF1),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: ColorConstant.primaryAppTextF1),
                                        ),
                                      ),
                                      // var date = parts.sublist(1).join(':').trim(); // date: "'2019:04:01'"

                                      controller:
                                      kycController.otpController,
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                child: AppElevatedButton(
                                  buttonName: 'Verify OTP',
                                  onPressed: () {
                                    debugPrint('Your code: ${kycController.otpController.text}');
                                    kycController.onClickVerifyOtp(context);
                                  },
                                ),
                              ),
                              SizedBox(height: getVerticalSize(20),),
                              Column(
                                children: [
                                  NumPad(
                                    type: 'OTP',
                                    controller: kycController.otpController,
                                    delete: () {
                                      HapticFeedback.lightImpact();

                                      if( kycController.otpController.text.isNotEmpty){
                                        kycController.otpController.text = kycController.otpController.text
                                            .substring(0, kycController.otpController.text.length - 1);

                                      }
                                    },
                                    // do something with the input numbers
                                    onSubmit: () {
                                      debugPrint('Your code: ${kycController.otpController.text}');
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ))));



  }
}