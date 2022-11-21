import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/presentation/EnterPersonalDetails/nam_pad.dart';
import 'package:my_secure_app/presentation/UploadDocumentScreen/num_pad_phone_number.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../loader_screen.dart';
import 'controller/uplod_document_screen_controller.dart';

class KycEmailScreen extends StatelessWidget {
  var documentController = Get.put(UploadDocumentScreenController());

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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10, bottom: 10),
                                          child: Icon(
                                            Icons.close,
                                            color: ColorConstant.primaryWhite,
                                          ),
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: getVerticalSize(30),
                                ),
                                Text(
                                  "Confirm Your Email \nAddress",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w700,
                                          fontSize: getFontSize(32)),
                                ),
                                SizedBox(
                                  height: getVerticalSize(54),
                                ),
                                SizedBox(
                                    child: AppTextField(
                                  controller:
                                      documentController.emailVerifyController,
                                  hintText: "Email",
                                  fontSize: getFontSize(26),
                                  readOnly: false,
                                )),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    documentController.onTapOfSendOtpEmailButton();
                                  },
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 16,
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    decoration: BoxDecoration(
                                      color: ColorConstant.blue26,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Get Otp",
                                        style: AppStyle.textStyleSFPRO.copyWith(
                                            color: ColorConstant.primaryWhite,
                                            fontWeight: FontWeight.w500,
                                            fontSize: getFontSize(18)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: getVerticalSize(16),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.kvcPhoneNumber);
                                  },
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 16,
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    decoration: BoxDecoration(
                                      color: ColorConstant.blue26,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Continue With Phone Number",
                                        style: AppStyle.textStyleSFPRO.copyWith(
                                            color: ColorConstant.primaryWhite,
                                            fontWeight: FontWeight.w500,
                                            fontSize: getFontSize(18)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: getVerticalSize(16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
                  ],
                ))));
  }
}

class CardFormatter extends TextInputFormatter {
  final String sample;
  final String separator;

  CardFormatter({
    required this.sample,
    required this.separator,
  });

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 0) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > sample.length) return oldValue;
        if (newValue.text.length < sample.length &&
            sample[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text:
                '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}
