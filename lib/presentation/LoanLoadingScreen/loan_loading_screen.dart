import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_textField.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';
import '../../App Configurations/color_constants.dart';
import '../LinkCardEditCardScreen/controller/link_card_edit_card_screen_controller.dart';
import '../LoanCalculator/select_loan_type_screen.dart';
import '../loader_screen.dart';
import 'controller/loan_loading_screen_controller.dart';

class LoanLoadingScreen extends StatelessWidget {
  var loanLoaderController = Get.find<LoanLoadingController>();

  // var cardController = Get.find<TopAddCard1Controller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                height: size.height,
                color: ColorConstant.blue26,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getHorizontalSize(36),
                          vertical: getVerticalSize(36)),
                      child: SafeArea(
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: getVerticalSize(52),
                                ),
                                Center(child: Image.asset("asset/icons/app_icon.png",height: getVerticalSize(80),)),
                                SizedBox(
                                  height: getVerticalSize(40),
                                ),
                                Text(
                                  "Please Wait...",
                                  style: AppStyle.textStyleDMSANS.copyWith(
                                      color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w700,
                                      fontSize: getFontSize(32)),
                                ),
                                SizedBox(
                                  height: getVerticalSize(40),
                                ),
                                Obx(
                                  () => Row(
                                    children: [
                                      loanLoaderController.progress1.value
                                          ? Lottie.asset(
                                              'asset/animations/green_tick.json',
                                              height: 30.0,
                                              repeat: false)
                                          : Lottie.asset(
                                              'asset/animations/green_loader.json',
                                              height: 30.0,
                                              repeat: true),
                                      SizedBox(
                                        width: getVerticalSize(6),
                                      ),
                                       Text(
                                          "Fetching your Credit Score and \nLoan limit",
                                          style: AppStyle.textStyleDMSANS
                                              .copyWith(
                                                  color: ColorConstant
                                                      .primaryWhite,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: getFontSize(20)),

                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: getVerticalSize(20),
                                ),
                                Obx(
                                  () => Row(
                                    children: [
                                      loanLoaderController.progress2.value
                                          ? Lottie.asset(
                                              'asset/animations/green_tick.json',
                                              height: 30.0,
                                              repeat: false)
                                          : Lottie.asset(
                                              'asset/animations/green_loader.json',
                                              height: 30.0,
                                              repeat: true),
                                      SizedBox(
                                        width: getVerticalSize(6),
                                      ),
                                      Text(
                                        "Approving your loan application",
                                        style: AppStyle.textStyleDMSANS
                                            .copyWith(
                                                color:
                                                    ColorConstant.primaryWhite,
                                                fontWeight: FontWeight.w500,
                                                fontSize: getFontSize(20)),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: getVerticalSize(20),
                                ),
                                Obx(
                                  () => Row(
                                    children: [
                                      loanLoaderController.progress3.value
                                          ? Lottie.asset(
                                              'asset/animations/green_tick.json',
                                              height: 30.0,
                                              repeat: false)
                                          : Lottie.asset(
                                              'asset/animations/green_loader.json',
                                              height: 30.0,
                                              repeat: true),
                                      SizedBox(
                                        width: getVerticalSize(6),
                                      ),
                                      Text(
                                        "Checking your documents and \npersonal details",
                                        style: AppStyle.textStyleDMSANS
                                            .copyWith(
                                                color:
                                                    ColorConstant.primaryWhite,
                                                fontWeight: FontWeight.w500,
                                                fontSize: getFontSize(20)),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: getVerticalSize(20),
                                ),
                                Obx(
                                  () => Row(
                                    children: [
                                      loanLoaderController.progress4.value
                                          ? Lottie.asset(
                                              'asset/animations/green_tick.json',
                                              height: 30.0,
                                              repeat: false)
                                          : Lottie.asset(
                                              'asset/animations/green_loader.json',
                                              height: 30.0,
                                              repeat: true),
                                      SizedBox(
                                        width: getVerticalSize(6),
                                      ),
                                      Obx(
                                            () => Text(
                                          "Based on your Profile and \nDocuments, You are eligible for loan \nupto "
                                              "\$${loanLoaderController.maximumAvailableLoan.value}. Thank You",
                                          style: AppStyle.textStyleDMSANS
                                              .copyWith(
                                                  color:
                                                      ColorConstant.primaryWhite,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: getFontSize(20)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: getVerticalSize(20),
                                ),
                                Spacer(),
                                Obx(()=>
                                   loanLoaderController.progress4.value
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 18.0),
                                          child: AppElevatedButton(
                                            buttonName: 'Done',
                                            radius: 5,
                                            onPressed: () {
                                              Get.back();
                                              Get.to(
                                                  () => SelectLoanTypeScreen());
                                            },
                                          ),
                                        )
                                      : Container(),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ))));
  }
}
