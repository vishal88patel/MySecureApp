import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/presentation/GifScreen/gif_screen.dart';
import 'package:secure_cash_app/presentation/instructionScreen/instruction_content.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../theme/app_style.dart';
import '../KycStep1ModuleScreen/front_back_licence_screen.dart';
import '../KycStep1ModuleScreen/front_passport_screen.dart';
import 'controller/instruction_screen_controller.dart';

class InstructionScreen extends StatelessWidget {
  var onBoardingController = Get.find<InstructionScreenController>();

  List<Map<String, String>> onBoardingData = [
    {"image": "asset/icons/intruction1.png"},
    {"image": "asset/icons/intruction2.png"},
    {"image": "asset/icons/intruction3.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        // Swiping in right direction.
        if (details.delta.dx > 0) {
          onBoardingController.pageController.animateToPage(onBoardingController.currentPage.value-1, duration: Duration(milliseconds: 250),
              curve: Curves.easeIn);
        }

        // Swiping in left direction.
        if (details.delta.dx < 0) {
          onBoardingController.pageController.animateToPage(onBoardingController.currentPage.value+1, duration: Duration(milliseconds: 250),
              curve: Curves.easeIn);
        }
      },
      child: Scaffold(
          backgroundColor: ColorConstant.primaryWhite,
          body:Column(
            children: [
              SizedBox(
                height: getVerticalSize(60),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: ColorConstant.backBorder)),
                        padding: EdgeInsets.all(6),
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          size: 22,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: getVerticalSize(20)),
                      child: InkWell(
                        onTap: () {
                          if(onBoardingController.isFrom.value=="0"){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GifScreen()),
                            );
                          }
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
                  itemBuilder: (context, index) => InstructionContent(
                    image: onBoardingData[index]["image"],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
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
                              height: MediaQuery.of(context).size.height / 40,
                            ),
                            Obx(
                              () => Text(
                                onBoardingController.currentPage.value == 1
                                    ? "Take a selfie"
                                    : onBoardingController.currentPage.value == 2
                                        ? "Scan your ID document"
                                        : "Get ID document ready",
                                style: AppStyle.textStyleDMSANS.copyWith(
                                    color: ColorConstant.naturalBlack,
                                    fontWeight: FontWeight.w700,
                                    fontSize: getFontSize(22)),
                              ),
                            ),
                            SizedBox(
                              height: getVerticalSize(10),
                            ),
                            Obx(
                              () => Text(
                                onBoardingController.currentPage.value == 1
                                    ? "Your face has to be straight. Make sure you \ndon’t have any background lights."
                                    : onBoardingController.currentPage.value == 2
                                        ? "Please make sure that all information is\n within the borders of the scanner."
                                        : "Before you start, make sure your ID proof is \nwith you. You will need to scan it during the \nprocess.",
                                textAlign: TextAlign.center,
                                style: AppStyle.textStyleDMSANS.copyWith(
                                    color: ColorConstant.primaryBlack,
                                    fontWeight: FontWeight.w400,
                                    fontSize: getFontSize(20)),
                              ),
                            ),
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
                                  if(onBoardingController.currentPage.value==0){
                                    onBoardingController.currentPage.value = 1;
                                    onBoardingController.pageController.nextPage(
                                        duration: Duration(milliseconds: 250),
                                        curve: Curves.easeIn
                                    );

                                  }else if(onBoardingController.currentPage.value==1){
                                    onBoardingController.currentPage.value = 2;
                                    onBoardingController.  pageController.nextPage(
                                        duration: Duration(milliseconds: 250),
                                        curve: Curves.easeIn
                                    );
                                  }else if(onBoardingController.currentPage.value==2){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GifScreen()),
                                    );
                                  }

                                },
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
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
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(1.5),
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorConstant.primaryBlack,
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
