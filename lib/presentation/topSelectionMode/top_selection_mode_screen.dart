import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_AppBar%20.dart';
import 'package:secure_cash_app/presentation/widget/select_mode_widget.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';

import '../../App Configurations/color_constants.dart';
import '../../utils/HelperFiles/math_utils.dart';
import 'controller/top_selection_mode_screen_controller.dart';

class TopSelectionModeScreen extends StatelessWidget {
  var topSelectionModeScreenController = Get.find<TopSelectionModeController>();

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
                                      "Select top up methods",
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
                                height: getVerticalSize(140),
                              ),


                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                      ),
                                      color:  ColorConstant.primaryWhite
                                  ),

                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SizedBox(
                                        height: getVerticalSize(110),
                                      ),

                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                        child: Text(
                                          "Choose payment methods",
                                          style: AppStyle.textStyleDMSANS.copyWith(
                                              color: ColorConstant.primaryBlack,
                                              fontWeight:FontWeight.w700,
                                              fontSize:getFontSize(20)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: getVerticalSize(40),
                                      ),
                                      SelectModeWidget(
                                        onTap: (){

                                          Get.toNamed(AppRoutes.topupCardListScreen);                                    },
                                        title: 'My Card',
                                        icon: 'asset/icons/ic_green_card.png',
                                      ),
                                      SizedBox(height: getVerticalSize(20),),
                                      SelectModeWidget(
                                        onTap: (){
                                          Get.toNamed(AppRoutes.topupBankListScreen);

                                        },
                                        title: 'My Bank',
                                        icon: 'asset/icons/ic_bank_orange.png',
                                      ),

                                      SizedBox(height: getVerticalSize(20),),

                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),


                          Positioned(right: 10,
                            top: getVerticalSize(75),
                            child: Center(
                                child: Image.asset('asset/icons/cash_out_image.png',
                                  height: getVerticalSize(250),)
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ));

      Scaffold(
        backgroundColor: ColorConstant.backgroundColor,
        body: SingleChildScrollView(
            child: Container(
                height: size.height,
                child: Stack(
                  children: [
                    Image.asset('asset/icons/background_image.png',
                        fit: BoxFit.cover, width: double.infinity),
                    SafeArea(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppAppBar(
                                title: "Select Method",
                                icon1: "asset/icons/ic_back.svg",
                                icon2: "asset/icons/ic_notification.svg",
                                onPressedIcon1: () {
                                  Get.back();
                                },
                                onPressedIcon2: () {
                                  Get.toNamed(AppRoutes.notificationScreen);
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getHorizontalSize(20)),
                                child: Text(
                                  "Select top up methods",
                                  style: AppStyle.textStyleDMSANS.copyWith(
                                      color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w400,
                                      fontSize: getFontSize(22)),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: getVerticalSize(150)),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: ColorConstant.primaryWhite,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(32),
                                    topRight: Radius.circular(32),
                                  )),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: getVerticalSize(20),
                                  ),
                                  Container(
                                    height: getVerticalSize(7),
                                    width: getHorizontalSize(60),
                                    decoration: BoxDecoration(
                                        color: ColorConstant.greyBD,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                  SizedBox(
                                    height: getVerticalSize(20),
                                  ),
                                  SelectModeWidget(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.topupCardListScreen);

                                    },
                                    title: 'Credit Card',
                                    icon: 'asset/icons/ic_green_card.png',
                                  ),
                                  SizedBox(
                                    height: getVerticalSize(20),
                                  ),
                                  SelectModeWidget(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.topupBankListScreen);
                                    },
                                    title: 'Bank Transfer',
                                    icon: 'asset/icons/ic_bank_orange.png',
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ))));
  }
}
