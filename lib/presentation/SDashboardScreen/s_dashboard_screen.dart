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
import 'package:my_secure_app/presentation/SDashboardScreen/controller/s_dashboard_screen_controller.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

class SDashBoardScreen extends StatelessWidget {
  var sDashBoardController = Get.put(SDashBoardScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        MainCutomBackGround(
            child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getHorizontalSize(25.0),
              vertical: getVerticalSize(26)),
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
                            Text(
                              "ABC Bank ",
                              style: AppStyle.textStylePoppinsRegular.copyWith(
                                  color: ColorConstant.primaryWhite,
                                  fontWeight: FontWeight.w600,
                                  fontSize: getFontSize(24)),
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
                      onTap: (){ Get.toNamed(AppRoutes.linkBankListScreen);
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
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset('asset/baner_image.png')),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    'asset/offer_image.png',
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
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: getFontSize(10)),
                                        ),
                                        SizedBox(
                                          height: getVerticalSize(10),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              color: Colors.black),
                                          padding: EdgeInsets.symmetric(
                                              vertical: getVerticalSize(4),
                                              horizontal:
                                                  getHorizontalSize(15)),
                                          child: Text(
                                            "Explore",
                                            style: AppStyle
                                                .textStylePoppinsRegular
                                                .copyWith(
                                                    color: ColorConstant
                                                        .primaryWhite,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: getFontSize(6)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
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
                                  Image.asset(
                                    'asset/offer_image.png',
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
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: getFontSize(10)),
                                        ),
                                        SizedBox(
                                          height: getVerticalSize(10),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              color: Colors.black),
                                          padding: EdgeInsets.symmetric(
                                              vertical: getVerticalSize(4),
                                              horizontal:
                                                  getHorizontalSize(15)),
                                          child: Text(
                                            "Explore",
                                            style: AppStyle
                                                .textStylePoppinsRegular
                                                .copyWith(
                                                    color: ColorConstant
                                                        .primaryWhite,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: getFontSize(6)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                            )),
                          ],
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
