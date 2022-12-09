import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secure_cash_app/presentation/topAddCard1/controller/top_add_card1_screen_controller.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_textField.dart';
import 'package:secure_cash_app/presentation/topEditCardConfirm/controller/top_edit_card_confirm_screen_controller.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';
import '../../App Configurations/color_constants.dart';
import '../loader_screen.dart';
import 'controller/card_loader_screen_controller.dart';

class CardLoadingScreen extends StatelessWidget {
  var cardLoaderController = Get.find<CardLoaderController>();
  var cardController = Get.put(TopEditCardConfirmController());

  // var cardController = Get.find<TopAddCard1Controller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor,
        body: SingleChildScrollView(
            child: Container(
                height: size.height,
                child: Stack(
                  children: [
                    Image.asset('asset/icons/background_image.png',
                        fit: BoxFit.cover,width: double.infinity),
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
                                Center(
                                  child: SvgPicture.asset(
                                    "asset/icons/splash_image.svg",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: getVerticalSize(30),
                                ),
                                Text(
                                  "Please Wait...",
                                  style: AppStyle.textStyleDMSANS
                                      .copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w700,
                                          fontSize: getFontSize(32)),
                                ),
                                SizedBox(
                                  height: getVerticalSize(40),
                                ),
                                Obx
                                  (()=>
                                   Row(
                                    children: [
                                      cardController.progress1.value?Lottie.asset(
                                          'asset/animations/green_tick.json',
                                          height: 30.0,
                                          repeat: false):Lottie.asset(
                                          'asset/animations/green_loader.json',
                                          height: 30.0,
                                          repeat: true),
                                      SizedBox(
                                        width: getVerticalSize(6),
                                      ),
                                      Text(
                                        "Uploading Your Photos",
                                        style: AppStyle.textStyleDMSANS
                                            .copyWith(
                                                color: ColorConstant.primaryWhite,
                                                fontWeight: FontWeight.w500,
                                                fontSize: getFontSize(20)),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: getVerticalSize(20),
                                ),
                                Obx(()=>
                                 Row(
                                    children: [
                                      cardController.progress2.value?Lottie.asset(
                                          'asset/animations/green_tick.json',
                                          height: 30.0,
                                          repeat: false):Lottie.asset(
                                          'asset/animations/green_loader.json',
                                          height: 30.0,
                                          repeat: true),
                                      SizedBox(
                                        width: getVerticalSize(6),
                                      ),
                                      Text(
                                        "Checking for errors",
                                        style: AppStyle.textStyleDMSANS
                                            .copyWith(
                                                color: ColorConstant.primaryWhite,
                                                fontWeight: FontWeight.w500,
                                                fontSize: getFontSize(20)),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: getVerticalSize(20),
                                ),
                                Obx(()=> Row(
                                    children: [
                                      cardController.progress3.value?Lottie.asset(
                                          'asset/animations/green_tick.json',
                                          height: 30.0,
                                          repeat: false):Lottie.asset(
                                          'asset/animations/green_loader.json',
                                          height: 30.0,
                                          repeat: true),
                                      SizedBox(
                                        width: getVerticalSize(6),
                                      ),
                                      Text(
                                        "Sending your data for verification",
                                        style: AppStyle.textStyleDMSANS
                                            .copyWith(
                                                color: ColorConstant.primaryWhite,
                                                fontWeight: FontWeight.w500,
                                                fontSize: getFontSize(20)),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: getVerticalSize(20),
                                ),
                                Obx(()=>Row(
                                    children: [
                                      cardController.progress4.value?Lottie.asset(
                                          'asset/animations/green_tick.json',
                                          height: 30.0,
                                          repeat: false):Lottie.asset(
                                          'asset/animations/green_loader.json',
                                          height: 30.0,
                                          repeat: true),
                                      SizedBox(
                                        width: getVerticalSize(6),
                                      ),
                                      Text(
                                        "Verifying you",
                                        style: AppStyle.textStyleDMSANS
                                            .copyWith(
                                                color: ColorConstant.primaryWhite,
                                                fontWeight: FontWeight.w500,
                                                fontSize: getFontSize(20)),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: getVerticalSize(20),
                                ),
                                Spacer(),
                                Obx(()=>
                                cardController.progress4.value?Text(
                                    "Thank you.Your card data has been successfully submitted.You'll get the results shortly",
                                    style: AppStyle.textStyleDMSANS
                                        .copyWith(
                                            color: ColorConstant.primaryWhite,
                                            fontWeight: FontWeight.w500,
                                            fontSize: getFontSize(18)),
                                  ):Container(),
                                ),
                                SizedBox(
                                  height: getVerticalSize(20),
                                ),
                                Obx(()=>
                                 cardController.progress4.value?
                                AppElevatedButton(
                                      buttonName: 'Continue',
                                      radius: 5,
                                      onPressed: () {
                                        Get.offAllNamed(AppRoutes.dashBoardScreen,arguments: {"bottomTabCount":0});
                                      }) : Container(),
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
