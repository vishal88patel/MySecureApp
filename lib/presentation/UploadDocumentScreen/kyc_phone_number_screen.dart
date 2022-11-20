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

class KycPgoneNymberScreen extends StatelessWidget {
  var documentController = Get.find<UploadDocumentScreenController>();

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
                                            onTap:(){
                                              Get.back();
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(right: 10,bottom: 10),
                                              child: Icon(Icons.close,color: ColorConstant.primaryWhite,),
                                            ))
                                      ],
                                    ),
                                    
                                    SizedBox(
                                      height: getVerticalSize(30),
                                    ),
                                    Text(
                                      "Confirm your phone \n number",
                                      style: AppStyle.textStylePoppinsRegular.copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w700,
                                          fontSize: getFontSize(32)),
                                    ),
                                   

                                    SizedBox(
                                      height: getVerticalSize(54),
                                    ),
                                     SizedBox(
                                        child: AppTextField(

                                          controller: documentController.phoneNumberController,
                                          hintText: "Mobile number",
                                          fontSize: 30,
                                          readOnly: true,


                                        )),

                                    Spacer(),
                                    Column(
                                      children: [
                                        NumPadPhoneNumber(
                                          type:'PHONE' ,
                                          controller: documentController.phoneNumberController,
                                          delete: () {
                                            if( documentController.phoneNumberController.text.isNotEmpty){
                                              documentController.phoneNumberController.text = documentController.phoneNumberController.text
                                                  .substring(0, documentController.phoneNumberController.text.length - 1);

                                            }
                                          },
                                          buttonName: 'Get Otp',
                                          // do something with the input numbers
                                          onSubmit: () {
                                            documentController.onClickGetOtp(context);
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
/*
class NumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = new StringBuffer();
    if (newTextLength >= 1) {
      newText.write('+');
      if (newValue.selection.end >= 1) selectionIndex++;
    }
    if (newTextLength >= 3) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 2) + ' ');
      if (newValue.selection.end >= 2) selectionIndex += 1;
    }
    // Dump the rest.
    if (newTextLength >= usedSubstringIndex)
      newText.write(newValue.text.substring(usedSubstringIndex));
    return new TextEditingValue(
      text: newText.toString(),
      selection: new TextSelection.collapsed(offset: selectionIndex),
    );
  }
}*/
