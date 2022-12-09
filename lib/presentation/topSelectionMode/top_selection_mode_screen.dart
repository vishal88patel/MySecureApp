import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:secureapp/App%20Configurations/image_constants.dart';
import 'package:secureapp/Custom%20Widgets/app_AppBar%20.dart';
import 'package:secureapp/presentation/widget/select_mode_widget.dart';
import 'package:secureapp/routes/app_routes.dart';
import 'package:secureapp/theme/app_style.dart';

import '../../App Configurations/color_constants.dart';
import '../../utils/ConstantsFiles/string_constants.dart';
import '../../utils/HelperFiles/math_utils.dart';
import '../../utils/HelperFiles/pref_utils.dart';
import 'controller/top_selection_mode_screen_controller.dart';

class TopSelectionModeScreen extends StatelessWidget {
  var topSelectionModeScreenController = Get.find<TopSelectionModeController>();

  @override
  Widget build(BuildContext context) {
    // PrefUtils.setString(StringConstants.IS_KYC_DONE,"1");
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
        body: SingleChildScrollView(
            child: Container(
                height: size.height,
                child: Stack(
                  children: [
                    Image.asset('asset/icons/background_image.png',
                        fit: BoxFit.cover,width: double.infinity),
                    SafeArea(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Column( crossAxisAlignment: CrossAxisAlignment.start,
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
                                padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                child: Text(
                                  "Select top up methods",
                                  style: AppStyle.textStyleDMSANS.copyWith(
                                      color: ColorConstant.naturalGrey,
                                      fontWeight:FontWeight.w400,
                                      fontSize:getFontSize(22)),
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
                                  )
                              ),child:Column(
                                children: [
                                  SizedBox(height: getVerticalSize(20),),
                                  Container(
                                  height: getVerticalSize(7),
                                  width: getHorizontalSize(60),
                                  decoration: BoxDecoration(
                                      color: ColorConstant.greyBD,
                                      borderRadius: BorderRadius.circular(50)
                                  ),
                            ),
                                  SizedBox(height: getVerticalSize(20),),
                                  SelectModeWidget(
                                    onTap: (){
                                      Get.toNamed(AppRoutes.topWithCreditCardScreen);
                                    },
                                    title: 'Credit Card',
                                    icon: 'asset/icons/ic_green_card.png',
                                  ),
                                  SizedBox(height: getVerticalSize(20),),
                                  SelectModeWidget(
                                    onTap: (){},
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
