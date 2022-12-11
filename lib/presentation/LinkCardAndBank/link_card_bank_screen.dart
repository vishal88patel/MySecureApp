import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:secure_cash_app/App%20Configurations/image_constants.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_AppBar%20.dart';
import 'package:secure_cash_app/presentation/widget/select_mode_widget.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';

import '../../App Configurations/color_constants.dart';
import '../../utils/ConstantsFiles/string_constants.dart';
import '../../utils/HelperFiles/math_utils.dart';
import '../../utils/HelperFiles/pref_utils.dart';
import 'controller/link_card_bank_screen_controller.dart';

class LinkCardBankScreen extends StatelessWidget {
  var linkCardBankScreenController = Get.find<LinkCardBankController>();

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
                                title: "Personal Details",
                                icon1: "asset/icons/ic_back.svg",
                                icon2: "asset/icons/ic_notification.svg",
                                onPressedIcon1: () {
                                  Get.back();
                                },
                                onPressedIcon2: () {
                                 // Get.toNamed(AppRoutes.notificationScreen);
                                },
                              ),

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                child: Text(
                                  "Please Choose Detail of",
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
                                      Get.toNamed(AppRoutes.cardListScreen);                                    },
                                    title: 'My Card',
                                    icon: 'asset/icons/ic_green_card.png',
                                  ),
                                  SizedBox(height: getVerticalSize(20),),
                                  SelectModeWidget(
                                    onTap: (){
                                      Get.toNamed(AppRoutes.myBankAccountListScreen);

                                    },
                                    title: 'My Bank',
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
