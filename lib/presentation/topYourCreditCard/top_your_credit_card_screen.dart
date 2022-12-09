import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:secure_cash_app/App%20Configurations/image_constants.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_AppBar%20.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secure_cash_app/presentation/widget/select_mode_widget.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';

import '../../App Configurations/color_constants.dart';
import '../../utils/ConstantsFiles/string_constants.dart';
import '../../utils/HelperFiles/math_utils.dart';
import '../../utils/HelperFiles/pref_utils.dart';
import 'controller/top_add_card_fill_screen_controller.dart';

class TopYourCreditCardScreen extends StatelessWidget {
  var topYourCreditCardScreenController = Get.find<TopYourCreditCardController>();

  @override
  Widget build(BuildContext context) {
    // PrefUtils.setString(StringConstants.IS_KYC_DONE,"1");
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      body: Container(
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: getVerticalSize(
                  420.00,
                ),
                width: size.width,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(45),
                          bottomRight: Radius.circular(45)),
                      child: Image.asset(
                        "asset/icons/ic_noti_background.png",
                        width: MediaQuery.of(context).size.width,
                        height: getVerticalSize(
                          500.00,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              AppAppBar(
                                title: "Your Credit Card",
                                icon1: "asset/icons/ic_back.svg",
                                icon2: "asset/icons/ic_notification.svg",
                                onPressedIcon1: () {
                                  Get.back();
                                },
                                onPressedIcon2: () {
                                  Get.toNamed(AppRoutes.notificationScreen);
                                },
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [

                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: 7,
                                              right: 10,
                                            ),
                                            child: Text(
                                              "Your credit card has been \nsuccessfully added ",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.DmSansFont
                                                  .copyWith(
                                                  color: ColorConstant
                                                      .naturalGrey,
                                                  fontSize:
                                                  getFontSize(20),
                                                  fontWeight:
                                                  FontWeight.w400),
                                            ),
                                          ),

                                        ],
                                      ),
                                      Image.asset('asset/icons/ic_plus_orange.png',
                                        height: getVerticalSize(50),width: getHorizontalSize(50),)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: getVerticalSize(26),
                        ),

                        Card(
                          margin: const EdgeInsets.symmetric(horizontal: 0),
                          color: ColorConstant.primaryLightGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: getHorizontalSize(300),
                                height: getVerticalSize(20),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Card(
                            margin: const EdgeInsets.symmetric(horizontal: 0),
                            color: ColorConstant.primaryOrange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: getHorizontalSize(350),
                                  child: Padding(
                                    padding:  EdgeInsets.only(left: getHorizontalSize(20),
                                        right: getHorizontalSize(20),top: getVerticalSize(20)),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Balance",
                                              style: AppStyle.textStyleDMSANS.copyWith(
                                                  color: ColorConstant.primaryWhite,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: getFontSize(18)),
                                            ),
                                            SvgPicture.asset(
                                              "asset/icons/ic_card_logo.svg",
                                              fit: BoxFit.fill,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "\$00",
                                          style: AppStyle.textStyleDMSANS.copyWith(
                                              color: ColorConstant.primaryWhite,
                                              fontWeight: FontWeight.w500,
                                              fontSize: getFontSize(28)),
                                        ),
                                        SizedBox(height: getHorizontalSize(15),),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              "asset/icons/ic_chip.svg",
                                              fit: BoxFit.fill,
                                            ),
                                            SizedBox(width: getHorizontalSize(12),),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle
                                              ),
                                            ),
                                            SizedBox(width: getHorizontalSize(6),),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle
                                              ),
                                            ),
                                            SizedBox(width: getHorizontalSize(6),),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle
                                              ),
                                            ),
                                            SizedBox(width: getHorizontalSize(6),),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle
                                              ),
                                            ),
                                            SizedBox(width: getHorizontalSize(12),),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle
                                              ),
                                            ),
                                            SizedBox(width: getHorizontalSize(6),),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle
                                              ),
                                            ),
                                            SizedBox(width: getHorizontalSize(6),),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle
                                              ),
                                            ),
                                            SizedBox(width: getHorizontalSize(6),),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle
                                              ),
                                            ),
                                            SizedBox(width: getHorizontalSize(12),),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle
                                              ),
                                            ),
                                            SizedBox(width: getHorizontalSize(6),),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle
                                              ),
                                            ),
                                            SizedBox(width: getHorizontalSize(6),),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle
                                              ),
                                            ),
                                            SizedBox(width: getHorizontalSize(6),),
                                            Container(
                                              height: getVerticalSize(6),
                                              width: getVerticalSize(6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle
                                              ),
                                            ),
                                            SizedBox(width: getHorizontalSize(12),),
                                            Text(
                                              "3765",
                                              style: AppStyle.textStyleDMSANS.copyWith(
                                                  color: ColorConstant.primaryWhite,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: getFontSize(20)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: getVerticalSize(20),),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                    child: Text(
                      "Card Settings",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style:
                      AppStyle.DmSansFont.copyWith(
                          color: ColorConstant
                              .naturalBlack,
                          fontSize: getFontSize(22),
                          fontWeight:
                          FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: getVerticalSize(20),),
                  SelectModeWidget(
                    onTap: (){
                      Get.toNamed(AppRoutes.topWithCreditCardScreen);
                    },
                    color: ColorConstant.greyF9,
                    iconW: 25,
                    iconV: 25,
                    title: 'Set Limit',
                    icon: 'asset/icons/ic_setting.png',
                  ),
                  SizedBox(height: getVerticalSize(20),),
                  SelectModeWidget(
                    onTap: (){},
                    iconW: 25,
                    iconV: 25,
                    color: ColorConstant.greyF9,
                    title: 'Lock Card',
                    icon: 'asset/icons/ic_lock.png',
                  ),
                  SizedBox(height: getVerticalSize(230),),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                    child: AppElevatedButton(
                        buttonName: 'Top Up Now',
                        textColor: ColorConstant.primaryWhite,
                        onPressed: () {
                          // Get.toNamed(AppRoutes.topAddCard1Screen);
                          // Get.to(
                          //   LoaderScreen("",AppRoutes.creatPasswordScreen),
                          //   transition: Transition.rightToLeft,
                          //   duration: Duration(milliseconds: 400),
                          // );
                        }),
                  ),
                  SizedBox(height: getVerticalSize(15),),

                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
