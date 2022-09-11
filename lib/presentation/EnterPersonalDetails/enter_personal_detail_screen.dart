import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/presentation/EnterPersonalDetails/controller/enter_personal_detail_screen_controller.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

class EnterPersonalDetailScreen extends StatelessWidget {
  var enterPersonalDetailController = Get.find<EnterPersonalScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            MainCutomBackGround(
                child: Padding(padding: EdgeInsets.symmetric(
                    horizontal: getHorizontalSize(36.0),vertical:getVerticalSize( 26)),
                  child: SafeArea(
                    child: Stack(
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row( mainAxisAlignment : MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.arrow_back, color: ColorConstant.primaryWhite,),
                                Text("4/4",style: AppStyle.textStylePoppinsRegular
                                    .copyWith(color: ColorConstant.primaryWhite),),
                              ],
                            ),
                            SizedBox(height: getVerticalSize(57),),
                            Text("Enter your \nPersonal details",style: AppStyle.textStylePoppinsRegular
                                .copyWith(color: ColorConstant.primaryWhite,
                                fontWeight: FontWeight.w700,fontSize: getFontSize(32)),),
                            SizedBox(height: getVerticalSize(43),),
                            const AppTextField(hintText: 'Enter your Address 01'),
                            SizedBox(height: getVerticalSize(30),),
                            const AppTextField(hintText: 'Enter your Address 02',),
                            SizedBox(height: getVerticalSize(30),),
                            const AppTextField(hintText: 'City',),
                            SizedBox(height: getVerticalSize(30),),
                            Row(
                              children:  [
                                 const Expanded(child: AppTextField(hintText: 'State',)),
                                SizedBox(width: getHorizontalSize(50),),
                                const Expanded(child:  AppTextField(hintText: 'Zip Code',)),
                              ],
                            ),
                            SizedBox(height: getVerticalSize(30),),
                            AppTextField(hintText: 'SNN',),
                            Spacer(),
                            AppElevatedButton(buttonName: 'Next', onPressed: () {
                              Get.toNamed(AppRoutes.personalDetailScreen);
                            },),
                            SizedBox(height: getVerticalSize(36),),
                            Center(child: Container(height: getVerticalSize(4),
                              width: getHorizontalSize(106),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: ColorConstant.primaryAppTextF1),))

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
