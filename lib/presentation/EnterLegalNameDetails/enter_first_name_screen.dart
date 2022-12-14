import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/App%20Configurations/color_constants.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_textField.dart';
import 'package:secure_cash_app/presentation/loader_screen.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import '../../utils/ConstantsFiles/string_constants.dart';
import '../../utils/HelperFiles/ui_utils.dart';
import 'controller/enter_legel_name_screen_controller.dart';
import 'enter_middle_name_screen.dart';

class EnterFirstNameDetailScreen extends StatelessWidget {
  // var enterLegelNameController = Get.find<EnterLegalNameScreenController>();
  var enterLegelNameController = Get.put(EnterLegalNameScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor,
        body: SingleChildScrollView(
          child: Container(
              height: size.height,
              color: ColorConstant.buttonGreen.withOpacity(0.3),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: getVerticalSize(20)),
                    child: SafeArea(
                      child: Stack(
                        children: [
                          Column( crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            border: Border.all(
                                                color:
                                                ColorConstant.backBorder)),
                                        padding: EdgeInsets.all(6),
                                        child: Icon(
                                          Icons.arrow_back_ios_new_outlined,size: 22,),
                                      ),
                                    ),
                                    Text(
                                      "What's Your Name?",
                                      style: AppStyle.DmSansFont.copyWith(
                                          color: ColorConstant.primaryBlack,
                                          fontWeight: FontWeight.w700,
                                          fontSize: getFontSize(20)),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                          border: Border.all(color: Colors.transparent)),
                                      padding: EdgeInsets.all(10),
                                      child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.transparent,),
                                    ),                      ],
                                ),
                              ),
                              SizedBox(
                                height: getVerticalSize(120),
                              ),


                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                      ),
                                      color:  ColorConstant.primaryWhite
                                  ),

                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SizedBox(
                                        height: getVerticalSize(130),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Please enter your first and last name",
                                              style: AppStyle.DmSansFont.copyWith(
                                                  color: ColorConstant.grey8F,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: getFontSize(18)),
                                            ),

                                            SizedBox(
                                              height: getVerticalSize(30),
                                            ),
                                            AppTextField(
                                                hintText: 'Enter Your First Name',
                                                controller: enterLegelNameController
                                                    .firstNameController),
                                            SizedBox(
                                              height: getVerticalSize(43),
                                            ),
                                            AppTextField(
                                                hintText: 'Enter your last name',
                                                controller: enterLegelNameController
                                                    .lastNameController),

                                            SizedBox(
                                              height: getVerticalSize(43),
                                            ),
                                            AppTextField(
                                                hintText: 'Enter your Mother''s Maiden name',
                                                controller: enterLegelNameController
                                                    .middleNameController),
                                            SizedBox(
                                              height: getVerticalSize(54),
                                            ),
                                            AppElevatedButton(
                                                buttonName: 'Next',
                                                onPressed: () {
                                                  if (enterLegelNameController
                                                      .firstNameController.text.isEmpty) {
                                                    UIUtils.showSnakBar(
                                                        bodyText: "Please enter first name",
                                                        headerText: StringConstants.ERROR);
                                                  } else if (enterLegelNameController.middleNameController.text.isEmpty) {
                                                    UIUtils.showSnakBar(
                                                        bodyText: "Please enter Mother''s Maiden name",
                                                        headerText: StringConstants.ERROR);
                                                  }else if (enterLegelNameController
                                                      .lastNameController.text.isEmpty) {
                                                    UIUtils.showSnakBar(
                                                        bodyText: "Please enter last name",
                                                        headerText: StringConstants.ERROR);
                                                  }
                                                  else {
                                                    Get.to(()=>
                                                        LoaderScreen(AppRoutes.enterSecureTagScreen),
                                                        transition: Transition.rightToLeft);

                                                  }
                                                }),

                                            SizedBox(
                                              height: getVerticalSize(36),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),


                          Positioned(right: 10,
                            top: getVerticalSize(60),
                            child: Center(
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                                  child: Image.asset('asset/icons/name_image.jpg',
                                    height: getVerticalSize(220),),
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ));





  }
}
