import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/presentation/HomeScreen/controller/home_screen_controller.dart';
import 'package:shimmer/shimmer.dart';

import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_AppBar .dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../theme/app_style.dart';
import '../../utils/HelperFiles/math_utils.dart';

class HomeScreen extends StatelessWidget {
  var homeController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getVerticalSize(16),
          ),
          AppAppBar(
            title: " ",
            icon1: "asset/icons/ic_app_logo.svg",
            icon2: "asset/icons/ic_setting_black.svg",
            onPressedIcon1: () {
              Get.back();
            },
            onPressedIcon2: () {},
          ),
          Padding(
            padding: EdgeInsets.only(
                left: getHorizontalSize(20), right: getHorizontalSize(20)),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello User",
                          style: AppStyle.textStyleDMSANS.copyWith(
                              color: ColorConstant.naturalBlack,
                              fontWeight: FontWeight.w700,
                              fontSize: getFontSize(22)),
                          overflow: TextOverflow.ellipsis,
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
          )
        ],
      ),
    ));
  }
}
