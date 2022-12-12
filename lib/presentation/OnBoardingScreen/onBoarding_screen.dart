import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/presentation/OnBoardingScreen/onBoarding_content.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../theme/app_style.dart';
import 'controller/onboarding_screen_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  var onBoardingController = Get.find<OnBoardingScreenController>();

  List<Map<String, String>> onBoardingData = [
    {"image": "asset/icons/onBoarding11.png"},
    {"image": "asset/icons/onBoarding22.png"},
    {"image": "asset/icons/onBoarding33.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.primaryWhite,
        body: Column(
          children: [
            SizedBox(
              height: getVerticalSize(60),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      right: getHorizontalSize(16), top: getVerticalSize(20)),
                  child: InkWell(
                    onTap: () {
                      onBoardingController.onTapOfGetStartedButton();
                    },
                    child: Text(
                      "Skip",
                      style: AppStyle.textStyleDMSANS.copyWith(
                          color: ColorConstant.naturalGrey4,
                          fontWeight: FontWeight.w500,
                          fontSize: getFontSize(20)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getVerticalSize(20),
            ),
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  onBoardingController.currentPage.value = value;
                  print(onBoardingController.currentPage.value);
                },
                controller: onBoardingController.pageController,
                itemCount: onBoardingData.length,
                itemBuilder: (context, index) => OnBoardingContent(
                  image: onBoardingData[index]["image"],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onBoardingData.length,
                      (index) => buildDot(index: index),
                    ),
                  ),
                  SizedBox(
                    height: getVerticalSize(36),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: getHorizontalSize(20),
                          right: getHorizontalSize(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 20,
                          ),
                          Obx(
                            () => Text(
                              onBoardingController.currentPage.value == 1
                                  ? "Scan & Pay"
                                  : onBoardingController.currentPage.value == 2
                                      ? "Pay Anything"
                                      : "Loan",
                              style: AppStyle.textStyleDMSANS.copyWith(
                                  color: ColorConstant.naturalBlack,
                                  fontWeight: FontWeight.w700,
                                  fontSize: getFontSize(32)),
                            ),
                          ),
                          SizedBox(
                            height: getVerticalSize(10),
                          ),
                          Obx(
                            () => Text(
                              onBoardingController.currentPage.value == 1
                                  ? "Makes easier for users to pay for their purchases by scanning the QR code"
                                  : onBoardingController.currentPage.value == 2
                                      ? "Supports many types of payments and pay without being complicated"
                                      : "Making it easier for users to make an informed decision about their loan",
                              textAlign: TextAlign.center,
                              style: AppStyle.textStyleDMSANS.copyWith(
                                  color: ColorConstant.naturalGrey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: getFontSize(22)),
                            ),
                          ),
                          Spacer(),
                          Obx(
                            () => AppElevatedButton(
                              buttonName:
                                  onBoardingController.currentPage.value == 2
                                      ? "Get Started"
                                      : "Next",
                              textColor: Colors.white,
                              buttonColor: ColorConstant.primaryLightGreen,
                              radius: 16,
                              onPressed: () {
                                // if(onBoardingController.currentPage.value==0){
                                //   onBoardingController.currentPage.value = 1;
                                //   onBoardingController.  pageController.nextPage(
                                //       duration: Duration(milliseconds: 250),
                                //       curve: Curves.easeIn
                                //   );
                                //
                                // }else if(onBoardingController.currentPage.value==1){
                                //   onBoardingController.currentPage.value = 2;
                                //   onBoardingController.  pageController.nextPage(
                                //       duration: Duration(milliseconds: 250),
                                //       curve: Curves.easeIn
                                //   );
                                // }else if(onBoardingController.currentPage.value==2){
                                //   onBoardingController.onTapOfGetStartedButton();
                                // }
                                Get.dialog(
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: getHorizontalSize(40)),
                                    child: Center(
                                      child: Material(
                                        color: Colors.transparent,
                                        child: Wrap(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: ColorConstant
                                                      .primaryWhite,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(15))),
                                              margin: const EdgeInsets.only(
                                                  bottom: 20),
                                              padding: const EdgeInsets.only(
                                                bottom: 20,
                                              ),
                                              constraints: const BoxConstraints(
                                                  minWidth: 200),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFF4F4F6),
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    15))),
                                                    padding: EdgeInsets.all(12),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        InkWell(
                                                          onTap:(){
                                                            Get.back();
                                                          },
                                                            child: Icon(
                                                                Icons.close)),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SvgPicture.asset(
                                                                "asset/icons/ic_lock_pending.svg")
                                                          ],
                                                        ),
                                                        Icon(
                                                          Icons.close,
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Container(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          0, 10, 0, 0),
                                                      child: Text(
                                                        "Oops!",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: AppStyle
                                                                .DmSansFont
                                                            .copyWith(
                                                                fontSize: 18,
                                                                color:
                                                                    ColorConstant
                                                                        .darkBlue,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      )),
                                                  const SizedBox(
                                                    height: 25,
                                                  ),
                                                  Container(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          0, 10, 0, 0),
                                                      child: Text(
                                                        "Level 2 is locked, to unlock it\nfirst complete level 1.",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: AppStyle
                                                                .DmSansFont
                                                            .copyWith(
                                                                fontSize: 18,
                                                                color: ColorConstant
                                                                    .darkBlue),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  barrierDismissible: true,
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: getVerticalSize(60),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Obx buildDot({int? index}) {
    return Obx(
      () => onBoardingController.currentPage.value == index
          ? Container(
              margin: EdgeInsets.only(right: 5),
              height: getHorizontalSize(12),
              width: getHorizontalSize(12),
              decoration: BoxDecoration(
                color: ColorConstant.primaryWhite,
                border: Border.all(
                    color: ColorConstant.primaryLightGreen, width: 1.0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(1.5),
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorConstant.primaryLightGreen,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            )
          : Container(
              margin: EdgeInsets.only(right: 5),
              height: getHorizontalSize(8),
              width: getHorizontalSize(8),
              decoration: BoxDecoration(
                color: ColorConstant.naturalGrey3,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
    );
  }
}
