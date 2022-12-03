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
import 'controller/top_add_card_confirm_screen_controller.dart';

class TopAddCardConfirmScreen extends StatelessWidget {
  var topAddCardConfirmScreenController = Get.find<TopAddCardConfirmController>();

  @override
  Widget build(BuildContext context) {
    // PrefUtils.setString(StringConstants.IS_KYC_DONE,"1");
    return Scaffold(
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
                                Text(
                                  "Add Card Confirm",
                                  style: AppStyle.textStyleDMSANS.copyWith(
                                      color: ColorConstant.naturalBlack,
                                      fontWeight: FontWeight.w700,
                                      fontSize: getFontSize(22)),
                                ),
                                SizedBox(height: getVerticalSize(20),),

                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                    child: Text(
                                      "Your card",
                                      style: AppStyle.textStyleDMSANS.copyWith(
                                          color: ColorConstant.grey8F,
                                          fontWeight: FontWeight.w500,
                                          fontSize: getFontSize(18)),
                                    ),
                                  ),
                                ),
                                SizedBox(height: getVerticalSize(10),),

                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                  child: Card(
                                    margin: const EdgeInsets.symmetric(horizontal: 0),
                                    color: ColorConstant.primaryOrange,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
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
                                                  "\$0",
                                                  style: AppStyle.textStyleDMSANS.copyWith(
                                                      color: ColorConstant.primaryWhite,
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: getFontSize(26)),
                                                ),
                                                SizedBox(height: getHorizontalSize(30),),
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
                                                          color: ColorConstant.primaryWhite,
                                                          shape: BoxShape.circle
                                                      ),
                                                    ),
                                                    SizedBox(width: getHorizontalSize(6),),
                                                    Container(
                                                      height: getVerticalSize(6),
                                                      width: getVerticalSize(6),
                                                      decoration: BoxDecoration(
                                                          color: ColorConstant.primaryWhite,
                                                          shape: BoxShape.circle
                                                      ),
                                                    ),
                                                    SizedBox(width: getHorizontalSize(6),),
                                                    Container(
                                                      height: getVerticalSize(6),
                                                      width: getVerticalSize(6),
                                                      decoration: BoxDecoration(
                                                          color: ColorConstant.primaryWhite,
                                                          shape: BoxShape.circle
                                                      ),
                                                    ),
                                                    SizedBox(width: getHorizontalSize(6),),
                                                    Container(
                                                      height: getVerticalSize(6),
                                                      width: getVerticalSize(6),
                                                      decoration: BoxDecoration(
                                                          color: ColorConstant.primaryWhite,
                                                          shape: BoxShape.circle
                                                      ),
                                                    ),
                                                    SizedBox(width: getHorizontalSize(12),),
                                                    Container(
                                                      height: getVerticalSize(6),
                                                      width: getVerticalSize(6),
                                                      decoration: BoxDecoration(
                                                          color: ColorConstant.primaryWhite,
                                                          shape: BoxShape.circle
                                                      ),
                                                    ),
                                                    SizedBox(width: getHorizontalSize(6),),
                                                    Container(
                                                      height: getVerticalSize(6),
                                                      width: getVerticalSize(6),
                                                      decoration: BoxDecoration(
                                                          color: ColorConstant.primaryWhite,
                                                          shape: BoxShape.circle
                                                      ),
                                                    ),
                                                    SizedBox(width: getHorizontalSize(6),),
                                                    Container(
                                                      height: getVerticalSize(6),
                                                      width: getVerticalSize(6),
                                                      decoration: BoxDecoration(
                                                          color: ColorConstant.primaryWhite,
                                                          shape: BoxShape.circle
                                                      ),
                                                    ),
                                                    SizedBox(width: getHorizontalSize(6),),
                                                    Container(
                                                      height: getVerticalSize(6),
                                                      width: getVerticalSize(6),
                                                      decoration: BoxDecoration(
                                                          color: ColorConstant.primaryWhite,
                                                          shape: BoxShape.circle
                                                      ),
                                                    ),
                                                    SizedBox(width: getHorizontalSize(12),),
                                                    Container(
                                                      height: getVerticalSize(6),
                                                      width: getVerticalSize(6),
                                                      decoration: BoxDecoration(
                                                          color:ColorConstant.primaryWhite,
                                                          shape: BoxShape.circle
                                                      ),
                                                    ),
                                                    SizedBox(width: getHorizontalSize(6),),
                                                    Container(
                                                      height: getVerticalSize(6),
                                                      width: getVerticalSize(6),
                                                      decoration: BoxDecoration(
                                                          color: ColorConstant.primaryWhite,
                                                          shape: BoxShape.circle
                                                      ),
                                                    ),
                                                    SizedBox(width: getHorizontalSize(6),),
                                                    Container(
                                                      height: getVerticalSize(6),
                                                      width: getVerticalSize(6),
                                                      decoration: BoxDecoration(
                                                          color: ColorConstant.primaryWhite,
                                                          shape: BoxShape.circle
                                                      ),
                                                    ),
                                                    SizedBox(width: getHorizontalSize(6),),
                                                    Container(
                                                      height: getVerticalSize(6),
                                                      width: getVerticalSize(6),
                                                      decoration: BoxDecoration(
                                                          color: ColorConstant.primaryWhite,
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
                                                SizedBox(height: getVerticalSize(40),),
                                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      "BIANCA COOPER",
                                                      style: AppStyle.textStyleDMSANS.copyWith(
                                                          color: ColorConstant.primaryWhite,
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: getFontSize(16)),
                                                    ),
                                                    Text(
                                                      "11/24",
                                                      style: AppStyle.textStyleDMSANS.copyWith(
                                                          color: ColorConstant.primaryWhite,
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: getFontSize(16)),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: getVerticalSize(20),),

                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: getVerticalSize(20),),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                  child: Divider(),
                                ),
                                SizedBox(height: getVerticalSize(20),),
                                
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: ColorConstant.primaryLightGreen.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(16)
                                    ),
                                    padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20),
                                        vertical: getVerticalSize(20)),

                                    child:  Row(
                                      children: [
                                        Icon(Icons.info, color: ColorConstant.primaryDarkGreen,size: 20,),
                                       SizedBox(width: getHorizontalSize(10),),
                                        Text(
                                          "Top up using any credit card just cost 2%",
                                          style: AppStyle.textStyleDMSANS.copyWith(
                                              color: ColorConstant.primaryDarkGreen,
                                              fontWeight: FontWeight.w500,
                                              fontSize: getFontSize(16)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: getVerticalSize(20),),

                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: ColorConstant.primaryLightGreen.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(16)
                                    ),
                                    padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20),
                                        vertical: getVerticalSize(20)),

                                    child:  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset('asset/icons/ic_check_card.png',
                                              height: getVerticalSize(40),width: getHorizontalSize(40),),
                                            SizedBox(width: getHorizontalSize(10),),
                                            Text(
                                              "Automatically activate after\n opening an account",
                                              style: AppStyle.textStyleDMSANS.copyWith(
                                                  color: ColorConstant.primaryDarkGreen,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: getFontSize(18)),
                                            ),
                                          ],
                                        ),
                                        Obx(()
                                          => Transform.scale(
                                              scale: 1.5,
                                              child: Switch(
                                                onChanged: topAddCardConfirmScreenController.toggleSwitch,
                                                value: topAddCardConfirmScreenController.isSwitched.value,
                                                activeColor: ColorConstant.primaryWhite,
                                                activeTrackColor: ColorConstant.primaryLightGreen,
                                                inactiveThumbColor: ColorConstant.primaryWhite,
                                                inactiveTrackColor: ColorConstant.grey8F,
                                              )
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      SizedBox(height: getVerticalSize(140),),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: AppElevatedButton(
                                                buttonName: 'cancel',
                                                buttonColor: ColorConstant.naturalGrey2,
                                                textColor: ColorConstant.grey8F,
                                                onPressed: () {
                                                  Get.back();
                                                  // Get.to(
                                                  //   LoaderScreen("",AppRoutes.creatPasswordScreen),
                                                  //   transition: Transition.rightToLeft,
                                                  //   duration: Duration(milliseconds: 400),
                                                  // );
                                                }),
                                          ),
                                          SizedBox(width: getHorizontalSize(10)),
                                          Expanded(
                                            child: AppElevatedButton(
                                                buttonName: 'Add Card',
                                                textColor: ColorConstant.primaryWhite,
                                                onPressed: () {
                                                  Get.toNamed(AppRoutes.topYourCreditCardScreen);
                                                  // Get.to(
                                                  //   LoaderScreen("",AppRoutes.creatPasswordScreen),
                                                  //   transition: Transition.rightToLeft,
                                                  //   duration: Duration(milliseconds: 400),
                                                  // );
                                                }),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

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
