import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textFormField_fill.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/presentation/BankDetailScreen/controller/bank_detail_screen_controller.dart';
import 'package:my_secure_app/presentation/CardDetailScreen/controller/card_detail_screen_controller.dart';
import 'package:my_secure_app/presentation/PersonalDetails/controller/personal_detail_screen_controller.dart';
import 'package:my_secure_app/presentation/UploadDocumentScreen/controller/uplod_document_screen_controller.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../PinScreen/controller/pin_screen_controller.dart';

class OtpVerifySuccessfully extends StatelessWidget {
  var documentController = Get.put(UploadDocumentScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            MainCutomBackGround(
                child: Padding(padding: EdgeInsets.symmetric(
                    horizontal: getHorizontalSize(25.0),vertical:getVerticalSize( 26)),
                  child: SafeArea(
                    child: Stack(
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                    onTap:(){
                                      Get.back();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10,bottom: 10),
                                      child: Icon(Icons.close,color: ColorConstant.primaryWhite,),
                                    ))                                      ],
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(30)),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(24)),border: Border.all(color: ColorConstant.skyE8)
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20),vertical: getVerticalSize(40)),
                                  child: Column(
                                    children: [
                                      Lottie.asset('asset/animations/98621-success-status.json',
                                          height: getVerticalSize(200)),
                                      SizedBox(height: getVerticalSize(20),),
                                      Text('OTP verified successfully now your proceed for documentation and KYC',
                                        style: AppStyle.textStylePoppinsRegular
                                            .copyWith(color: ColorConstant.primaryWhite,
                                            fontWeight: FontWeight.w400,fontSize: getFontSize(22)),textAlign: TextAlign.center,),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            
                            Spacer(),

                            AppElevatedButton(
                                buttonName: 'Continue',
                                radius: 5,
                                onPressed: () {
                                  Get.offAllNamed(AppRoutes.kycInfoScreen);
                                }),
                            SizedBox(height: getVerticalSize(32),),
                            /*Padding(
                              padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(35)),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('014 251 339'.toString(),
                                                style: AppStyle.textStylePoppinsRegular
                                                    .copyWith(color: ColorConstant.primaryWhite,
                                                    fontWeight: FontWeight.w500,fontSize: getFontSize(22))),

                                            Text('Routing number',
                                                style: AppStyle.textStylePoppinsRegular
                                                    .copyWith(color: ColorConstant.primaryAppTextF1,
                                                    fontWeight: FontWeight.w400,fontSize: getFontSize(14))),
                                            SizedBox(height: getVerticalSize(40.5),),

                                            SizedBox(
                                              height: getVerticalSize(45),
                                              child: AppElevatedButton(buttonName: 'Add Cash',
                                                  textColor: ColorConstant.grey77,
                                                fontWeight: FontWeight.w400,

                                                onPressed: () {
                                                Get.toNamed(AppRoutes.accountDetailListScreen);
                                              },),
                                            ),

                                            ],
                                        ),
                                      ),
                                      SizedBox(width: getHorizontalSize(70),),
                                      Expanded(
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('88 **** ****'.toString(),
                                                style: AppStyle.textStylePoppinsRegular
                                                    .copyWith(color: ColorConstant.primaryWhite,
                                                    fontWeight: FontWeight.w500,fontSize: getFontSize(22))),

                                            Text('Account number',
                                                style: AppStyle.textStylePoppinsRegular
                                                    .copyWith(color: ColorConstant.primaryAppTextF1,
                                                    fontWeight: FontWeight.w400,fontSize: getFontSize(14))),
                                            SizedBox(height: getVerticalSize(40.5),),

                                            SizedBox(
                                              height: getVerticalSize(45),
                                              child: AppElevatedButton(buttonName: 'Cash Out ',
                                               textColor: ColorConstant.grey77,
                                                fontWeight: FontWeight.w400,
                                                onPressed: () {
                                                Get.toNamed(AppRoutes.accountDetailListScreen);
                                              },),
                                            ),

                                             ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),*/


                          ],
                        ),
                      ],
                    ),
                  ),
                ) ),
          ],
        ));
  }
}
// kycInfoScreen