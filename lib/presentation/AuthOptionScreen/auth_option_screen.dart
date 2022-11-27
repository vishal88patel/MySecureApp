import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/routes/app_routes.dart';

import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../theme/app_style.dart';
import '../../utils/HelperFiles/math_utils.dart';
import 'controller/auth_option_screen_controller.dart';

class AuthOptionScreen extends StatelessWidget {
  var authOptionContoller = Get.find<AuthOptionScreenController>();

  @override
  Widget build(BuildContext context) {
    // PrefUtils.setString(StringConstants.IS_KYC_DONE,"1");
    return Scaffold(
      backgroundColor: ColorConstant.primaryDarkGreen,
      body: Column(
        children: [
          Image.asset(
            "asset/icons/ic_sign_up_option.png",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Expanded(
              child: Container(
            width: MediaQuery.of(context).size.width,
            color: ColorConstant.primaryDarkGreen,
            child: Column(
              children: [
                Text(
                  "A new way to pay anything more faster",
                  textAlign: TextAlign.center,
                  style: AppStyle.textStyleDMSANS.copyWith(
                      color: ColorConstant.primaryWhite,
                      fontWeight: FontWeight.w700,
                      fontSize: getFontSize(36)),
                ),
                SizedBox(height: 12,),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: AppElevatedButton(
                    buttonName: "Login",
                    textColor: Colors.white,
                    buttonColor: ColorConstant.primaryLightGreen,
                    radius: 16,
                    onPressed: () {
                      Get.toNamed(AppRoutes.loginScreen);
                    },
                  ),
                ),
                TextButton(
                  onPressed: (){
                    Get.toNamed(AppRoutes.loginScreen);
                  },
                  child: Text("Sign Up",style:  AppStyle.DmSansFont
                      .copyWith(color:Colors.white,
                      fontWeight: FontWeight.w500,fontSize: getFontSize(20)),),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
