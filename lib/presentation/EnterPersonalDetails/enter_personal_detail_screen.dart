import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/key_pad.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/presentation/EnterPersonalDetails/controller/enter_personal_detail_screen_controller.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

class EnterPersonalDetailScreen extends StatelessWidget {
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
                              "5/8",
                              style: AppStyle.textStylePoppinsRegular
                                  .copyWith(color: ColorConstant.primaryWhite),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getVerticalSize(57),
                        ),
                        Text(
                          'Enter Your BirthDate',
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
                               FilteringTextInputFormatter.allow(RegExp(r'[0-9 ]+'))
                          ],
                          decoration: InputDecoration(
                            hintText: 'DD/MM/YYYY',
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
                          enterPersonalDetailController.dobController,
                        ),
                        Spacer(),
                        Column(
                          children: [
                            KeyPad(
                              pinController: enterPersonalDetailController.dobController,
                              onChange: (var pin) {
                                enterPersonalDetailController.dobController.text =
                                     pin;//
                                print(
                                    pin);
                              },
                              onNext: () {
                                enterPersonalDetailController.onTapOfNextButton();

                                // enterPersonalDetailController.goNextScreen();
                              },
                            ),
                          ],
                        )


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
