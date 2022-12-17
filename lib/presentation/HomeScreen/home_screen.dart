import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/presentation/HomeScreen/controller/home_screen_controller.dart';
import 'package:secure_cash_app/presentation/HomeScreen/widget/payment_list_widget.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:shimmer/shimmer.dart';

import '../../App Configurations/color_constants.dart';
import '../../theme/app_style.dart';
import '../../utils/HelperFiles/math_utils.dart';
import '../DashBoardScreen/controller/dashboard_screen_controller.dart';
import '../NotificationScreen/controller/notification_screen_controller.dart';
import '../ScanScreen/controller/scan_screen_controller.dart';
import '../BankScreen/bank_screen.dart';

class HomeScreen extends StatelessWidget {
  var homeController = Get.put(HomeScreenController());
  var notificationController = Get.find<NotificationScreenController>();
  var dashBoardController = Get.find<DashBoardScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: getVerticalSize(26),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: getHorizontalSize(22),
                          right: getHorizontalSize(22)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            "asset/icons/ic_app_logo.svg",
                            fit: BoxFit.fill,
                            height: getVerticalSize(42),
                          ),
                          Text(
                            " ",
                            style: AppStyle.textStyleDMSANS.copyWith(
                                color: ColorConstant.primaryWhite,
                                fontWeight: FontWeight.w700,
                                fontSize: getFontSize(24)),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.notificationScreen);
                            },
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                SvgPicture.asset(
                                  "asset/icons/ic_home_notification.svg",
                                  fit: BoxFit.fill,
                                  color: ColorConstant.primaryDarkGreen,
                                  height: getVerticalSize(30),
                                ),
                                Obx(
                                  () => notificationController
                                              .globalNotificationCount.value ==
                                          0
                                      ? Container()
                                      : Positioned(
                                          top: -10,
                                          right: -5,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                shape: BoxShape.circle),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(6.0),
                                              child: Obx(
                                                () => Text(
                                                  notificationController
                                                      .globalNotificationCount
                                                      .value
                                                      .toString(),
                                                  style: AppStyle.DmSansFont
                                                      .copyWith(
                                                          color: ColorConstant
                                                              .primaryWhite,
                                                          fontSize: 12),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getVerticalSize(28),
                    ),
                  ],
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
                                "Welcome to Mysecure App",
                                style: AppStyle.textStyleDMSANS.copyWith(
                                    color: ColorConstant.naturalGrey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: getFontSize(18)),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          Obx(
                            ()=> dashBoardController.UserBalance.value==""?Container():Text(
                              "\$${dashBoardController.UserBalance.value}",
                              style: AppStyle.DmSansFont.copyWith(
                                  color: ColorConstant.naturalBlack,
                                  fontWeight: FontWeight.w700,
                                  fontSize: getFontSize(22)),
                              overflow: TextOverflow.ellipsis,
                            ),
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
                            InkWell(
                              onTap:(){
                                Get.toNamed(AppRoutes.transferScreen);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "asset/icons/ic_transfer.svg",
                                    height: getVerticalSize(28),
                                    width: getVerticalSize(28),
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(
                                    height: getVerticalSize(10),
                                  ),
                                  Text(
                                    "Transfer",
                                    style: AppStyle.textStyleDMSANS.copyWith(
                                        color: ColorConstant.primaryWhite,
                                        fontWeight: FontWeight.w500,
                                        fontSize: getFontSize(16)),
                                  ),
                                ],
                              ),
                            ),
                            SvgPicture.asset(
                              "asset/icons/ic_divider.svg",
                              fit: BoxFit.fill,
                            ),
                            InkWell(
                              onTap: (){

                                Get.toNamed(AppRoutes.topWithCreditCardScreen);

                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "asset/icons/ic_topUp.svg",
                                    height: getVerticalSize(28),
                                    width: getVerticalSize(28),
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(
                                    height: getVerticalSize(10),
                                  ),
                                  Text(
                                    "Top Up",
                                    style: AppStyle.textStyleDMSANS.copyWith(
                                        color: ColorConstant.primaryWhite,
                                        fontWeight: FontWeight.w500,
                                        fontSize: getFontSize(16)),
                                  ),
                                ],
                              ),
                            ),
                            SvgPicture.asset(
                              "asset/icons/ic_divider.svg",
                              fit: BoxFit.fill,
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(AppRoutes.historyScreen);

                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "asset/icons/ic_history.svg",
                                    fit: BoxFit.fill,
                                    height: getVerticalSize(28),
                                    width: getVerticalSize(28),
                                  ),
                                  SizedBox(
                                    height: getVerticalSize(10),
                                  ),
                                  Text(
                                    "History",
                                    style: AppStyle.textStyleDMSANS.copyWith(
                                        color: ColorConstant.primaryWhite,
                                        fontWeight: FontWeight.w500,
                                        fontSize: getFontSize(16)),
                                  ),
                                ],
                              ),
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
                              iconName: 'asset/icons/ic_loan_home.png',
                              onTap: () {
                                // scanController. controller?.pauseCamera();
                                Get.toNamed(AppRoutes.loanApplyInfoScreen);
                              }),
                          PaymentListWidget(
                            title: 'Boost Credit Score',
                            iconName: 'asset/icons/ic_boost_home.png',
                            onTap: (){
                              Get.toNamed(AppRoutes.boostCreditScreen);
                            },
                          ),
                          PaymentListWidget(
                            title: 'Link Bank',
                            iconName: 'asset/icons/ic_link_bank_home.png',
                            onTap: (){
                              // Get.toNamed(AppRoutes.myLinkedBankListScreen);
                              Get.toNamed(AppRoutes.bankScreen);
                            },
                          ),
                          PaymentListWidget(
                              title: 'Link Card',
                              iconName: 'asset/icons/ic_link_card_home.png',
                              onTap: () {
                                Get.toNamed(AppRoutes.linkCardAddCardScreen);

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
                              homeController.isVerified=="0"?
                              Get.toNamed(AppRoutes.kycEmailScreen):Get.toNamed(AppRoutes.kycSelectStepScreen);
                            },
                            child: PaymentListWidget(
                              title: 'Identity Verification',
                              iconName: 'asset/icons/ic_kyc_home.png',
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Get.toNamed(AppRoutes.cashCardScreen);
                            },
                            child: PaymentListWidget(
                              title: 'Cash Card',
                              iconName: 'asset/icons/ic_cash_card_home.png',
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Get.toNamed(AppRoutes.cashoutAmountScreen);
                            },
                            child: PaymentListWidget(
                              title: 'Cash Out',
                              iconName: 'asset/icons/ic_cash_out_home.png',
                            ),
                          ),
                          PaymentListWidget(onTap: (){
                            //Get.toNamed(AppRoutes.instructionScreens);
                             Get.toNamed(AppRoutes.chatScreen);
                          },
                            title: 'Live Chat',
                            iconName: 'asset/icons/ic_live_chat_home.png',
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
                Obx(
                  () => homeController.homeModel.value.data != null
                      ? SizedBox(
                          height: getVerticalSize(180),
                          child: ListView.builder(
                              padding: EdgeInsets.only(
                                  left: getHorizontalSize(18),
                                  right: getHorizontalSize(20)),
                              scrollDirection: Axis.horizontal,
                              itemCount: homeController
                                  .homeModel.value.data!.topOffer!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Obx(
                                  () => Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image.network(
                                        homeController.homeModel.value.data!
                                            .topOffer![index],
                                        width: getHorizontalSize(360),
                                        height: getVerticalSize(180),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        )
                      : SizedBox(
                          height: getVerticalSize(200),
                          child: ListView.builder(
                              padding: EdgeInsets.only(
                                  left: getHorizontalSize(18),
                                  right: getHorizontalSize(20)),
                              scrollDirection: Axis.horizontal,
                              itemCount: 2,
                              itemBuilder: (BuildContext context, int index) {
                                return Shimmer.fromColors(
                                  baseColor: ColorConstant.shimmerBaseColor,
                                  highlightColor:
                                      ColorConstant.shimmerHighlightColor,
                                  direction: ShimmerDirection.ttb,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 14),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: ColorConstant.shimmerHighlightColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      width: getHorizontalSize(360),
                                    ),
                                  ),
                                );
                              }),
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
