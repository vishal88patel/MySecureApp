import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';

import 'package:secureapp/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secureapp/Custom%20Widgets/app_textField.dart';
import 'package:secureapp/routes/app_routes.dart';
import 'package:secureapp/theme/app_style.dart';
import 'package:secureapp/utils/HelperFiles/math_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../EnterPersonalDetails/nam_pad.dart';
import '../LoginScreen/controller/login_screen_controller.dart';
import '../loader_screen.dart';
import 'controller/loan_calculator_screen_controller.dart';

class LoanDobScreen extends StatelessWidget {
  // var loanCalculatorController = Get.put(LoanCalculatorScreenController());
  var loanCalculatorController = Get.find<LoanCalculatorScreenController>();

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
                                          onTap: (){
                                            Get.back();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                                border: Border.all(color: ColorConstant.primaryWhite.withOpacity(0.3))),
                                            padding: EdgeInsets.all(6),
                                            child: Icon(Icons.arrow_back_ios_new_outlined,color: ColorConstant.primaryWhite,size: 22,),
                                          ),
                                        ),
                                        Text(
                                          "Give us your Date of Birth",
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
                                    SizedBox(
                                        child: Obx(()
                                        => AppTextField(
                                          controller: loanCalculatorController.dobController,
                                          keyBordType: TextInputType.text,
                                          hintText: 'DD/MM/YYYY',
                                          readOnly:loanCalculatorController.isedit.value? true:false,
                                          suffixIcon: IconButton(
                                            icon: Icon(Icons.edit,
                                                color:ColorConstant.grey8F,
                                                size: getVerticalSize(20)),
                                            onPressed: (){
                                              loanCalculatorController.editText();
                                            },
                                          ),
                                        ),
                                        )),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                child: AppElevatedButton(
                                  buttonName: 'Next',

                                  onPressed: () {
                                    loanCalculatorController.onClickOfDob();
                                   /* debugPrint('Your code: ${enterPersonalDetailController.dobController.text}');
                                    enterPersonalDetailController.onTapOfNextButton();*/

                                  },
                                ),
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  NumPad(
                                    type: 'BIRTHDATE',
                                    controller: loanCalculatorController.dobController,
                                    delete: () {
                                      HapticFeedback.lightImpact();
                                      if(loanCalculatorController.isedit.value){
                                        if( loanCalculatorController.dobController.text.isNotEmpty){
                                          loanCalculatorController.dobController.text = loanCalculatorController.dobController.text
                                              .substring(0, loanCalculatorController.dobController.text.length - 1);

                                        }
                                      }

                                    },
                                    // do something with the input numbers
                                    onSubmit: () {
                                      if(loanCalculatorController.isedit.value){
                                        debugPrint('Your code: ${loanCalculatorController.dobController.text}');
                                        loanCalculatorController.onClickOfDob();
                                      }

                                    },
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ))));






  }
}
