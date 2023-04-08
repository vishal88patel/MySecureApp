import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:secure_cash_app/App%20Configurations/color_constants.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_textField.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import '../../Custom Widgets/common_image_view.dart';
import '../../utils/HelperFiles/common_utils.dart';
import '../CCCardDetailScreen/controller/cc_card_detail_controller.dart';
import 'controller/cc_card_success_controller.dart';



class CCCardSuccessScreen extends StatelessWidget {
  var ccSuccessController = Get.find<CCCardSuccessController>();
  var ccCardDetailController = Get.find<CCCardDetailController>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>goToHome(),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: ColorConstant.darkGreen,
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: size.width,
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Text(
                        " ",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: AppStyle.DmSansFont.copyWith(
                            color: ColorConstant.primaryWhite,
                            fontWeight: FontWeight.w700,
                            fontSize: getFontSize(30)),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width,
                    child: SingleChildScrollView(
                      child: Container(
                        height: getVerticalSize(
                          650.00,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: CommonImageView(
                                svgPath: "asset/icons/img_subtract.svg",
                                height: getVerticalSize(
                                  650.00,
                                ),
                                width: getHorizontalSize(
                                  370.00,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 64,
                                          right: 64,
                                          top:20
                                      ),
                                      child:Image.asset(
                                        "asset/icons/img_success_check.png",
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: 64,
                                        top: 32,
                                        right: 64,
                                      ),
                                      child: Text(
                                        "Activation Successful",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.DmSansFont.copyWith(
                                            color: ColorConstant.naturalBlack,
                                            fontSize: getFontSize(24),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding:
                                      EdgeInsets.only(left: 28, right: 28, top: 10),
                                      child: Text(
                                        "Your Cash Card Activation Process is Completed Successfully.",
                                        textAlign: TextAlign.center,
                                        style: AppStyle.DmSansFont.copyWith(
                                            color: ColorConstant.naturalGrey4,
                                            fontSize: getFontSize(20),
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 38.0, right: 38,top:32),
                                      child: DottedLine(
                                          dashColor: ColorConstant.greyTextColor),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding:
                                      EdgeInsets.only(top: 30, right: 10, left: 40),
                                      child: Text(
                                        "Card ",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.DmSansFont.copyWith(
                                            color: ColorConstant.greyTextColor,
                                            fontSize: getFontSize(20),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      margin:
                                      EdgeInsets.only(top: 12, left: 40, right: 40),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF2F2F2),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Card(
                                            clipBehavior: Clip.antiAlias,
                                            elevation: 0,
                                            margin: EdgeInsets.only(
                                              left: 16,
                                              top: 17,
                                              bottom: 16,
                                            ),
                                            color: ColorConstant.primaryWhite,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(6)),
                                            ),
                                            child: Container(
                                              height: getSize(
                                                48.00,
                                              ),
                                              width: getSize(
                                                48.00,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(6)),
                                              ),
                                              child: Stack(
                                                children: [
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child:Image.asset(
                                                      'asset/icons/credit_card.png',height: 20,),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 16,
                                              top: 18,
                                              bottom: 16,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    right: 10,
                                                  ),
                                                  child: Text(
                                                    ccCardDetailController.nameController.text,
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle.DmSansFont.copyWith(
                                                        color: ColorConstant.primaryBlack,
                                                        fontSize: getFontSize(20),
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ),

                                                Container(
                                                  width: getHorizontalSize(
                                                    179.00,
                                                  ),
                                                  margin: EdgeInsets.only(
                                                    top: 3,
                                                  ),
                                                  child: Row(

                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        CommonUtils.FormatCardNumber(
                                                            ccCardDetailController.cardNumberController.text
                                                                .toString().replaceAll(" ", ""))
                                                        ,
                                                        overflow: TextOverflow.ellipsis,
                                                        textAlign: TextAlign.left,
                                                        style: AppStyle.DmSansFont.copyWith(
                                                            color: ColorConstant.greyTextColor,
                                                            fontSize: getFontSize(14),
                                                            fontWeight: FontWeight.bold),
                                                      ),



                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 40.0,right: 40,top: 12),
                                    child: AppElevatedButton(
                                      buttonName: "Home",
                                      textColor: Colors.white,
                                      buttonColor: ColorConstant.primaryLightGreen,
                                      radius: 16,
                                      onPressed: () {
                                        Get.offAllNamed(AppRoutes.dashBoardScreen,arguments: {"bottomTabCount":0});
                                      },
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  goToHome() {
    Get.offAllNamed(AppRoutes.dashBoardScreen,
        arguments: {"bottomTabCount": 0});  }
}

