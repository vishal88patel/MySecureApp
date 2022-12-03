import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_secure_app/App%20Configurations/image_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_AppBar%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/presentation/widget/select_mode_widget.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';

import '../../App Configurations/color_constants.dart';
import '../../utils/ConstantsFiles/string_constants.dart';
import '../../utils/HelperFiles/math_utils.dart';
import '../../utils/HelperFiles/pref_utils.dart';
import 'controller/top_with_credit_card_controller.dart';

class TopWithCreditCardScreen extends StatelessWidget {
  var topWithCreditCardScreenController = Get.find<TopWithCreditCardController>();

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
                                title: "Top Up with Credit Card",
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
                                          Text(
                                            "Credit Card",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style:
                                            AppStyle.DmSansFont.copyWith(
                                                color: ColorConstant
                                                    .primaryWhite,
                                                fontSize: getFontSize(22),
                                                fontWeight:
                                                FontWeight.w700),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: 7,
                                              right: 10,
                                            ),
                                            child: Text(
                                              "Choose your credit card",
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
                          color: ColorConstant.naturalBlack.withOpacity(0.2),
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
                            color: ColorConstant.primaryLightGreen,
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
                                          "\$26,968.00",
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Set amount",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style:
                      AppStyle.DmSansFont.copyWith(
                          color: ColorConstant
                              .naturalBlack,
                          fontSize: getFontSize(20),
                          fontWeight:
                          FontWeight.w700),
                    ),
                    SizedBox(height: getVerticalSize(5),),
                    Text(
                      "How much would you like to top up?",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.DmSansFont
                          .copyWith(
                          color: ColorConstant.grey8F,
                          fontSize:
                          getFontSize(18),
                          fontWeight:
                          FontWeight.w400),
                    ),
                    SizedBox(height: getVerticalSize(15),),

                    TextFormField(textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Amount',
                        hintStyle: AppStyle.DmSansFont
                            .copyWith(
                            color: ColorConstant.grey8F,

                            fontWeight: FontWeight.w400,fontSize: getFontSize(30)),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: ColorConstant.grey8F.withOpacity(0.5),width: 1),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: ColorConstant.grey8F.withOpacity(0.5),width: 1),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      style:AppStyle.DmSansFont
                          .copyWith(
                          color: ColorConstant.naturalBlack,
                          fontWeight: FontWeight.w700,fontSize: getFontSize(30)),
                    ),
                    SizedBox(height: getVerticalSize(20),),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: ColorConstant.buttonGreen.withOpacity(0.15)
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(25),
                              vertical: getVerticalSize(7)),
                              child: Text(
                                "\$100.00",
                                style:
                                AppStyle.DmSansFont.copyWith(
                                    color: ColorConstant
                                        .buttonGreen,
                                    fontSize: getFontSize(16),
                                    fontWeight:
                                    FontWeight.w500),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: ColorConstant.buttonGreen.withOpacity(0.15)
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(25),
                                  vertical: getVerticalSize(7)),
                              child: Text(
                                "\$100.00",
                                style:
                                AppStyle.DmSansFont.copyWith(
                                    color: ColorConstant
                                        .buttonGreen,
                                    fontSize: getFontSize(16),
                                    fontWeight:
                                    FontWeight.w500),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: ColorConstant.buttonGreen.withOpacity(0.15)
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(25),
                                  vertical: getVerticalSize(7)),
                              child: Text(
                                "\$100.00",
                                style:
                                AppStyle.DmSansFont.copyWith(
                                    color: ColorConstant
                                        .buttonGreen,
                                    fontSize: getFontSize(16),
                                    fontWeight:
                                    FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    SizedBox(height: getVerticalSize(150),),
                    AppElevatedButton(
                        buttonName: 'Top Up Now',
                        textColor: ColorConstant.primaryWhite,
                        onPressed: () {
                          Get.toNamed(AppRoutes.topAddCard1Screen);
                          // Get.to(
                          //   LoaderScreen("",AppRoutes.creatPasswordScreen),
                          //   transition: Transition.rightToLeft,
                          //   duration: Duration(milliseconds: 400),
                          // );
                        }),
                    SizedBox(height: getVerticalSize(15),),

                    Center(
                      child: TextButton(onPressed: (){
                        Get.back();
                      }, child: Text(
                        "Back to home",
                        style:
                        AppStyle.DmSansFont.copyWith(
                            color: ColorConstant
                                .naturalGrey,
                            fontSize: getFontSize(18),
                            fontWeight:
                            FontWeight.w500),
                      ),),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
