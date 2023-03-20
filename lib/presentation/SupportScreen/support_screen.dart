import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/App%20Configurations/color_constants.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_AppBar%20.dart';
import 'package:secure_cash_app/presentation/widget/select_mode_widget.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import 'controller/support_screen_controller.dart';

class SupportScreen extends StatelessWidget {
  var supportController = Get.find<SupportScreenController>();


  @override
  Widget build(BuildContext context) {
    // PrefUtils.setString(StringConstants.IS_KYC_DONE,"1");
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor,
        body:SingleChildScrollView(
            child: Container(
                color: ColorConstant.buttonGreen.withOpacity(0.3),
                height: size.height,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: getVerticalSize(20)),
                      child: SafeArea(
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: getHorizontalSize(20)),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                            Icons.arrow_back_ios_new_outlined,
                                            size: 22,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Help",
                                        style: AppStyle.DmSansFont.copyWith(
                                            color: ColorConstant.primaryBlack,
                                            fontWeight: FontWeight.w700,
                                            fontSize: getFontSize(20)),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            border: Border.all(
                                              color: Colors.transparent)),
                                        padding: EdgeInsets.all(6),
                                        child: Icon(
                                          Icons.arrow_back_ios_new_outlined,
                                          color: Colors.transparent,
                                          size: 22,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: getVerticalSize(150),
                                ),
                                Expanded(
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
                                        Expanded(
                                          child:Column(
                                            children: [
                                              SizedBox(height: getVerticalSize(50),),
                                              SizedBox(height: getVerticalSize(50),),
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
                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            Positioned(
                              right: 10,
                              top: getVerticalSize(60),
                              child: Center(
                                  child: ClipRRect(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                    child: Image.asset(
                                      'asset/icons/email_image.jpg',
                                      height: getVerticalSize(220),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )))
    );
  }
}
