import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../routes/app_routes.dart';
import '../../theme/app_style.dart';
import '../../utils/ConstantsFiles/string_constants.dart';
import '../../utils/HelperFiles/math_utils.dart';
import '../../utils/HelperFiles/pref_utils.dart';
import '../HomeScreen/controller/home_screen_controller.dart';
import 'amount_dialog.dart';
import 'controller/loan_calculator_screen_controller.dart';

class ApplyLoanInfoScreen extends StatelessWidget {
  var loanCalculatorController = Get.put(LoanCalculatorScreenController());
  var homeC = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.primaryWhite,
        body: Obx(
            ()=> loanCalculatorController.isKycDone.value?SingleChildScrollView(
              child: Container(
                  height: size.height,
                  child: Stack(
                    children: [
                     Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getHorizontalSize(26.0),
                            ),
                        child: SafeArea(
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                              border: Border.all(
                                                  color:
                                                  ColorConstant.backBorder)),
                                          padding: EdgeInsets.all(6),
                                          child: Icon(
                                            Icons.arrow_back_ios_new_outlined,size: 22,),
                                        ),
                                      ),
                                      Text(
                                        "",
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
                                    height: getVerticalSize(10),
                                  ),
                                  Center(
                                    child: Text(
                                      "Online Digital Loan",
                                      style: AppStyle.DmSansFont
                                          .copyWith(
                                          color: ColorConstant.darkBlue,
                                              fontWeight: FontWeight.w700,
                                              fontSize: getFontSize(22)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: getVerticalSize(100),
                                  ),
                                  Image.asset('asset/icons/error_image.png'),
                                  Text(
                                    "Please Complete your Identity Verification Level - 1 to proceed with your loan application.",
                                    style: AppStyle.DmSansFont
                                        .copyWith(
                                        color: ColorConstant.darkBlue,
                                            fontWeight: FontWeight.w500,
                                            fontSize: getFontSize(20)),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: getVerticalSize(50),
                                  ),
                                  AppElevatedButton(
                                      buttonName: 'Proceed to Identity Verification',
                                      radius: 10,
                                      onPressed: () {
                                          Get.toNamed(AppRoutes.loanFnameScreen);
                                          // Get.to(AmountRadialScreen());


                                      }),
                                  SizedBox(
                                    height: getVerticalSize(20),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ))):
            SingleChildScrollView(
              child: Container(
                  height: size.height,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getHorizontalSize(26.0),
                            vertical: getVerticalSize(26)),
                        child: SafeArea(
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: getVerticalSize(30),
                                  ),
                                  Center(
                                    child: Text(
                                      "Online Digital Loan",
                                      style: AppStyle.DmSansFont
                                          .copyWith(
                                          color: ColorConstant.darkBlue,
                                          fontWeight: FontWeight.w700,
                                          fontSize: getFontSize(32)),
                                    ),
                                  ),
                                  Spacer(),
                                  PrefUtils.getString(StringConstants.IS_KYC_DONE) == "1"? Text(
                                    "Your Kyc is Pending !!! Please Wait Until Approvel",
                                    style: AppStyle.DmSansFont
                                        .copyWith(
                                        color: ColorConstant.darkBlue,
                                        fontWeight: FontWeight.w500,
                                        fontSize: getFontSize(20)),
                                  ):Text(
                                    "Please Complete your kyc to preoceed with your loan application",
                                    style: AppStyle.DmSansFont
                                        .copyWith(
                                        color: ColorConstant.darkBlue,
                                        fontWeight: FontWeight.w500,
                                        fontSize: getFontSize(20)),
                                  ),
                                  SizedBox(
                                    height: getVerticalSize(50),
                                  ),
                                  PrefUtils.getString(StringConstants.IS_KYC_DONE) == "1"?Container():AppElevatedButton(
                                      buttonName: 'Proceed to Kyc',
                                      radius: 5,
                                      onPressed: () {
                                        Get.toNamed(AppRoutes.kycEmailScreen);

                                      }),
                                  SizedBox(
                                    height: getVerticalSize(20),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ))),
        ));
  }
}
