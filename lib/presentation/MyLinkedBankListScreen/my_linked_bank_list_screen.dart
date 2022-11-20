import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../../theme/app_style.dart';
import 'controller/my_linked_bank_list_screen_controller.dart';

class MyLinkedBankListScreen extends StatelessWidget {
  var bankListController = Get.put(MyLinkedBankListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        MainCutomBackGround(
            child: Padding(
          padding: EdgeInsets.only(
              left: getHorizontalSize(20.0),
              right: getHorizontalSize(20.0),
              top: getVerticalSize(26)),
          child: SafeArea(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.close,
                              color: ColorConstant.primaryWhite,
                            )),
                        SizedBox(
                          width: 12,
                        ),
                        Text("Banking Details",
                            style: AppStyle.textStylePoppinsRegular.copyWith(
                                color: ColorConstant.primaryWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: getFontSize(18))),
                        // InkWell(
                        //   onTap: () {
                        //     Get.toNamed(AppRoutes.accountDetailListScreen);
                        //   },
                        //   child: Image.asset(
                        //     'asset/icons/notification_icon.png',
                        //     height: getVerticalSize(20),
                        //     width: getHorizontalSize(16),
                        //   ),
                        // )
                      ],
                    ),

                    SizedBox(
                      height: getVerticalSize(25),
                    ),

                    InkWell(
                      onTap: () {
                        // bankListController.showBankInfoBottomsheet();
                        Get.toNamed(AppRoutes.myBankAccountListScreen);
                      },
                      child: Container(
                        height: 100,
                        width: size.width,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: getVerticalSize(6.5)),
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorConstant.primaryAppTextF1
                                    .withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
                                        color: ColorConstant.primaryAppTextF1),
                                    child: Icon(Icons.add)),
                                SizedBox(
                                  width: 12,
                                ),
                                Text("My Banks",
                                    style: AppStyle.textStylePoppinsRegular
                                        .copyWith(
                                            color: ColorConstant.primaryWhite,
                                            fontWeight: FontWeight.w600,
                                            fontSize: getFontSize(18))),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Get.toNamed(AppRoutes.cardListScreen);
                      },
                      child: Container(
                        height: 100,
                        width: size.width,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: getVerticalSize(6.5)),
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorConstant.primaryAppTextF1
                                    .withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(12)),
                                        color: ColorConstant.primaryAppTextF1),
                                    child: Icon(Icons.add)),
                                SizedBox(
                                  width: 12,
                                ),
                                Text("My Cards",
                                    style: AppStyle.textStylePoppinsRegular
                                        .copyWith(
                                            color: ColorConstant.primaryWhite,
                                            fontWeight: FontWeight.w600,
                                            fontSize: getFontSize(18))),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )),
      ],
    ));
  }
}
