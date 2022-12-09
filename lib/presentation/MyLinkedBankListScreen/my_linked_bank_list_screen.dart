import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:secureapp/App%20Configurations/color_constants.dart';
import 'package:secureapp/routes/app_routes.dart';
import 'package:secureapp/utils/HelperFiles/math_utils.dart';

import '../../theme/app_style.dart';
import 'controller/my_linked_bank_list_screen_controller.dart';

class MyLinkedBankListScreen extends StatelessWidget {
  var bankListController = Get.put(MyLinkedBankListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [ Padding(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: SvgPicture.asset(
                            'asset/icons/ic_back.svg',
                            fit: BoxFit.fill,
                            height: getVerticalSize(42),
                          ),
                        ),
                        Text(
                          "Banking Details",
                          style: AppStyle.DmSansFont.copyWith(
                              color: ColorConstant.darkBlue,
                              fontWeight: FontWeight.w700,
                              fontSize: getFontSize(20)),
                        ),
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.transparent)),
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.transparent,),
                        ),                      ],
                    ),

                    SizedBox(
                      height: getVerticalSize(25),
                    ),

                    InkWell(
                      onTap: () {
                        // bankListController.showBankInfoBottomsheet();
                        // Get.toNamed(AppRoutes.myBankAccountListScreen);
                      },
                      child: Container(
                        height: 100,
                        width: size.width,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: getVerticalSize(6.5)),
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorConstant.lightGreen
                                    .withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  padding: EdgeInsets.all(12),
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: ColorConstant.lightGreen.withOpacity(0.5),
                                      borderRadius:
                                      BorderRadius.circular(10)),
                                  child: SvgPicture.asset(
                                    "asset/icons/ic_bank.svg",
                                    color: ColorConstant.blue26,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text("My Banks",
                                    style: AppStyle.textStyleDMSANS
                                        .copyWith(
                                            color: ColorConstant.primaryBlack,

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
                                color: ColorConstant.lightGreen.withOpacity(0.2),

                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  padding: EdgeInsets.all(12),
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: ColorConstant.lightGreen.withOpacity(0.5),
                                      borderRadius:
                                      BorderRadius.circular(10)),
                                  child: SvgPicture.asset(
                                    "asset/icons/ic_card.svg",
                                    color: ColorConstant.blue26,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text("My Cards",
                                    style: AppStyle.textStyleDMSANS
                                        .copyWith(
                                            color: ColorConstant.primaryBlack,
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
        )
      ],
    ));
  }
}
