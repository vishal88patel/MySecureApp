import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/Custom%20Widgets/profile_widget.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import 'controller/profile_screen_controller.dart';

class ProfileScreen extends StatelessWidget {
  var profileController = Get.put(ProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MainCutomBackGround(
            child: Padding(padding: EdgeInsets.symmetric(
                horizontal: getHorizontalSize(20.0),vertical:getVerticalSize(26)),
              child: SafeArea(
                child: Stack(
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.arrow_back, color: ColorConstant.primaryWhite,),
                        SizedBox(height: getVerticalSize(27),),
                        Center(
                          child: ClipRRect(borderRadius: BorderRadius.circular(100),
                            child: Container(
                              // height: getVerticalSize(30.8),width: getHorizontalSize(30.8),
                              color: ColorConstant.skyE8,
                              child: Padding(
                                padding: const EdgeInsets.all(1.8),
                                child: ClipRRect(borderRadius: BorderRadius.circular(100),
                                  child: Image.asset('asset/account_backgraund_image.png',fit: BoxFit.cover,
                                    height: getVerticalSize(73),width: getHorizontalSize(73),),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: getVerticalSize(15),),
                        Center(
                          child: Text("Hello Smith",
                            style: AppStyle.textStylePoppinsRegular
                                .copyWith(color: ColorConstant.primaryWhite,
                                fontWeight: FontWeight.w600,fontSize: getFontSize(24)),),
                        ),
                        SizedBox(height: getVerticalSize(30),),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: AppElevatedButton(buttonName: 'Invite Friends, Get \$10',
                           buttonColor: ColorConstant.skyE8,
                            onPressed: () {
                            Get.toNamed(AppRoutes.uploadDocument);

                          },),
                        ),
                        SizedBox(height: getVerticalSize(54),),
                        ProfileWidget(name: 'Personal Details',image: 'asset/icons/person_icon.png',onTap: (){
                          Get.toNamed(AppRoutes.userPersonalScreen);
                        }),
                        SizedBox(height: getVerticalSize(15),),
                        ProfileWidget(name: 'Privacy & Policy',image: 'asset/icons/privacy_icon.png',onTap: (){
                          Get.toNamed(AppRoutes.privacyPolicyScreen);
                        }),
                        SizedBox(height: getVerticalSize(15),),
                        ProfileWidget(name: 'Notifications',image: 'asset/icons/noti_icon.png',
                            onTap: (){
                              Get.toNamed(AppRoutes.loanStepScreen);
                            }),
                        SizedBox(height: getVerticalSize(15),),
                        ProfileWidget(name: 'Documents',image: 'asset/icons/document_icon.png',
                            onTap: (){
                              Get.toNamed(AppRoutes.uploadDocument);
                            }),
                        SizedBox(height: getVerticalSize(15),),
                        ProfileWidget(name: 'Support',image: 'asset/icons/support_icon.png',onTap: (){
                          Get.toNamed(AppRoutes.supportScreen);
                        },),
                        Spacer(),
                        AppElevatedButton(buttonName: 'Signout', onPressed: () {
                          profileController.showLogOutDialouge();
                          // Get.toNamed(AppRoutes.transactionScreen);

                        },),
                        SizedBox(height: getVerticalSize(40),),

                      ],
                    ),
                  ],
                ),
              ),
            ) ));
  }
}
