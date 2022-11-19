import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../loader_screen.dart';
import 'controller/uplod_document_screen_controller.dart';
import 'num_pad_phone_number.dart';

class KycOtpScreen extends StatelessWidget {
  var documentController = Get.find<UploadDocumentScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.primaryBlack,
        body: SingleChildScrollView(
            child: Container(
                height: size.height,
                child: Stack(
                  children: [
                    MainCutomBackGround(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getHorizontalSize(36.0),
                              vertical: getVerticalSize(26)),
                          child: SafeArea(
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(Icons.close,color: ColorConstant.primaryWhite,)
                                      ],
                                    ),

                                    SizedBox(
                                      height: getVerticalSize(40),
                                    ),
                                    Text(
                                      "Please Enter the code\n"
                                          "Sent to",
                                      style: AppStyle.textStylePoppinsRegular.copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w700,
                                          fontSize: getFontSize(32)),
                                    ),


                                    SizedBox(
                                      height: getVerticalSize(54),
                                    ),
                                    SizedBox(
                                        child: AppTextField(
                                          controller: documentController.otpController,
                                          hintText: "Confirmation Code",
                                          fontSize: 30,
                                          readOnly: true,

                                        )),
                                    Spacer(),
                                    Column(
                                      children: [
                                        NumPadPhoneNumber(
                                          type:'OTP' ,
                                          controller: documentController.otpController,
                                          delete: () {
                                            if( documentController.otpController.text.isNotEmpty){
                                              documentController.otpController.text = documentController.otpController.text
                                                  .substring(0, documentController.otpController.text.length - 1);

                                            }
                                          },
                                          // do something with the input numbers
                                          onSubmit: () {
                                            documentController.onClickVerifyOtp();
                                          },
                                        ),
                                      ],
                                    )
                                    // Spacer(),
                                    // AppElevatedButton(
                                    //     buttonName: 'Continue',
                                    //     radius: 5,
                                    //     onPressed: () {
                                    //       Get.toNamed(AppRoutes.uploadDocument1);
                                    //
                                    //       // loginController.onTapOfButton();
                                    //       // Get.to(
                                    //       //   LoaderScreen("",AppRoutes.creatPasswordScreen),
                                    //       //   transition: Transition.rightToLeft,
                                    //       //   duration: Duration(milliseconds: 400),
                                    //       // );
                                    //     }),


                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ))));
  }
}
