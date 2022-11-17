import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/presentation/EnterAddress/enter_address_screen.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

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
        backgroundColor: ColorConstant.primaryBlack,
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            child: Stack(
              children: [
                MainCutomBackGround(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getHorizontalSize(36.0),
                      vertical: getVerticalSize(26)),
                  child: SafeArea(
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: ColorConstant.primaryWhite,
                                  ),
                                ),
                                Text(
                                  "3/6",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(
                                          color: ColorConstant.primaryWhite),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getVerticalSize(57),
                            ),
                            Text(
                              "What's Your Name?",

                              // "Enter your Legal Name",
                              style: AppStyle.textStylePoppinsRegular.copyWith(
                                  color: ColorConstant.primaryWhite,
                                  fontWeight: FontWeight.w700,
                                  fontSize: getFontSize(32)),
                            ),
                            SizedBox(
                              height: getVerticalSize(100),
                            ),

                            AppTextField(
                                hintText: 'Enter Your First Name',
                                controller: enterLegelNameController
                                    .firstNameController),
                            SizedBox(
                              height: getVerticalSize(43),
                            ),
                            AppTextField(
                                hintText: 'Enter your Mother''s middle name',
                                controller: enterLegelNameController
                                    .middleNameController),

                            SizedBox(
                              height: getVerticalSize(43),
                            ),
                            AppTextField(
                                hintText: 'Enter your last name',
                                controller: enterLegelNameController
                                    .lastNameController),
                            Spacer(),
                            Row(
                              children: [

                                Expanded(
                                  child: AppElevatedButton(
                                    buttonName: 'Cancel',
                                    radius: 5,
                                    onPressed: () {
                                      Get.back();
                                    },
                                  ),
                                ),
                                SizedBox(width: getHorizontalSize(20),),
                                Expanded(
                                  child: AppElevatedButton(
                                    buttonName: 'Next',
                                    radius: 5,
                                    onPressed: () {
                                      // Get.toNamed(AppRoutes.personalDetailScreen);
                                      // Get.toNamed(AppRoutes.personalDetailScreen);
                                      // enterLegelNameController.onTapOfNextButton();
                                      if (enterLegelNameController
                                          .firstNameController.text.isEmpty) {
                                        UIUtils.showSnakBar(
                                            bodyText: "Please enter first name",
                                            headerText: StringConstants.ERROR);
                                      } else if (enterLegelNameController.middleNameController.text.isEmpty) {
                                        UIUtils.showSnakBar(
                                            bodyText: "Please enter middle name",
                                            headerText: StringConstants.ERROR);
                                      }else if (enterLegelNameController
                                          .lastNameController.text.isEmpty) {
                                        UIUtils.showSnakBar(
                                            bodyText: "Please enter last name",
                                            headerText: StringConstants.ERROR);
                                      }
                                      else {
                                        Get.toNamed(AppRoutes.enterAddressScreen);


                                        // Get.to(
                                        //   EnterAddressDetailScreen(),
                                        //   transition: Transition.rightToLeft,
                                        //   duration: Duration(milliseconds: 500),
                                        // );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getVerticalSize(40),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
              ],
            ),
          ),
        ));
  }
}
