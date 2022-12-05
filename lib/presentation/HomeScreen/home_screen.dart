import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/presentation/HomeScreen/controller/home_screen_controller.dart';
import 'package:my_secure_app/presentation/HomeScreen/widget/payment_list_widget.dart';
import 'package:my_secure_app/routes/app_routes.dart';

import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_AppBar .dart';
import '../../theme/app_style.dart';
import '../../utils/HelperFiles/math_utils.dart';
import '../DashBoardScreen/controller/dashboard_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  var homeController = Get.put(HomeScreenController());
  var dashBoardController = Get.find<DashBoardScreenController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getVerticalSize(16),
                ),
                AppAppBar(
                  title: " ",
                  icon1: "asset/icons/ic_app_logo.svg",
                  icon2: "asset/icons/ic_notification.svg",
                  onPressedIcon1: () {
                    Get.back();
                  },
                  onPressedIcon2: () {
                    Get.toNamed(AppRoutes.notificationScreen);
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: getHorizontalSize(20),
                      right: getHorizontalSize(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(
                                () => Text(
                                  "Hello ${homeController.homePageHeadeName.value}",
                                  style: AppStyle.textStyleDMSANS.copyWith(
                                      color: ColorConstant.naturalBlack,
                                      fontWeight: FontWeight.w700,
                                      fontSize: getFontSize(22)),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                "Welcome to MySecureApp",
                                style: AppStyle.textStyleDMSANS.copyWith(
                                    color: ColorConstant.naturalGrey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: getFontSize(18)),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          Text(
                            "\$15,901",
                            style: AppStyle.DmSansFont.copyWith(
                                color: ColorConstant.naturalBlack,
                                fontWeight: FontWeight.w700,
                                fontSize: getFontSize(22)),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getVerticalSize(30),
                      ),
                      Container(
                        height: getVerticalSize(100),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: ColorConstant.primaryLightGreen,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "asset/icons/ic_transfer.svg",
                                  fit: BoxFit.fill,
                                ),
                                Text(
                                  "Transfer",
                                  style: AppStyle.textStyleDMSANS.copyWith(
                                      color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w500,
                                      fontSize: getFontSize(18)),
                                ),
                              ],
                            ),
                            SvgPicture.asset(
                              "asset/icons/ic_divider.svg",
                              fit: BoxFit.fill,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "asset/icons/ic_topUp.svg",
                                  fit: BoxFit.fill,
                                ),
                                Text(
                                  "Top Up",
                                  style: AppStyle.textStyleDMSANS.copyWith(
                                      color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w500,
                                      fontSize: getFontSize(18)),
                                ),
                              ],
                            ),
                            SvgPicture.asset(
                              "asset/icons/ic_divider.svg",
                              fit: BoxFit.fill,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "asset/icons/ic_history.svg",
                                  fit: BoxFit.fill,
                                ),
                                Text(
                                  "History",
                                  style: AppStyle.textStyleDMSANS.copyWith(
                                      color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w500,
                                      fontSize: getFontSize(18)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getVerticalSize(30),
                      ),
                      Text(
                        "Payment List",
                        style: AppStyle.textStyleDMSANS.copyWith(
                            color: ColorConstant.naturalBlack,
                            fontWeight: FontWeight.w700,
                            fontSize: getFontSize(22)),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: getVerticalSize(30),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PaymentListWidget(
                              title: 'Apply For Loan',
                              iconName: 'asset/icons/EXE_Icon.png',
                              onTap: () {
                                Get.toNamed(AppRoutes.loanApplyInfoScreen);
                              }),
                          PaymentListWidget(
                            title: 'Boost Credit Score',
                            iconName: 'asset/icons/EXE_Icon.png',
                          ),
                          PaymentListWidget(
                            title: 'Link Bank',
                            iconName: 'asset/icons/EXE_Icon.png',
                          ),
                          PaymentListWidget(
                              title: 'Link Card',
                              iconName: 'asset/icons/EXE_Icon.png',
                              onTap: () {
                                Get.toNamed(AppRoutes.topAddCard1Screen);
                              }),
                        ],
                      ),
                      SizedBox(
                        height: getVerticalSize(15),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.kycSelectStepScreen);
                            },
                            child: PaymentListWidget(
                              title: 'Kyc',
                              iconName: 'asset/icons/EXE_Icon.png',
                            ),
                          ),
                          PaymentListWidget(
                            title: 'Cash Card',
                            iconName: 'asset/icons/EXE_Icon.png',
                          ),
                          PaymentListWidget(
                            title: 'Cash Out',
                            iconName: 'asset/icons/EXE_Icon.png',
                          ),
                          PaymentListWidget(
                            title: 'Live Chat',
                            iconName: 'asset/icons/EXE_Icon.png',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getVerticalSize(10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Promo & Discount",
                            style: AppStyle.textStyleDMSANS.copyWith(
                                color: ColorConstant.naturalBlack,
                                fontWeight: FontWeight.w700,
                                fontSize: getFontSize(22)),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "See More",
                            style: AppStyle.textStyleDMSANS.copyWith(
                                color: ColorConstant.primaryLightGreen,
                                fontWeight: FontWeight.w700,
                                fontSize: getFontSize(18)),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getVerticalSize(30),
                      ),
                      /*Container(
                    height: size.height / 6.5,
                    child: Obx(() => homeController.homeModel.value.data != null
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
                                          Radius.circular(getHorizontalSize(15))),
                                      child: Image.network(
                                        homeController.homeModel.value.data!
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
                                  baseColor: ColorConstant.shimmerBaseColor,
                                  highlightColor:
                                      ColorConstant.shimmerHighlightColor,
                                  child: Container(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: getHorizontalSize(10)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                getHorizontalSize(15))),
                                        child: Container(
                                          height: getVerticalSize(350),
                                          color: ColorConstant.primaryWhite,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Shimmer.fromColors(
                                  baseColor: ColorConstant.shimmerBaseColor,
                                  highlightColor:
                                      ColorConstant.shimmerHighlightColor,
                                  child: Container(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: getHorizontalSize(10)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                getHorizontalSize(15))),
                                        child: Container(
                                          height: getVerticalSize(350),
                                          color: ColorConstant.primaryWhite,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                  ),*/
                    ],
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(200),
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: getHorizontalSize(20),
                      ),
                      Stack(
                        children: [
                          Image.asset(
                            'asset/icons/banner.png',
                            width: getHorizontalSize(360),
                          ),
                          Positioned(
                            top: getVerticalSize(20),
                            left: getHorizontalSize(40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "30% OFF",
                                  style: AppStyle.DmSansFont.copyWith(
                                      color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w700,
                                      fontSize: getFontSize(20)),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "Black Friday deal",
                                  style: AppStyle.DmSansFont.copyWith(
                                      color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w700,
                                      fontSize: getFontSize(24)),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                SizedBox(
                                  height: getVerticalSize(50),
                                ),
                                Text(
                                  "Get discount for every topup, \ntransfer and payment",
                                  style: AppStyle.DmSansFont.copyWith(
                                      color: ColorConstant.greyBD,
                                      fontWeight: FontWeight.w700,
                                      fontSize: getFontSize(16)),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: getHorizontalSize(20),
                      ),
                      Stack(
                        children: [
                          Image.asset(
                            'asset/icons/Card.png',
                            width: getHorizontalSize(360),
                          ),
                          Positioned(
                            top: getVerticalSize(20),
                            left: getHorizontalSize(40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "30% OFF",
                                  style: AppStyle.DmSansFont.copyWith(
                                      color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w700,
                                      fontSize: getFontSize(20)),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "Black Friday deal",
                                  style: AppStyle.DmSansFont.copyWith(
                                      color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w700,
                                      fontSize: getFontSize(24)),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                SizedBox(
                                  height: getVerticalSize(50),
                                ),
                                Text(
                                  "Get discount for every topup, \ntransfer and payment",
                                  style: AppStyle.DmSansFont.copyWith(
                                      color: ColorConstant.greyBD,
                                      fontWeight: FontWeight.w700,
                                      fontSize: getFontSize(16)),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(50),
                ),
              ],
            ),
          ),
        ));
  }
}
