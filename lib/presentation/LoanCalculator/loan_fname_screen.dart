import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_secure_app/Custom%20Widgets/app_AppBar%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../LoginScreen/controller/login_screen_controller.dart';
import '../loader_screen.dart';
import 'controller/loan_calculator_screen_controller.dart';

class LoanFnameScreen extends StatelessWidget {
  // var loanCalculatorController = Get.put(LoanCalculatorScreenController());
  var loanCalculatorController = Get.find<LoanCalculatorScreenController>();


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
                                      "Give us your First Name",
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
                                  height: getVerticalSize(5),
                                ),
                                Text(
                                  "To apply, we need your first name linked to your app",
                                  style: AppStyle.DmSansFont.copyWith(
                                      color: ColorConstant.grey8F,
                                      fontWeight: FontWeight.w400,
                                      fontSize: getFontSize(18)),
                                ),
                                SizedBox(
                                  height: getVerticalSize(54),
                                ),
                                SizedBox(
                                    child: Obx(()
                                      => AppTextField(
                                        controller: loanCalculatorController.firstNameController,
                                        keyBordType: TextInputType.text,
                                        hintText: "First Name",
                                        readOnly:loanCalculatorController.isedit.value? false:true,
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
                                SizedBox(
                                  height: getVerticalSize(54),
                                ),
                                AppElevatedButton(
                                    buttonName: 'Next',
                                    radius: 5,
                                    onPressed: () {
                                      loanCalculatorController.onClickOfFname();
                                    }),

                                SizedBox(
                                  height: getVerticalSize(36),
                                ),
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
