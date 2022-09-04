import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_secure_app/App%20Configurations/image_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../../App Configurations/color_constants.dart';
import 'controller/login_screen_controller.dart';

class LoginScreen extends StatelessWidget {
  var loginController = Get.find<LoginScreenController>();

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
                         Text("2/4",style: AppStyle.textStylePoppinsRegular
                             .copyWith(color: ColorConstant.primaryWhite),),
                            ],
                          ),
                       SizedBox(height: getVerticalSize(57),),
                       Text("Give us your \nEmail ID",style: AppStyle.textStylePoppinsRegular
                           .copyWith(color: ColorConstant.primaryWhite,
                           fontWeight: FontWeight.w700,fontSize: getFontSize(32)),),
                       SizedBox(height: getVerticalSize(5),),
                       Text("To apply, we need your Email ID linked to \nyour app",
                         style: AppStyle.textStylePoppinsRegular
                           .copyWith(color: ColorConstant.primaryAppTextF1,
                           fontWeight: FontWeight.w400,fontSize: getFontSize(16)),),
                       SizedBox(height: getVerticalSize(54),),
                       SizedBox(width: getHorizontalSize(229),
                           child: const AppTextField()),
                       Spacer(),
                      AppElevatedButton(buttonName: 'Continue with email',
                      onPressed: (){
                        Get.toNamed(AppRoutes.loginEmailScreen);
                      }),
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
