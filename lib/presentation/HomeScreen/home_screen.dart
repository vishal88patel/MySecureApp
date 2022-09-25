import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textFormField_fill.dart';
import 'package:my_secure_app/Custom%20Widgets/dashboard_widget.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/presentation/BankDetailScreen/controller/bank_detail_screen_controller.dart';
import 'package:my_secure_app/presentation/CardDetailScreen/controller/card_detail_screen_controller.dart';
import 'package:my_secure_app/presentation/PersonalDetails/controller/personal_detail_screen_controller.dart';
import 'package:my_secure_app/presentation/HomeScreen/controller/home_screen_controller.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';
import 'package:shimmer/shimmer.dart';

import 'controller/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
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
              top: getVerticalSize(15)),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          // onTap: (){ Get.toNamed(AppRoutes.cardDetailScreen);
                          // },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              height: getVerticalSize(45),
                              width: getHorizontalSize(45),
                              color: ColorConstant.primaryWhite,
                              child: Padding(
                                padding: const EdgeInsets.all(0.5),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(
                                    'asset/card_image.png',
                                    fit: BoxFit.cover,
                                    height: getVerticalSize(30.8),
                                    width: getHorizontalSize(30.8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: getHorizontalSize(11),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => Text(
                                homeController.homePageHeadeName.value,
                                style: AppStyle.textStylePoppinsRegular
                                    .copyWith(
                                        color: ColorConstant.primaryWhite,
                                        fontWeight: FontWeight.w600,
                                        fontSize: getFontSize(24)),
                              ),
                            ),
                            Text(
                              "Welcome back",
                              style: AppStyle.textStylePoppinsRegular.copyWith(
                                  color: ColorConstant.primaryWhite,
                                  fontWeight: FontWeight.w300,
                                  fontSize: getFontSize(13)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.linkBankListScreen);
                      },
                      child: Image.asset(
                        'asset/icons/notification_icon.png',
                        fit: BoxFit.cover,
                        height: getVerticalSize(20),
                        width: getHorizontalSize(16),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: getVerticalSize(40),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DashboardWidget(
                              image: 'asset/blue_card_image.png',
                              icon: 'asset/icons/walle_tbalance.png',
                              title: 'Wallet Balance',
                            ),
                            DashboardWidget(
                              image: 'asset/purple_card_image.png',
                              icon: 'asset/icons/bank_icon.png',
                              title: '         Link Bank         ',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getVerticalSize(25),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DashboardWidget(
                              image: 'asset/orange_card_image.png',
                              icon: 'asset/icons/apply_loan_icon (2).png',
                              title: 'Apply for Loan',
                            ),
                            DashboardWidget(
                              image: 'asset/sky_card_image.png',
                              icon: 'asset/icons/bush_icon.png',
                              title: 'Boost Cibil Score',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getVerticalSize(25),
                        ),
                        Obx(() => homeController.homeModel.value.data != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(homeController
                                    .homeModel.value.data!.homeImage1
                                    .toString()))
                            : Shimmer.fromColors(
                                baseColor: ColorConstant.shimmerBaseColor,
                                highlightColor: ColorConstant.shimmerHighlightColor,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ColorConstant.appProgressBarColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.0),
                                    ),
                                  ),
                                  height: 100,
                                  width: size.width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              )),
                        SizedBox(
                          height: getVerticalSize(10),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Top Offer",
                              style: AppStyle.textStylePoppinsRegular.copyWith(
                                  color: ColorConstant.primaryWhite,
                                  fontWeight: FontWeight.w600,
                                  fontSize: getFontSize(12)),
                            ),
                            Text(
                              "View All",
                              style: AppStyle.textStylePoppinsRegular.copyWith(
                                  color: ColorConstant.primaryWhite,
                                  fontWeight: FontWeight.w400,
                                  fontSize: getFontSize(12)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getVerticalSize(10),
                        ),
                        Obx(
                          () => homeController.homeModel.value.data != null
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Stack(
                                        children: [
                                          Image.network(
                                            homeController.homeModel.value.data!
                                                .homeImage2
                                                .toString(),
                                            height: getVerticalSize(100),
                                            fit: BoxFit.cover,
                                          ),
                                          // Positioned(
                                          //     child: Padding(
                                          //   padding: const EdgeInsets.all(12.0),
                                          //   child: Column(
                                          //     crossAxisAlignment:
                                          //         CrossAxisAlignment.start,
                                          //     children: [
                                          //       Text(
                                          //         "Top Offer on \nMy Secure Pay",
                                          //         style: AppStyle
                                          //             .textStylePoppinsRegular
                                          //             .copyWith(
                                          //                 fontWeight: FontWeight.w500,
                                          //                 fontSize: getFontSize(10)),
                                          //       ),
                                          //       SizedBox(
                                          //         height: getVerticalSize(10),
                                          //       ),
                                          //       Container(
                                          //         decoration: BoxDecoration(
                                          //             borderRadius:
                                          //                 BorderRadius.circular(3),
                                          //             color: Colors.black),
                                          //         padding: EdgeInsets.symmetric(
                                          //             vertical: getVerticalSize(4),
                                          //             horizontal:
                                          //                 getHorizontalSize(15)),
                                          //         child: Text(
                                          //           "Explore",
                                          //           style: AppStyle
                                          //               .textStylePoppinsRegular
                                          //               .copyWith(
                                          //                   color: ColorConstant
                                          //                       .primaryWhite,
                                          //                   fontWeight: FontWeight.w400,
                                          //                   fontSize: getFontSize(6)),
                                          //         ),
                                          //       ),
                                          //     ],
                                          //   ),
                                          // ))
                                        ],
                                      ),
                                    )),
                                    SizedBox(
                                      width: getHorizontalSize(17),
                                    ),
                                    Expanded(
                                        child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Stack(
                                        children: [
                                          Image.network(
                                            homeController.homeModel.value.data!
                                                .homeImage3
                                                .toString(),
                                            height: getVerticalSize(100),
                                            fit: BoxFit.cover,
                                          ),
                                          Positioned(
                                              child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Top Offer on \nMy Secure Pay",
                                                  style: AppStyle
                                                      .textStylePoppinsRegular
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize:
                                                              getFontSize(10)),
                                                ),
                                                SizedBox(
                                                  height: getVerticalSize(10),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3),
                                                      color: Colors.black),
                                                  padding: EdgeInsets.symmetric(
                                                      vertical:
                                                          getVerticalSize(4),
                                                      horizontal:
                                                          getHorizontalSize(
                                                              15)),
                                                  child: Text(
                                                    "Explore",
                                                    style: AppStyle
                                                        .textStylePoppinsRegular
                                                        .copyWith(
                                                            color: ColorConstant
                                                                .primaryWhite,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize:
                                                                getFontSize(6)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ))
                                        ],
                                      ),
                                    )),
                                  ],
                                )
                              : Container(
                                  child: CircularProgressIndicator(
                                    color: ColorConstant.skyE8,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
      ],
    ));
  }
}
