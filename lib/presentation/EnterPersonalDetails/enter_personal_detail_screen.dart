import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/key_pad.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/presentation/EnterPersonalDetails/controller/enter_personal_detail_screen_controller.dart';
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
                                  onTap: () {
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
                                      .copyWith(
                                          color: ColorConstant.primaryWhite),
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
                              readOnly: false,
                              style: TextStyle(color: Colors.white),
                              inputFormatters: [
                                DateTextFormatter()
                              ],
                              decoration: InputDecoration(
                                hintText: 'DD/MM/YYYY',
                                hintStyle: AppStyle.textStylePoppinsRegular
                                    .copyWith(
                                        color: ColorConstant.primaryAppTextF1,
                                        fontWeight: FontWeight.w400,
                                        fontSize: getFontSize(16)),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ColorConstant.primaryAppTextF1),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ColorConstant.primaryAppTextF1),
                                ),
                              ),
                              // var date = parts.sublist(1).join(':').trim(); // date: "'2019:04:01'"

                              controller:
                                  enterPersonalDetailController.dobController,
                              onChanged:(val) {
                                enterPersonalDetailController.dobController.text=val;
                                print(":-- "+ val);
                              },
                            ),
                            Spacer(),
                            Column(
                              children: [
                                KeyPad(
                                  pinController: enterPersonalDetailController
                                      .dobController,
                                  onChange: (var pin) {
                                    // enterPersonalDetailController.dobController
                                    //     .text = pin.toString().length == 2 &&
                                    //         pin.toString().length == 4
                                    //     ? pin + '/'
                                    //     : pin; //
                                    print(pin);

                                   var ss= _addSeparator(pin.toString(),"/");
                                   enterPersonalDetailController.dobController.text=pin;
                                   //  print(ss);
                                  },
                                  onNext: () {
                                    // enterPersonalDetailController.goNextScreen();
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
  String _addSeparator(String value, String separator) {
    value = value.replaceAll('/', '');
    var newString = '';
    for (int i = 0; i < value.length; i++) {
      newString += value[i];
      if (i == 1) {
        newString += separator;
      }
      if (i == 3) {
        newString += separator;
      }
    }
    return newString;
  }


}
class DateTextFormatter extends TextInputFormatter {
  static const _maxChars = 8;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    String separator = '/';
    var text = _format(
      newValue.text,
      oldValue.text,
      separator,
    );

    return newValue.copyWith(
      text: text,
      selection: updateCursorPosition(
        oldValue,
        text,
      ),
    );
  }

  String _format(
      String value,
      String oldValue,
      String separator,
      ) {
    var isErasing = value.length < oldValue.length;
    var isComplete = value.length > _maxChars + 2;

    if (!isErasing && isComplete) {
      return oldValue;
    }

    value = value.replaceAll(separator, '');
    final result = <String>[];

    for (int i = 0; i < min(value.length, _maxChars); i++) {
      result.add(value[i]);
      if ((i == 1 || i == 3) && i != value.length - 1) {
        result.add(separator);
      }
    }

    return result.join();
  }

  TextSelection updateCursorPosition(
      TextEditingValue oldValue,
      String text,
      ) {
    var endOffset = max(
      oldValue.text.length - oldValue.selection.end,
      0,
    );

    var selectionEnd = text.length - endOffset;

    return TextSelection.fromPosition(TextPosition(offset: selectionEnd));
  }
}
