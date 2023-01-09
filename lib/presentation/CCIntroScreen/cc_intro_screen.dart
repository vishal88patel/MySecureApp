import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:secure_cash_app/App%20Configurations/color_constants.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_textField.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';
import 'controller/cc_intro_controller.dart';

class CCIntroScreen extends StatelessWidget {
  var ccIntroController = Get.find<CCIntroController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.primaryWhite,
        body: SingleChildScrollView(
              child: Container(
                  height: size.height,
                  child: Stack(
                    children: [
                      SafeArea(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 26,),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: getHorizontalSize(20.0),
                              ),
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
                                              color: ColorConstant
                                                  .backBorder)),
                                      padding: EdgeInsets.all(6),
                                      child: Icon(
                                        Icons
                                            .arrow_back_ios_new_outlined,
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Cash Card",
                                    style: AppStyle.DmSansFont.copyWith(
                                        color:
                                        ColorConstant.primaryBlack,
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
                                    child: Icon(
                                      Icons.arrow_back_ios_new_outlined,
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: getVerticalSize(30),
                            ),
                            Image.asset('asset/icons/img_cash_card.png',
                                fit: BoxFit.cover,width: double.infinity),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: getHorizontalSize(20.0),
                              ),
                              child: Center(
                                child: Text(
                                  "Meet The Cash Card",
                                  style: AppStyle.DmSansFont.copyWith(
                                      color: ColorConstant.darkBlue,
                                      fontWeight: FontWeight.w700,
                                      fontSize: getFontSize(22)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: getVerticalSize(20),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: getHorizontalSize(20.0),
                              ),
                              child: Center(
                                child: Text(
                                  "The customizable, no hidden tee, instant discount debit card",
                                  style: AppStyle.DmSansFont.copyWith(
                                      color: ColorConstant.naturalGrey4,
                                      fontWeight: FontWeight.w500,
                                      fontSize: getFontSize(20)),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: getHorizontalSize(20.0),
                              ),
                              child: AppElevatedButton(
                                  buttonName: 'Get Free Cash Card',
                                  radius: 12,
                                  onPressed: () {
                                    Get.toNamed(
                                        AppRoutes.ccStyleScreen);
                                    // Get.to(AmountRadialScreen());
                                  }),
                            ),
                            SizedBox(
                              height: getVerticalSize(36),
                            ),
                          ],
                        ),
                      ),

                    ],
                  )))
        );
  }
}

