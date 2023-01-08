import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:secure_cash_app/App%20Configurations/color_constants.dart';
import 'package:secure_cash_app/presentation/HomeScreen/controller/home_screen_controller.dart';
import 'package:secure_cash_app/presentation/profileScreen/widget/profile_op_widget.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/common_utils.dart';
import 'package:swipe_deck/swipe_deck.dart';

import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../utils/HelperFiles/math_utils.dart';
import '../DashBoardScreen/controller/dashboard_screen_controller.dart';
import 'controller/profile_screen_controller.dart';

class ProfileScreen extends StatelessWidget {
  var homeController = Get.put(HomeScreenController());
  var profileScreenController = Get.put(ProfileScreenController());
  var dashBoardController = Get.find<DashBoardScreenController>();

  List<String> abc=["1","2","3"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: getVerticalSize(
                  530.00,
                ),
                width: size.width,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                      child: Image.asset(
                        "asset/icons/ic_noti_background.png",
                        width: MediaQuery.of(context).size.width,
                        height: getVerticalSize(
                          500.00,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "My Profile",
                                      style: AppStyle.DmSansFont.copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontSize: getFontSize(22),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(AppRoutes.qrCodeScreen,
                                            arguments: {
                                              'UUID_ID': homeController
                                                  .loginResponseModel!
                                                  .data!
                                                  .uuid!
                                                  .toString(),
                                            });
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: ColorConstant
                                                    .primaryAppTextF1,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SvgPicture.asset(
                                                "asset/icons/ic_scab.svg"),
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Obx(
                                        () => ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            getHorizontalSize(
                                              100.00,
                                            ),
                                          ),
                                          child: homeController
                                                      .profilePicture.value !=
                                                  null
                                              ? Image.network(
                                                  homeController
                                                      .profilePicture.value,
                                                  height: getSize(
                                                    130.00,
                                                  ),
                                                  width: getSize(
                                                    130.00,
                                                  ),
                                                  fit: BoxFit.cover,
                                                  loadingBuilder:
                                                      (BuildContext context,
                                                          Widget child,
                                                          ImageChunkEvent?
                                                              loadingProgress) {
                                                    if (loadingProgress == null)
                                                      return child;
                                                    return Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        value: loadingProgress
                                                                    .expectedTotalBytes !=
                                                                null
                                                            ? loadingProgress
                                                                    .cumulativeBytesLoaded /
                                                                loadingProgress
                                                                    .expectedTotalBytes!
                                                            : null,
                                                      ),
                                                    );
                                                  },
                                                )
                                              : Container(),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 24,
                                          bottom: 4,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              homeController
                                                  .homePageHeadeName.value,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style:
                                                  AppStyle.DmSansFont.copyWith(
                                                      color: ColorConstant
                                                          .primaryWhite,
                                                      fontSize: getFontSize(26),
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            if (homeController
                                                    .loginResponseModel!.data !=
                                                null)
                                              if (homeController
                                                      .loginResponseModel!
                                                      .data !=
                                                  null)
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                      top: 3,
                                                      right: 6,
                                                    ),
                                                    child: Text(
                                                      homeController
                                                              .loginResponseModel!
                                                              .data!
                                                              .email ??
                                                          '',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle.DmSansFont
                                                          .copyWith(
                                                              color: ColorConstant
                                                                  .primaryAppTextF1,
                                                              fontSize:
                                                                  getFontSize(
                                                                      18),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                    ),
                                                  ),
                                                ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        /*Card(
                          margin: const EdgeInsets.symmetric(horizontal: 0),
                          color: ColorConstant.naturalGrey2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: getHorizontalSize(270),
                                height: getVerticalSize(20),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          margin: const EdgeInsets.symmetric(horizontal: 0),
                          color: ColorConstant.brandYellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: getHorizontalSize(310),
                                height: getVerticalSize(20),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Card(
                            margin: const EdgeInsets.symmetric(horizontal: 0),
                            color: ColorConstant.primaryLightGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                            ),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap:(){
                            Get.toNamed(AppRoutes.showUserCardScreen);
                          },
                                  child: Container(
                                    width: getHorizontalSize(350),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: getHorizontalSize(20),
                                          right: getHorizontalSize(20),
                                          top: getVerticalSize(20)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Balance",
                                                style: AppStyle.textStyleDMSANS
                                                    .copyWith(
                                                        color: ColorConstant
                                                            .primaryWhite,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            getFontSize(16)),
                                              ),
                                              SvgPicture.asset(
                                                "asset/icons/ic_visa.svg",
                                                fit: BoxFit.fill,
                                              ),
                                            ],
                                          ),
                                          Obx(
                                            () => dashBoardController
                                                        .UserBalance.value ==
                                                    ""
                                                ? Container()
                                                : Text(
                                              NumberFormat.currency(name: '\$ ').format(int.parse(dashBoardController.UserBalance.value)),
                                                    style: AppStyle
                                                        .textStyleDMSANS
                                                        .copyWith(
                                                            color: ColorConstant
                                                                .primaryWhite,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize:
                                                                getFontSize(26)),
                                                  ),
                                          ),
                                          SizedBox(
                                            height: getHorizontalSize(8),
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                "asset/icons/ic_chip.svg",
                                                fit: BoxFit.fill,
                                              ),
                                              SizedBox(
                                                width: getHorizontalSize(12),
                                              ),
                                              Text(
                                                homeController.loginResponseModel!
                                                            .data !=
                                                        null
                                                    ? CommonUtils.FormatCardNumber(
                                                        homeController
                                                            .loginResponseModel!
                                                            .data!
                                                            .cardNumber
                                                            .toString())
                                                    : "",
                                                style: AppStyle.textStyleDMSANS
                                                    .copyWith(
                                                        color: ColorConstant
                                                            .primaryWhite,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            getFontSize(22)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),*/
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height:220,),
                            Obx(()=>Stack(alignment: Alignment.center, children:profileScreenController.cardList.value)),

                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: getVerticalSize(20),
                    left: getHorizontalSize(30),
                    right: getHorizontalSize(34)),
                child: Column(
                  children: [
                    ProfileOptionWidget(
                      onTap: () {
                        Get.toNamed(AppRoutes.profileDetailsScreen);
                      },
                      icon: "asset/icons/ic_profile_selected.svg",
                      title: 'Personal',
                    ),
                    ProfileOptionWidget(
                      onTap: () {
                        Get.toNamed(AppRoutes.linkCardBankScreen);
                      },
                      icon: "asset/icons/ic_licence_pass.svg",
                      title: 'Banking Details',
                    ),
                    ProfileOptionWidget(
                      onTap: () {
                        String webLink = profileScreenController
                            .loginResponseModel!.data!.privacyPolicy
                            .toString();
                        print("Webview Link in Daily Horoscope Page :- " +
                            webLink);
                        Get.toNamed(AppRoutes.webviewPage, arguments: {
                          "webLink": webLink,
                          "appBarName": "Privacy Policy",
                        });
                      },
                      icon: "asset/icons/ic_lock.svg",
                      title: 'Privacy & Security',
                    ),
                    ProfileOptionWidget(
                      onTap: () {showOfferComingDialouge();},
                      icon: "asset/icons/ic_offer.svg",
                      title: 'Offers & Rewards',
                    ),
                    ProfileOptionWidget(
                      onTap: () {
                        Get.toNamed(AppRoutes.supportScreen);
                      },
                      icon: "asset/icons/ic_helpp.svg",
                      title: 'Help',
                    ),
                    ProfileOptionWidget(
                      onTap: () {
                        profileScreenController.showLogOutDialouge();
                      },
                      icon: "asset/icons/ic_logoutt.svg",
                      title: 'Logout',
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
  Future<void> showOfferComingDialouge() async {
    return
      Get.dialog(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(60.0),
              vertical: getVerticalSize(340)),
          child: Wrap(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: ColorConstant.primaryWhite),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25)
                          ),
                          color: ColorConstant.greyF4,),

                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                    'asset/icons/done_image.png', height: 60),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    // Lottie.asset('asset/animations/welcome.json', height: 80),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text(
                              textAlign: TextAlign.center,
                              "Offer will be coming soon!!!",
                              style: AppStyle.DmSansFont.copyWith(
                                  color: ColorConstant.primaryBlack,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w400,
                                  fontSize: getFontSize(18)),
                            ),

                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: AppElevatedButton(
                        buttonName: 'Ok',
                        radius: 5,
                        textColor: Colors.white,
                        onPressed: () {
                          Get.back();
                          // Get.toNamed(AppRoutes.dashBoardScreen);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
        barrierDismissible: true,
      );
  }

}
