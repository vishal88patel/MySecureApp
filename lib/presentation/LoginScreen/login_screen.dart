import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_secure_app/App%20Configurations/image_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/theme/app_style.dart';

import '../../App Configurations/color_constants.dart';
import 'controller/login_screen_controller.dart';

class LoginScreen extends StatelessWidget {
  var loginController = Get.find<LoginScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        MainCutomBackGround(),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SafeArea(
                child: Row(
                   mainAxisAlignment : MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: ColorConstant.primaryWhite,
                    ),
                    Text(
                      "2/4",

                      style: AppStyle.textStylePoppinsRegular
                          .copyWith(color: ColorConstant.primaryWhite),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
