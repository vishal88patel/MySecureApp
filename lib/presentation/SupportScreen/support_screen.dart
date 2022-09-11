import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/Custom%20Widgets/profile_widget.dart';
import 'package:my_secure_app/Custom%20Widgets/support_widget.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import 'controller/support_screen_controller.dart';

class SupportScreen extends StatelessWidget {
  var supportController = Get.find<SupportScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MainCutomBackGround(
            child: Padding(padding: EdgeInsets.symmetric(
                horizontal: getHorizontalSize(20.0),vertical:getVerticalSize( 26)),
              child: SafeArea(
                child: Stack(
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.arrow_back, color: ColorConstant.primaryWhite,),
                            SizedBox(width: getHorizontalSize(15),),
                            Text("Support",
                              style: AppStyle.textStylePoppinsRegular
                                  .copyWith(color: ColorConstant.primaryWhite,
                                  fontWeight: FontWeight.w500,fontSize: getFontSize(16)),),
                          ],
                        ),
                        SizedBox(height: getVerticalSize(54),),
                        SupportWidget(name: 'FAQs',icon: 'asset/icons/person_icon.png',onTap: (){
                          Get.toNamed(AppRoutes.faqScreen);
                        }),
                        SizedBox(height: getVerticalSize(15),),
                        SupportWidget(name: 'need more help?',icon: 'asset/icons/person_icon.png',onTap: (){
                          Get.toNamed(AppRoutes.moreHelpScreen);
                        }),

                      ],
                    ),
                  ],
                ),
              ),
            ) ));
  }
}
