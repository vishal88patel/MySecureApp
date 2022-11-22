import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/key_pad.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/presentation/EnterPersonalDetails/controller/enter_personal_detail_screen_controller.dart';
import 'package:my_secure_app/presentation/EnterPersonalDetails/nam_pad.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

class EnterSNNDetailScreen extends StatelessWidget {
  var enterPersonalDetailController = Get.find<EnterBirthDateController>();

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
                                      "7/9",
                                      style: AppStyle.textStylePoppinsRegular
                                          .copyWith(color: ColorConstant.primaryWhite),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: getVerticalSize(57),
                                ),
                                Text(
                                  'Enter Your SNN',
                                  // "Enter your \nPersonal details",
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
                                  style: TextStyle(color: Colors.white),
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(9),
                                  ],
                                  decoration: InputDecoration(
                                    hintText: 'SNN',
                                    hintStyle: AppStyle.textStylePoppinsRegular
                                        .copyWith(color: ColorConstant.primaryAppTextF1,
                                        fontWeight: FontWeight.w400,fontSize: getFontSize(16)),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: ColorConstant.primaryAppTextF1),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: ColorConstant.primaryAppTextF1),
                                    ),
                                  ),
                                  // var date = parts.sublist(1).join(':').trim(); // date: "'2019:04:01'"

                                  controller:
                                  enterPersonalDetailController.ssnController,
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    NumPad(
                                      type: 'SNN',
                                      controller: enterPersonalDetailController.ssnController,
                                      delete: () {
                                        HapticFeedback.lightImpact();

                                        if( enterPersonalDetailController.ssnController.text.isNotEmpty){
                                          enterPersonalDetailController.ssnController.text = enterPersonalDetailController.ssnController.text
                                              .substring(0, enterPersonalDetailController.ssnController.text.length - 1);

                                        }
                                      },
                                      // do something with the input numbers
                                      onSubmit: () {
                                        debugPrint('Your code: ${enterPersonalDetailController.ssnController.text}');
                                        enterPersonalDetailController.onTapOfNextSnnButton();
                                      },
                                    ),
                                  ],
                                )


                                /*SizedBox(
                          height: getVerticalSize(43),
                        ),
                        AppTextField(
                          hintText: 'SNN',
                          maxLength: 9,
                          controller:
                              enterPersonalDetailController.ssnController,
                          keyBordType: TextInputType.number,
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
                        ),*/
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
