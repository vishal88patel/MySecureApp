import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/link_bank_widget.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../../utils/ConstantsFiles/string_constants.dart';
import '../../utils/HelperFiles/ui_utils.dart';
import '../HomeScreen/controller/home_screen_controller.dart';
import 'controller/link_bank_list_screen_controller.dart';

class LinkBankListScreen extends StatelessWidget {
  var linkBankListController = Get.put(LinkBankListScreenController());
  var homeController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        MainCutomBackGround(
            child: Padding(
          padding: EdgeInsets.only(
              left: getHorizontalSize(20.0),
              right: getHorizontalSize(20.0),
              top: getVerticalSize(26)),
          child: SafeArea(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: ColorConstant.primaryWhite,
                            )),
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            'asset/icons/notification_icon.png',
                            height: getVerticalSize(20),
                            width: getHorizontalSize(16),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: getVerticalSize(25),
                    ),
                    Expanded(
                      child: ListView(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.toNamed(AppRoutes.bankListScreen);
                              },
                              child: const LinkBankWidget(
                                image: 'asset/green_image.png',
                                icon: 'asset/icons/go_link_icon.png',
                                image1: 'asset/rafiki_image.png',
                                title: 'Link Your Bank',
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                // if (homeController
                                //         .getLinkedBankModel.value.data!.length >
                                //     0) {
                                //   Get.toNamed(AppRoutes.cardDetailScreen);
                                // } else {
                                //   UIUtils.showSnakBar(
                                //     headerText: StringConstants.ERROR,
                                //     bodyText: "Please Link Bank First",
                                //   );
                                // }
                                Get.toNamed(AppRoutes.cardDetailScreen);
                              },
                              child: const LinkBankWidget(
                                image: 'asset/purple_image.png',
                                image1: 'asset/amico_image.png',
                                icon: 'asset/icons/go_link_icon.png',
                                title: 'Add Your \nCredit/Debit Card',
                              ),
                            ),
                            const LinkBankWidget(
                              image: 'asset/yellow_image.png',
                              icon: 'asset/icons/go_link_icon.png',
                              title: 'Add Your Wallet ',
                              image1: 'asset/pana_image.png',
                            ),
                          ]),
                    )
                  ],
                ),
              ],
            ),
          ),
        )),
      ],
    ));
  }
}
