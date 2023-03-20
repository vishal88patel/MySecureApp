import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../Custom Widgets/app_textField.dart';
import '../EnterPersonalDetails/nam_pad.dart';
import 'controller/kyc_screen_controller.dart';

class KycPhoneScreen extends StatelessWidget {
  var kycController = Get.find<KycScreenController>();
  final tooltipController = JustTheController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                height: size.height,
                child: Stack(
                  children: [
                    Image.asset('asset/icons/background_image.png',
                        fit: BoxFit.cover, width: double.infinity),
                    SafeArea(
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getHorizontalSize(20)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: getVerticalSize(10),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.back();
                                            Get.back();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                    color: ColorConstant
                                                        .primaryWhite
                                                        .withOpacity(0.3))),
                                            padding: EdgeInsets.all(6),
                                            child: Icon(
                                                Icons.arrow_back_ios_new_outlined,
                                                size: 22,
                                                color: ColorConstant.primaryWhite),
                                          ),
                                        ),
                                        Text(
                                          "Enter Your Phone Number",
                                          style: AppStyle.DmSansFont.copyWith(
                                              color: ColorConstant.primaryWhite,
                                              fontWeight: FontWeight.w700,
                                              fontSize: getFontSize(20)),
                                        ),
                                        InkWell(
                                          onTap: () {
                                           showDialog();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                    color: ColorConstant
                                                        .primaryWhite
                                                        .withOpacity(0.3))),
                                            padding: EdgeInsets.all(6),
                                            child: Icon(
                                              Icons.question_mark_rounded,
                                              size: 22,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: getVerticalSize(250),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            width: 22,
                                            child: TextFormField(
                                              controller: kycController
                                                  .plusOneController,
                                              readOnly: true,
                                              style: TextStyle(
                                                color:
                                                    ColorConstant.primaryWhite,
                                              ),
                                              decoration: InputDecoration(
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: ColorConstant
                                                          .primaryWhite,
                                                      width: 1),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: ColorConstant
                                                          .primaryWhite,
                                                      width: 1),
                                                ),
                                              ),
                                              cursorColor:
                                                  ColorConstant.primaryWhite,
                                            )),
                                        Expanded(
                                          child: TextFormField(
                                            readOnly: true,
                                            style: TextStyle(
                                              color: ColorConstant.primaryWhite,
                                            ),
                                            decoration: InputDecoration(
                                              hintText: 'Phone Number',
                                              hintStyle:
                                                  AppStyle.DmSansFont.copyWith(
                                                      color:
                                                          ColorConstant.grey8F,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize:
                                                          getFontSize(20)),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: ColorConstant
                                                        .primaryAppTextF1),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: ColorConstant
                                                        .primaryAppTextF1),
                                              ),
                                            ),
                                            // var date = parts.sublist(1).join(':').trim(); // date: "'2019:04:01'"
                                            controller: kycController
                                                .phoneNumberController,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getHorizontalSize(20)),
                                child: AppElevatedButton(
                                  buttonName: 'Get OTP',
                                  onPressed: () {
                                    debugPrint(
                                        'Your code: ${kycController.phoneNumberController.text}');
                                    kycController.onClickGetOtp(context);
                                  },
                                ),
                              ),
                              SizedBox(
                                height: getVerticalSize(20),
                              ),
                              Column(
                                children: [
                                  NumPad(
                                    type: 'PHONE',
                                    controller:
                                        kycController.phoneNumberController,
                                    delete: () {
                                      HapticFeedback.lightImpact();

                                      if (kycController.phoneNumberController
                                          .text.isNotEmpty) {
                                        kycController
                                                .phoneNumberController.text =
                                            kycController
                                                .phoneNumberController.text
                                                .substring(
                                                    0,
                                                    kycController
                                                            .phoneNumberController
                                                            .text
                                                            .length -
                                                        1);
                                      }
                                    },
                                    // do something with the input numbers
                                    onSubmit: () {
                                      debugPrint(
                                          'Your code: ${kycController.phoneNumberController.text}');
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

  void showDialog(){
    Get.dialog(
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: getVerticalSize(350)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: ColorConstant.primaryDarkGreen),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (Get.isDialogOpen == true) Get.back();
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child:Text(
                            textAlign: TextAlign.center,
                            "Change Phone Number?",
                            style: AppStyle.DmSansFont.copyWith(
                                color: ColorConstant.primaryWhite,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w400,
                                fontSize: getFontSize(20)),
                          ),

                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: AppElevatedButton(
                      buttonName: 'Ok',
                      radius: 5,
                      textColor: Colors.white,
                      onPressed: () {
                        Get.back();
                        Get.toNamed(AppRoutes
                            .privacyDetailsScreen);
                      },
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}


