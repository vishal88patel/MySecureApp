import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textFormField_fill.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/Custom%20Widgets/profile_widget.dart';
import 'package:my_secure_app/Custom%20Widgets/support_widget.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import 'controller/faq_screen_controller.dart';

class FaqScreen extends StatelessWidget {
  var faqController = Get.find<FaqScreenController>();

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
                            Text("FAQs",
                              style: AppStyle.textStylePoppinsRegular
                                  .copyWith(color: ColorConstant.primaryWhite,
                                  fontWeight: FontWeight.w500,fontSize: getFontSize(16)),),
                          ],
                        ),
                        SizedBox(height: getVerticalSize(42),),

                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: SizedBox(height: getVerticalSize(50),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Search your question',
                               filled: true,
                                  hintStyle: AppStyle.textStylePoppinsRegular
                                      .copyWith(color: ColorConstant.primaryAppTextF1,
                                      fontWeight: FontWeight.w400,fontSize: getFontSize(16)),
                               fillColor: ColorConstant.blue26,
                                  suffixIcon: Icon(
                                    Icons.search,size: getSize(20),
                                    color:  ColorConstant.primaryAppTextF1,
                                  ),
                                  border: InputBorder.none,

                                ),
                               )
                          ),
                        ),
                        SizedBox(height: getVerticalSize(42),),
                        SupportWidget(name: 'What is My Secure ?',icon: 'asset/icons/person_icon.png',),
                        SizedBox(height: getVerticalSize(15),),
                        SupportWidget(name: 'What can i do with My Secure ?',icon: 'asset/icons/person_icon.png',),
                        SizedBox(height: getVerticalSize(15),),
                        SupportWidget(name: 'What are the benfits of using My Secure ?',icon: 'asset/icons/person_icon.png',),
                        SizedBox(height: getVerticalSize(15),),
                        SupportWidget(name: 'How do i register on the My Secure app?',icon: 'asset/icons/person_icon.png',),
                        SizedBox(height: getVerticalSize(15),),
                        SupportWidget(name: 'What is the criteria to get membership?',icon: 'asset/icons/person_icon.png',),
                        SizedBox(height: getVerticalSize(15),),
                        SupportWidget(name: 'How Safe is my personal information?',icon: 'asset/icons/person_icon.png',),


                      ],
                    ),
                  ],
                ),
              ),
            ) ));
  }
}
