import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/App%20Configurations/color_constants.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secure_cash_app/presentation/EnterPersonalDetails/controller/enter_personal_detail_screen_controller.dart';
import 'package:secure_cash_app/presentation/EnterPersonalDetails/nam_pad.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

class EnterPersonalDetailScreen extends StatelessWidget {
  var enterPersonalDetailController = Get.find<EnterBirthDateController>();

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
                                              border: Border.all(
                                                  color:
                                                  ColorConstant.backBorder)),
                                          padding: EdgeInsets.all(6),
                                          child: Icon(
                                            Icons.arrow_back_ios_new_outlined,size: 22,),
                                        ),
                                      ),
                                      Text(
                                        "Enter Your BirthDate",
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
                                          color:  ColorConstant.primaryWhite
                                      ),

                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          SizedBox(
                                            height: getVerticalSize(90),
                                          ),

                                          Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                            child: TextFormField(
                                              keyboardType: TextInputType.number,
                                              readOnly: true,
                                              style: TextStyle(color: ColorConstant.grey8F),
                                              inputFormatters: [

                                              ],

                                              decoration: InputDecoration(
                                                hintText: 'MM/DD/YYYY',
                                                hintStyle: AppStyle.DmSansFont.copyWith(
                                                    color: ColorConstant.grey8F,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: getFontSize(16)),

                                                enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: ColorConstant.grey8F.withOpacity(0.5),width: 1),
                                                ),
                                                focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: ColorConstant.grey8F.withOpacity(0.5),width: 1),
                                                ),
                                              ),
                                              // var date = parts.sublist(1).join(':').trim(); // date: "'2019:04:01'"

                                              controller:
                                              enterPersonalDetailController.dobController,
                                            ),
                                          ),
                                          SizedBox(
                                            height: getVerticalSize(60),
                                          ),

                                          Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                            child: AppElevatedButton(
                                              buttonName: 'Next',

                                              onPressed: () {
                                                debugPrint('Your code: ${enterPersonalDetailController.dobController.text}');
                                                enterPersonalDetailController.onTapOfNextButton();

                                              },
                                            ),
                                          ),
                                          SizedBox(height: getVerticalSize(20),),
                                          Column(
                                            children: [
                                              NumPad(
                                                type: 'BIRTHDATE',
                                                controller: enterPersonalDetailController.dobController,
                                                delete: () {
                                                  HapticFeedback.lightImpact();

                                                  if( enterPersonalDetailController.dobController.text.isNotEmpty){
                                                    enterPersonalDetailController.dobController.text = enterPersonalDetailController.dobController.text
                                                        .substring(0, enterPersonalDetailController.dobController.text.length - 1);

                                                  }
                                                },
                                                // do something with the input numbers
                                                onSubmit: () {
                                                  debugPrint('Your code: ${enterPersonalDetailController.dobController.text}');
                                                  enterPersonalDetailController.onTapOfNextButton();
                                                },
                                              ),
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
