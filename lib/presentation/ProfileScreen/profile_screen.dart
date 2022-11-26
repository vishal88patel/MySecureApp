import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/Custom%20Widgets/profile_widget.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';
import 'package:my_secure_app/utils/HelperFiles/ui_utils.dart';

import '../../utils/ConstantsFiles/string_constants.dart';
import 'controller/profile_screen_controller.dart';

class ProfileScreen extends StatelessWidget {
  var profileController = Get.put(ProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MainCutomBackGround(
            child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getHorizontalSize(20.0), vertical: getVerticalSize(20)),
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getVerticalSize(27),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      // onTap: (){ Get.toNamed(AppRoutes.cardDetailScreen);
                      // },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          height: getVerticalSize(100),
                          width: getHorizontalSize(100),
                          color: ColorConstant.primaryWhite,
                          child: Padding(
                              padding: const EdgeInsets.all(0.5),
                              child: Obx(
                                () => CachedNetworkImage(
                                  imageUrl:
                                      profileController.profilePicture.value,
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(
                                          color: ColorConstant.skyE8),
                                  errorWidget: (context, url, error) =>
                                      new Icon(Icons.error),
                                ),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: getHorizontalSize(11),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => Text(
                        profileController.homePageHeadeName.value,
                        style: AppStyle.textStylePoppinsRegular.copyWith(
                            color: ColorConstant.primaryWhite,
                            fontWeight: FontWeight.w600,
                            fontSize: getFontSize(24)),
                      ),
                    ),
                  ],
                ),
               /* SizedBox(
                  height: getVerticalSize(30),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AppElevatedButton(
                    buttonName: 'Invite Friends, Get \$10',
                    buttonColor: ColorConstant.skyE8,
                    onPressed: () {
                      Get.toNamed(AppRoutes.uploadDocument1);
                    },
                  ),
                ),*/
                SizedBox(
                  height: getVerticalSize(54),
                ),
                ProfileWidget(
                    name: 'Personal Details',
                    image: 'asset/icons/person_icon.png',
                    onTap: () {
                      Get.toNamed(AppRoutes.userPersonalScreen);

                    }),
                SizedBox(
                  height: getVerticalSize(15),
                ),
                ProfileWidget(
                  name: 'Banking Details',
                  image: 'asset/icons/ic_link.png',
                  onTap: (){
                    Get.toNamed(AppRoutes.myLinkedBankListScreen);
                  },
                ),
                SizedBox(
                  height: getVerticalSize(15),
                ),
                ProfileWidget(
                    name: 'Privacy & Policy',
                    image: 'asset/icons/privacy_icon.png',
                    onTap: () {
                      // Get.toNamed(AppRoutes.privacyPolicyScreen);
                      String webLink =
                          profileController.loginResponseModel!.data!.privacyPolicy.toString();
                      print(
                          "Webview Link in Daily Horoscope Page :- " + webLink);
                      Get.toNamed(AppRoutes.webviewPage, arguments: {
                        "webLink": webLink,
                        "appBarName": "Privacy Policy",
                      });
                    }),
                SizedBox(
                  height: getVerticalSize(15),
                ),
                ProfileWidget(
                    name: 'Notifications',
                    image: 'asset/icons/noti_icon.png',
                    onTap: () {
                      Get.toNamed(AppRoutes.notificationScreen);
                    }),
                SizedBox(
                  height: getVerticalSize(15),
                ),
                ProfileWidget(
                    name: 'KYC',
                    image: 'asset/icons/document_icon.png',
                    onTap: () {
                      Get.toNamed(AppRoutes.kvcPhoneNumber);

                      // Get.toNamed(AppRoutes.uploadDocument1);
                    }),
                SizedBox(
                  height: getVerticalSize(15),
                ),
                ProfileWidget(
                  name: 'Support',
                  image: 'asset/icons/support_icon.png',
                  onTap: () {
                    Get.toNamed(AppRoutes.supportScreen);
                  },
                ),

                Spacer(),
                AppElevatedButton(
                  buttonName: 'Signout',
                  onPressed: () {
                    profileController.showLogOutDialouge();
                    // Get.toNamed(AppRoutes.transactionScreen);
                  },
                ),
                SizedBox(
                  height: getVerticalSize(40),
                ),
              ],
            ),
          ],
        ),
      ),
    )));
  }
}
