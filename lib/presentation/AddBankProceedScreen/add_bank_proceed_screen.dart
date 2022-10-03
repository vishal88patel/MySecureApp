import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_secure_app/App%20Configurations/image_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/key_pad.dart';
import 'controller/add_bank_proceed_screen_controller.dart';

class AddBankProceedScreen extends StatelessWidget {
  var addBankProceedController = Get.find<AddBankProceedScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.primaryBlack,
        body: SafeArea(
          child: MainCutomBackGround(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Card(
                  color: ColorConstant.primaryWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(getVerticalSize(24)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: getVerticalSize(18),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Add ABC Bank Account",
                              style: AppStyle.textStyleSFPRORegular.copyWith(
                                  color: ColorConstant.primaryBlack,
                                  fontWeight: FontWeight.w700,
                                  fontSize: getFontSize(16)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getVerticalSize(18),
                        ),
                        RichText(
                          text: TextSpan(
                            // Note: Styles for TextSpans must be explicitly defined.
                            // Child text spans will inherit styles from parent
                            style: AppStyle.textStyleSFPRORegular.copyWith(
                                color: ColorConstant.primaryBlack,
                                fontWeight: FontWeight.w400,
                                fontSize: getFontSize(16)),
                            children: <TextSpan>[
                              TextSpan(
                                  text:
                                      'To improve your payments experience, extra Link ID will be activated. Standard SMS chares apply.'),
                              TextSpan(
                                  text: 'Learn more',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: getVerticalSize(18),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.collectDetailScreen,arguments: {
                              'BANK_ID': addBankProceedController.bankId,

                            });

                          },
                          style: ElevatedButton.styleFrom(
                            primary: ColorConstant.primaryBlack,
                            minimumSize: const Size.fromHeight(45),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                          ),
                          child: Text(
                            "Next",
                            style: AppStyle.textStylePoppinsRegular.copyWith(
                                color: ColorConstant.primaryWhite,
                                fontWeight: FontWeight.w700,
                                fontSize: getFontSize(20)),
                          ),
                        ),
                        SizedBox(
                          height: getVerticalSize(14),
                        ),
                        Row(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            Text(
                              "Continue without improvements",
                              style: AppStyle.textStylePoppinsRegular.copyWith(
                                  color: ColorConstant.lightText,
                                  fontWeight: FontWeight.w400,
                                  fontSize: getFontSize(13)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getVerticalSize(8),
                        ),
                        Row(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            Text(
                              "Power by",
                              style: AppStyle.textStylePoppinsRegular.copyWith(
                                  color: ColorConstant.lightText,
                                  fontWeight: FontWeight.w700,
                                  fontSize: getFontSize(14)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getVerticalSize(4),
                        ),
                        Row(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            Container(
                              height:getVerticalSize(6),
                              width: getVerticalSize(6),
                              decoration: BoxDecoration(
                                  color: ColorConstant.lightText,
                                  borderRadius: BorderRadius.circular(100)
                                //more than 50% of width makes circle
                              ),
                            ),
                            SizedBox(
                              width: getVerticalSize(5),
                            ),
                            Container(
                              height:getVerticalSize(6),
                              width: getVerticalSize(6),
                              decoration: BoxDecoration(
                                  color: ColorConstant.lightText,
                                  borderRadius: BorderRadius.circular(100)
                                //more than 50% of width makes circle
                              ),
                            ),
                            SizedBox(
                              width: getVerticalSize(5),
                            ),
                            Container(
                              height:getVerticalSize(6),
                              width: getVerticalSize(6),
                              decoration: BoxDecoration(
                                  color: ColorConstant.lightText,
                                  borderRadius: BorderRadius.circular(100)
                                //more than 50% of width makes circle
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: getVerticalSize(14),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
