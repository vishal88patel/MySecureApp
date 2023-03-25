import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';
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
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getHorizontalSize(20)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [

                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                        Get.back();
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
                                          Icons.arrow_back_ios_new_outlined,
                                          size: 22,),
                                      ),
                                    ),
                                    Text(
                                      "Enter Your OTP",
                                      style: AppStyle.DmSansFont.copyWith(
                                          color: ColorConstant.primaryBlack,
                                          fontWeight: FontWeight.w700,
                                          fontSize: getFontSize(20)),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              12),
                                          border: Border.all(
                                              color: Colors.transparent)),
                                      padding: EdgeInsets.all(10),
                                      child: Icon(
                                        Icons.arrow_back_ios_new_outlined,
                                        color: Colors.transparent,),
                                    ),
                                  ],
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
                                      color: ColorConstant.primaryWhite
                                  ),

                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SizedBox(
                                        height: getVerticalSize(130),
                                      ),
                                      Spacer(),
                                      Column(
                                        children: [
                                          Padding(
                                            padding:  EdgeInsets.symmetric(horizontal:getHorizontalSize(20)),
                                            child:TextFormField(
                                              readOnly: true,
                                              style: TextStyle(color: ColorConstant.primaryBlack,),
                                              decoration: InputDecoration(
                                                hintText: 'OTP',
                                                hintStyle:
                                                AppStyle.DmSansFont.copyWith(
                                                    color:
                                                    ColorConstant.grey8F,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    fontSize:
                                                    getFontSize(20)),
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
                                          ),
                                          SizedBox(
                                            height: getVerticalSize(40),
                                          ),
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
                                      )
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),


                          Positioned(right: 10,
                            top: getVerticalSize(60),
                            child: Center(
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                                  child: Image.asset(
                                    'asset/icons/name_image.jpg',
                                    height: getVerticalSize(220),),
                                )
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