import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/App%20Configurations/color_constants.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_textField.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import 'controller/enter_password_screen_controller.dart';

class EnterPasswordScreen extends StatelessWidget {
  var enterPasswordController = Get.find<EnterPasswordScreenController>();

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
                                      "Enter your Password",
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
                                      color:  ColorConstant.primaryWhite
                                  ),

                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        SizedBox(
                                          height: getVerticalSize(90),
                                        ),

                                        Text(
                                          "Please enter your password.",
                                          style: AppStyle.DmSansFont.copyWith(
                                              color: ColorConstant.grey8F,
                                              fontWeight: FontWeight.w400,
                                              fontSize: getFontSize(18)),
                                        ),
                                        SizedBox(
                                          height: getVerticalSize(54),
                                        ),

                                        Obx(
                                              () => AppTextField(
                                            hintText: 'Enter Password ',
                                            controller: enterPasswordController.passController,
                                            isObsecure: enterPasswordController.PaasIsObsecure.value,
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(15),
                                            ],
                                            suffixIcon: IconButton(
                                              icon: Icon( enterPasswordController.PaasIsObsecure.value
                                                  ? Icons.visibility_off
                                                  : Icons.visibility
                                                // Icons.visibility_off,
                                              ),
                                              color: ColorConstant.primaryAppTextF1,
                                              iconSize: getSize(20),
                                              onPressed: () {
                                                print("oooooooooo");
                                                enterPasswordController.onTapOfPassObsecure(
                                                    enterPasswordController
                                                        .PaasIsObsecure.value);
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: getVerticalSize(54),
                                        ),

                                        AppElevatedButton(
                                            buttonName: 'Next',
                                            textColor: ColorConstant.primaryWhite,
                                            onPressed: () {
                                              enterPasswordController.onTapOfNextButton();
                                              // Get.to(
                                              //   LoaderScreen("",AppRoutes.creatPasswordScreen),
                                              //   transition: Transition.rightToLeft,
                                              //   duration: Duration(milliseconds: 400),
                                              // );
                                            }),
                                        SizedBox(
                                          height: getVerticalSize(54),
                                        ),
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
