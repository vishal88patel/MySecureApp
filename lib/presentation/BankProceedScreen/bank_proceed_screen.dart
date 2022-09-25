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
import 'controller/bank_proceed_screen_controller.dart';

class BankProceedScreen extends StatelessWidget {
  var approvedController = Get.find<BankProceedScreenController>();

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
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  ColorConstant.primaryWhite,
                                  ColorConstant.lightGreen,
                                  ColorConstant.lightGreen,
                                ],
                              )),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(getVerticalSize(30)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Your bank account has been \nCradited",
                                    style: AppStyle.textStyleSFPRORegular
                                        .copyWith(
                                            color: ColorConstant.primaryWhite,
                                            fontWeight: FontWeight.w700,
                                            fontSize: getFontSize(22)),
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipi scing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,",
                                    style: AppStyle.textStyleSFPRORegular
                                        .copyWith(
                                            color: ColorConstant.primaryWhite,
                                            fontWeight: FontWeight.w400,
                                            fontSize: getFontSize(16)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getVerticalSize(14),
                        ),
                        Text(
                          "Add ABC Bank Account",
                          style: AppStyle.textStyleSFPRORegular.copyWith(
                              color: ColorConstant.primaryBlack,
                              fontWeight: FontWeight.w700,
                              fontSize: getFontSize(16)),
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
                          height: getVerticalSize(14),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Get.toNamed(AppRoutes.approvedScreen);

                          },
                          style: ElevatedButton.styleFrom(
                            primary: ColorConstant.primaryBlack,
                            minimumSize: const Size.fromHeight(45),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                          ),
                          child: Text(
                            "Proceed",
                            style: AppStyle.textStylePoppinsRegular.copyWith(
                                color: ColorConstant.primaryWhite,
                                fontWeight: FontWeight.w700,
                                fontSize: getFontSize(20)),
                          ),
                        ),
                        SizedBox(
                          height: getVerticalSize(11),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: ColorConstant.lightButton,
                            minimumSize: const Size.fromHeight(45),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                          ),
                          child: Text(
                            "Contact Support",
                            style: AppStyle.textStylePoppinsRegular.copyWith(
                                color: ColorConstant.primaryWhite,
                                fontWeight: FontWeight.w700,
                                fontSize: getFontSize(20)),
                          ),
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
