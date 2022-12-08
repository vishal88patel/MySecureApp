import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_AppBar%20.dart';
import 'package:my_secure_app/presentation/widget/select_mode_widget.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import 'controller/support_screen_controller.dart';

class SupportScreen extends StatelessWidget {
  var supportController = Get.find<SupportScreenController>();

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
                    SafeArea(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Column( crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              AppAppBar(
                                title: "Help",
                                icon1: "asset/icons/ic_back.svg",
                                icon2: "asset/icons/ic_notification.svg",
                                onPressedIcon1: () {
                                  Get.back();
                                },
                                onPressedIcon2: () {
                                  Get.toNamed(AppRoutes.notificationScreen);
                                },
                              ),



                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: getVerticalSize(100)),
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
                                  verticalPadding: getVerticalSize(20),
                                  isIcon: false,
                                  onTap: (){
                                    Get.toNamed(AppRoutes.faqScreen);                                    },
                                  title: 'FAQs',
                                  icon: 'asset/icons/ic_green_card.png',
                                ),
                                SizedBox(height: getVerticalSize(20),),
                                SelectModeWidget(
                                  verticalPadding: getVerticalSize(20),
                                  isIcon: false,
                                  onTap: (){
                                    String webLink =
                                        "https://adminsecure.thriftyspends.com/contact-us";
                                    print(
                                        "Webview Link in Daily Horoscope Page :- " + webLink);
                                    Get.toNamed(AppRoutes.webviewPage, arguments: {
                                      "webLink": webLink,
                                      "appBarName": "Contact us",
                                    });
                                  },
                                  title: 'need more help?',
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
