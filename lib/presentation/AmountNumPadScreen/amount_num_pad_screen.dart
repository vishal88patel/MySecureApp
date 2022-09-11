import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_secure_app/App%20Configurations/image_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/key_pad.dart';
import 'controller/amount_num_pad_screen_controller.dart';

class AmountNumPadScreen extends StatelessWidget {
  var amountNumPadController = Get.find<AmountNumPadScreenController>();
  final amountController = TextEditingController();
  final String _userPrefix = "\$";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.primaryBlack,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 24.0, top: 20),
                    child: SvgPicture.asset(
                      // you can replace this with Image.asset
                      'asset/close_image.svg',
                      fit: BoxFit.cover,
                      height: 18,
                      width: 18,
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width/1.5,
                height: getVerticalSize(70),
                child: TextFormField(
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],
                  controller: amountController,
                  maxLines: 1,
                  onChanged: (value) {
                      if (value == _userPrefix) {
                      amountController.text = "";
                      return;
                    }
                    value.startsWith(_userPrefix)
                        ? amountController.text = value
                        : amountController.text = _userPrefix+value;
                    amountController.selection = TextSelection.fromPosition(
                        TextPosition(
                            offset: amountController.text.length));
                  },
                  focusNode: AlwaysDisabledFocusNode(),
                  style: AppStyle.textStyleSFPRO.copyWith(
                      color: ColorConstant.skyE8,
                      fontWeight: FontWeight.w400,
                      fontSize: getFontSize(60)),

                  decoration: InputDecoration(
                    errorStyle: TextStyle(height: 0),
                    hintText: "\$",
                    hintStyle: AppStyle.textStyleSFPRO.copyWith(
                        color: ColorConstant.skyE8,
                        fontWeight: FontWeight.w400,
                        fontSize: getFontSize(60)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorConstant.underLine, width: 3),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorConstant.underLine,width: 3),
                    ),
                  ),
                  cursorColor: ColorConstant.primaryAppTextF1,
                ),
              ),
              Column(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height/2,
                      decoration: BoxDecoration(
                        color: ColorConstant.darkBlue,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade500.withOpacity(0.3),
                            spreadRadius: 0.1,
                            blurRadius: 10,
                            offset: Offset(-1,-4), // changes position of shadow
                          ),
                        ],
                      ),
                      child: KeyPad(
                        pinController: amountController,
                        onChange: (String pin) {
                          amountController.text =_userPrefix+pin;
                          print('${amountController.text}');
                        },
                        onNext: (){
                            Get.toNamed(AppRoutes.pinScreen);
                        },
                      )
                  ),

                ],
              )
            ],
          ),
        ));
  }


}
class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
