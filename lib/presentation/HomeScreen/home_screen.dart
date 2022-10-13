import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/dashboard_widget.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/presentation/HomeScreen/controller/home_screen_controller.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';
import 'package:shimmer/shimmer.dart';

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
                    physics: BouncingScrollPhysics(),
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
                              onTap: () {},
                            ),
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                DashboardWidget(
                                  image: 'asset/purple_card_image.png',
                                  icon: 'asset/icons/bank_icon.png',
                                  title: '         Link Bank         ',
                                  onTap: () {
                                    Get.offAllNamed(AppRoutes.dashBoardScreen,
                                        arguments: {"bottomTabCount": 2});
                                  },
                                ),
                                Obx(
                                  ()=> homeController.getLinkedBankModel
                                      .value.data !=
                                      null
                                      && homeController
                                      .getLinkedBankModel
                                      .value
                                      .data!
                                      .length>=0
                                      ?Positioned(
                                    right: 0,
                                    top: -10,
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle),
                                      child: Obx(() => Center(
                                            child: Text(
                                              homeController.getLinkedBankModel
                                                          .value !=
                                                      null
                                                  ? homeController
                                                      .getLinkedBankModel
                                                      .value
                                                      .data!
                                                      .length
                                                      .toString()
                                                  : "",
                                              style:
                                                  TextStyle(color: Colors.white),
                                            ),
                                          )),
                                    ),
                                  ):Container(),
                                )
                              ],
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
                              onTap: () {},
                            ),
                            DashboardWidget(
                              image: 'asset/sky_card_image.png',
                              icon: 'asset/icons/bush_icon.png',
                              title: 'Boost Cibil Score',
                              onTap: () {},
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
                                    .homeModel.value.data!.bannerImage
                                    .toString()))
                            : Shimmer.fromColors(
                                baseColor: ColorConstant.shimmerBaseColor,
                                highlightColor:
                                    ColorConstant.shimmerHighlightColor,
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
                        Container(
                          height: size.height / 6.5,
                          child: Obx(() => homeController
                                      .homeModel.value.data !=
                                  null
                              ? SizedBox(
                                  height: getVerticalSize(135),
                                  child: ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    itemCount: homeController
                                        .homeModel.value.data!.topOffer!.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, pagePosition) {
                                      return GestureDetector(
                                        onTap: () async {},
                                        child: Container(
                                          width: size.width / 2,
                                          padding: EdgeInsets.only(right: 16),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    getHorizontalSize(15))),
                                            child: Image.network(
                                              homeController
                                                  .homeModel
                                                  .value
                                                  .data!
                                                  .topOffer![pagePosition],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : Row(
                                  children: [
                                    Expanded(
                                      child: Shimmer.fromColors(
                                        baseColor:
                                            ColorConstant.shimmerBaseColor,
                                        highlightColor:
                                            ColorConstant.shimmerHighlightColor,
                                        child: Container(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    getHorizontalSize(10)),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      getHorizontalSize(15))),
                                              child: Container(
                                                height: getVerticalSize(350),
                                                color:
                                                    ColorConstant.primaryWhite,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Shimmer.fromColors(
                                        baseColor:
                                            ColorConstant.shimmerBaseColor,
                                        highlightColor:
                                            ColorConstant.shimmerHighlightColor,
                                        child: Container(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    getHorizontalSize(10)),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      getHorizontalSize(15))),
                                              child: Container(
                                                height: getVerticalSize(350),
                                                color:
                                                    ColorConstant.primaryWhite,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
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
