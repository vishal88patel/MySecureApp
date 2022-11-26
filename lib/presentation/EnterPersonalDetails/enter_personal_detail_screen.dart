import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/presentation/EnterPersonalDetails/controller/enter_personal_detail_screen_controller.dart';
import 'package:my_secure_app/presentation/EnterPersonalDetails/nam_pad.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

class EnterPersonalDetailScreen extends StatelessWidget {
  var enterPersonalDetailController = Get.find<EnterBirthDateController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor,
        body: SingleChildScrollView(
            child: Container(
                height: size.height,
                child: Stack(
                  children: [
                    SafeArea(
                      child: Stack(
                        children: [
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: getVerticalSize(10),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        Get.back();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                            border: Border.all(color: ColorConstant.backBorder)),
                                        padding: EdgeInsets.all(10),
                                        child: Icon(Icons.arrow_back_ios_new_outlined),
                                      ),
                                    ),
                                    Text(
                                      "Enter Your BirthDate",
                                      style: AppStyle.DmSansFont.copyWith(
                                          color: ColorConstant.darkBlue,
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
                                  keyboardType: TextInputType.number,
                                  readOnly: true,
                                  style: TextStyle(color: ColorConstant.grey8F),
                                  inputFormatters: [

                                  ],

                                  decoration: InputDecoration(
                                    hintText: 'DD/MM/YYYY',
                                    hintStyle: AppStyle.DmSansFont.copyWith(
                                  color: ColorConstant.primaryAppTextF1,
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
                                Spacer(),
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
                        ],
                      ),
                    ),
                  ],
                ))));


  }

}
