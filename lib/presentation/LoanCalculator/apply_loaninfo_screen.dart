import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:my_secure_app/presentation/LoanCalculator/Amount_radial_screen.dart';
import 'package:my_secure_app/presentation/LoanCalculator/select_loan_type_screen.dart';

import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../Custom Widgets/main_custom_background.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_style.dart';
import '../../utils/HelperFiles/math_utils.dart';
import '../HomeScreen/controller/home_screen_controller.dart';
import 'amount_dialog.dart';
import 'controller/loan_calculator_screen_controller.dart';

class ApplyLoanInfoScreen extends StatelessWidget {
  var loanCalculatorController = Get.put(LoanCalculatorScreenController());
  var homeC = Get.put(HomeScreenController());

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
                                    style: AppStyle.textStylePoppinsRegular
                                        .copyWith(
                                            color: ColorConstant.primaryWhite,
                                            fontWeight: FontWeight.w700,
                                            fontSize: getFontSize(32)),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "Thanks for making an interest in loan please proceed with the details.",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w500,
                                          fontSize: getFontSize(20)),
                                ),
                                SizedBox(
                                  height: getVerticalSize(24),
                                ),
                                AppElevatedButton(
                                    buttonName: 'Proceed',
                                    radius: 5,
                                    onPressed: () {
                                      if(homeC.showNotiFiBadge.value){
                                        homeC.showVerifyIdentityDialouge();
                                      }else{
                                        Get.toNamed(AppRoutes.loanFnameScreen);
                                        // Get.to(AmountRadialScreen());
                                      }
                                      // Get.to(SelectLoanTypeScreen());
                                      // loginController.onTapOfButton();
                                      // Get.to(
                                      //   LoaderScreen("",AppRoutes.creatPasswordScreen),
                                      //   transition: Transition.rightToLeft,
                                      //   duration: Duration(milliseconds: 400),
                                      // );
                                    }),
                                SizedBox(
                                  height: getVerticalSize(20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset('asset/animations/loan_wallet.json',
                                height: MediaQuery.of(context).size.height/2,
                              repeat: true
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ))));
  }
}
