import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/Custom%20Widgets/profile_widget.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../ProfileScreen/controller/profile_screen_controller.dart';
import 'controller/user_personal_screen_controller.dart';

class UserPersonalScreen extends StatelessWidget {
  var userPersonalController = Get.find<UserPersonalScreenController>();
  var profileController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MainCutomBackGround(
            child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getHorizontalSize(20.0), vertical: getVerticalSize(26)),
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: ColorConstant.primaryWhite,
                        )),
                  ],
                ),
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
                  width: getHorizontalSize(18),
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
                SizedBox(
                  height: getVerticalSize(54),
                ),
                ProfileWidget(
                    name: 'Personal Details',
                    image: 'asset/icons/person_icon.png',
                    onTap: () {
                      // Get.toNamed(AppRoutes.myLinkedBankListScreen);
                    }),
                SizedBox(
                  height: getVerticalSize(15),
                ),
                ProfileWidget(
                  name: 'My Banks',
                  image: 'asset/icons/my_bank_icon.png',
                  onTap: (){
                    Get.toNamed(AppRoutes.myLinkedBankListScreen);
                  },
                ),
                SizedBox(
                  height: getVerticalSize(15),
                ),
                ProfileWidget(
                  name: 'My Card',
                  image: 'asset/icons/my_card_icon.png',
                  onTap: (){
                    Get.toNamed(AppRoutes.cardListScreen);
                  },
                ),
                SizedBox(
                  height: getVerticalSize(15),
                ),
                ProfileWidget(
                  name: 'My Wallet ',
                  image: 'asset/icons/my_wallet_icon.png',
                  onTap: (){
                    Get.toNamed(AppRoutes.transactionScreen);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    )));
  }
}
