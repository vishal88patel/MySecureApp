import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/presentation/EnterPersonalDetails/controller/enter_personal_detail_screen_controller.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

class EnterPersonalDetailScreen extends StatelessWidget {
  var enterPersonalDetailController = Get.find<EnterPersonalScreenController>();

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
                              onTap:(){
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: ColorConstant.primaryWhite,
                              ),
                            ),
                            Text(
                              "5/6",
                              style: AppStyle.textStylePoppinsRegular
                                  .copyWith(color: ColorConstant.primaryWhite),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getVerticalSize(57),
                        ),
                        Text(
                          "Enter your \nPersonal details",
                          style: AppStyle.textStylePoppinsRegular.copyWith(
                              color: ColorConstant.primaryWhite,
                              fontWeight: FontWeight.w700,
                              fontSize: getFontSize(32)),
                        ),
                        SizedBox(
                          height: getVerticalSize(43),
                        ),
                        TextFormField(
                          readOnly: true,
                          onTap: (){
                            enterPersonalDetailController.selectBirthDate(context);

                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Date Of Birth',
                            hintStyle: AppStyle.textStylePoppinsRegular
                                .copyWith(color: ColorConstant.primaryAppTextF1,
                                fontWeight: FontWeight.w400,fontSize: getFontSize(16)),
                            suffixIcon:Icon( Icons.calendar_month,color: ColorConstant.primaryAppTextF1,),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: ColorConstant.primaryAppTextF1),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: ColorConstant.primaryAppTextF1),
                            ),
                          ),
                          controller:
                          enterPersonalDetailController.dobController,
                        ),
                        SizedBox(
                          height: getVerticalSize(43),
                        ),
                        AppTextField(
                          hintText: 'SNN',
                          controller:
                              enterPersonalDetailController.ssnController,
                        ),
                        Spacer(),
                        AppElevatedButton(
                          buttonName: 'Next',
                          onPressed: () {
                            // Get.toNamed(AppRoutes.personalDetailScreen);
                            // Get.toNamed(AppRoutes.personalDetailScreen);
                            enterPersonalDetailController.onTapOfNextButton();
                          },
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
