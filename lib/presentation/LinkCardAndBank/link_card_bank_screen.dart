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
                                        "Personal Details",
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
                                        padding: EdgeInsets.all(10),
                                        child: SvgPicture.asset(""),
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
                                        SizedBox(
                                          height: getVerticalSize(100),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: getHorizontalSize(20)),
                                          child: Text(
                                            "Please Choose Detail of",
                                            style: AppStyle.textStyleDMSANS.copyWith(
                                                color: ColorConstant.primaryBlack,
                                                fontWeight: FontWeight.w400,
                                                fontSize: getFontSize(22)),
                                          ),
                                        ),

                                        SizedBox(
                                          height: getVerticalSize(20),
                                        ),
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
