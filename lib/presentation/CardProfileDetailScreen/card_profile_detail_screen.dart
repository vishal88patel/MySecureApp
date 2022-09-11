import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textFormField_fill.dart';
import 'package:my_secure_app/Custom%20Widgets/bank_list_widget.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import 'controller/card_profile_detail_screen_controller.dart';

class CardProfileDetailScreen extends StatelessWidget {
  var cardProfileDetailController = Get.find<CardProfileDetailScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            MainCutomBackGround(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: getHorizontalSize(40.0),
                      right: getHorizontalSize(40.0),
                      top:getVerticalSize( 26)),
                  child: SafeArea(
                    child: Stack(
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: getVerticalSize(60),),
                           Center(child: Container(height: getVerticalSize(170),width: getHorizontalSize(170),
                             color: ColorConstant.primaryWhite,
                           child: Image.asset('asset/icons/person_icon.png',color: Colors.grey,),)),
                            SizedBox(height: getVerticalSize(30),),

                           Center(child: Image.asset('asset/icons/my_card_icon.png',width: getHorizontalSize(42),height: getVerticalSize(32),)),
                            SizedBox(height: getVerticalSize(30),),
                            Row(
                              children: [
                                SizedBox(width:getHorizontalSize(180.0),
                                  child: Text("Given Name: ",
                                    style: AppStyle.textStylePoppinsRegular
                                        .copyWith(color: ColorConstant.primaryWhite,
                                        fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                                ),
                                Text("Smith ",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                              ],
                            ),
                            SizedBox(height: getVerticalSize(5),),
                            Divider(color: Colors.grey,),
                            SizedBox(height: getVerticalSize(5),),
                            Row(
                              children: [
                                SizedBox(width:getHorizontalSize(180.0),
                                  child: Text(" Date of Birth:",
                                    style: AppStyle.textStylePoppinsRegular
                                        .copyWith(color: ColorConstant.primaryWhite,
                                        fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                                ),
                                Text(" Hello",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                              ],
                            ),
                            SizedBox(height: getVerticalSize(5),),
                            Divider(color: Colors.grey,),
                            SizedBox(height: getVerticalSize(5),),      Row(
                              children: [
                                SizedBox(width:getHorizontalSize(180.0),
                                  child: Text("Passport No:",
                                    style: AppStyle.textStylePoppinsRegular
                                        .copyWith(color: ColorConstant.primaryWhite,
                                        fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                                ),
                                Text("  01/02/1990",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                              ],
                            ),
                            SizedBox(height: getVerticalSize(5),),
                            Divider(color: Colors.grey,),
                            SizedBox(height: getVerticalSize(5),),      Row(
                              children: [
                                SizedBox(width:getHorizontalSize(180.0),
                                  child: Text("Gender: ",
                                    style: AppStyle.textStylePoppinsRegular
                                        .copyWith(color: ColorConstant.primaryWhite,
                                        fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                                ),
                                Text(" 123456789",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                              ],
                            ),
                            SizedBox(height: getVerticalSize(5),),
                            Divider(color: Colors.grey,),
                            SizedBox(height: getVerticalSize(5),),      Row(
                              children: [
                                SizedBox(width:getHorizontalSize(180.0),
                                  child: Text(" Country Code: ",
                                    style: AppStyle.textStylePoppinsRegular
                                        .copyWith(color: ColorConstant.primaryWhite,
                                        fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                                ),
                                Text("Male",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                              ],
                            ),
                            SizedBox(height: getVerticalSize(5),),
                            Divider(color: Colors.grey,),
                            SizedBox(height: getVerticalSize(5),),      Row(
                              children: [
                                SizedBox(width:getHorizontalSize(180.0),
                                  child: Text("Extra Charges ",
                                    style: AppStyle.textStylePoppinsRegular
                                        .copyWith(color: ColorConstant.primaryWhite,
                                        fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                                ),
                                Text("USA01",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w500,fontSize: getFontSize(14)),),
                              ],
                            ),


                            Spacer(),

                            AppElevatedButton(buttonName: 'Next',
                                onPressed: (){
                                  Get.toNamed(AppRoutes.cardProfileDetailScreen);
                                }),
                            SizedBox(height: getVerticalSize(40),)
                          ],
                        ),
                      ],
                    ),
                  ),
                ) ),
          ],
        ));
  }
}
