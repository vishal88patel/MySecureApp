import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_secure_app/presentation/OnBoardingScreen/onBoarding_content.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';
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
        backgroundColor: ColorConstant.primaryDarkGreen,
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
                    onTap: (){

                    },
                    child: Text(
                      "Skip",
                      style: AppStyle.textStyleDMSANS.copyWith(
                          color: ColorConstant.primaryWhite,
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
                  Card(
                    margin: const EdgeInsets.symmetric(horizontal: 0),
                    color: ColorConstant.primaryWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(36),
                          topRight: Radius.circular(36)),
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height/3,
                      width:MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.only(left: getHorizontalSize(20),right: getHorizontalSize(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height/16,
                            ),
                            Obx(()=>
                              Text(
                                onBoardingController.currentPage.value==1?"Safest Platform":onBoardingController.currentPage.value==2?"Pay Anything":"Fastest Payment",
                                style: AppStyle.textStyleDMSANS.copyWith(
                                    color: ColorConstant.naturalBlack,
                                    fontWeight: FontWeight.w700,
                                    fontSize: getFontSize(32)),
                              ),
                            ),
                            SizedBox(
                              height: getVerticalSize(10),
                            ),
                            Obx(()=>Text(
                                onBoardingController.currentPage.value==1?"Multiple verification and face ID makes your account more safely":onBoardingController.currentPage.value==2?"Supports many types of payments and pay without being complicated":"QR code scanning technology makes your payment process more faster",
                                textAlign: TextAlign.center,
                                style: AppStyle.textStyleDMSANS.copyWith(
                                    color: ColorConstant.naturalGrey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: getFontSize(22)),
                              ),
                            ),
                            Spacer(),
                            Obx(()=>AppElevatedButton(
                                buttonName: onBoardingController.currentPage.value==2
                                    ?"Get Started"
                                    :"Next",
                                textColor: Colors.white,
                                buttonColor: ColorConstant.primaryLightGreen,
                                radius: 16,
                                onPressed: () {
                                  onBoardingController.  pageController.nextPage(
                                      duration: Duration(milliseconds: 250),
                                      curve: Curves.easeIn
                                  );
                                  if(onBoardingController.currentPage.value==0){
                                    onBoardingController.currentPage.value = 1;

                                  }else if(onBoardingController.currentPage.value==1){
                                    onBoardingController.currentPage.value = 2;
                                  }else if(onBoardingController.currentPage.value==2){
                                    onBoardingController.onTapOfGetStartedButton();
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: getVerticalSize(32),
                            ),
                          ],
                        ),
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
    return Obx(()=>
    onBoardingController.currentPage.value==index?Container(
      margin: EdgeInsets.only(right: 5),
      height: getHorizontalSize(12),
      width:  getHorizontalSize(12),
      decoration: BoxDecoration(
        color: ColorConstant.primaryDarkGreen,
          border: Border.all(color: Colors.white,width: 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(1.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ):Container(
      margin: EdgeInsets.only(right: 5),
      height: getHorizontalSize(8),
      width:  getHorizontalSize(8),
      decoration: BoxDecoration(
        color: ColorConstant.secondaryDarkGreen,
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    );
  }
}
