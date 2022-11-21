import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_secure_app/App%20Configurations/image_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/presentation/CashOutAmountNumPadScreen/controller/cash_out_amount_num_pad_screen_controller.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/ConstantsFiles/string_constants.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';
import 'package:my_secure_app/utils/HelperFiles/ui_utils.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/key_pad.dart';
import 'controller/amount_num_pad_screen_controller.dart';

class AmountNumPadScreen extends StatelessWidget {

  var amountNumPadController = Get.find<AmountNumPadScreenController>();

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
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        // you can replace this with Image.asset
                        'asset/close_image.svg',
                        fit: BoxFit.cover,
                        height: 18,
                        width: 18,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorConstant.blue26,
                      borderRadius: BorderRadius.all(
                          Radius.circular(24)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () => ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                  amountNumPadController.profile_pic.value,
                                  height: getVerticalSize(60),
                                  width: getVerticalSize(60),
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 14.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Obx(
                                    () => Text(amountNumPadController.name.value,
                                        style: AppStyle.textStylePoppinsRegular
                                            .copyWith(
                                                color: ColorConstant.primaryWhite,
                                                fontWeight: FontWeight.w600,
                                                fontSize: getFontSize(18))),
                                  ),
                                  Obx(
                                    () => Text(amountNumPadController.email.value,
                                        style: AppStyle.textStylePoppinsRegular
                                            .copyWith(
                                                color: ColorConstant.lightText,
                                                fontWeight: FontWeight.w400,
                                                fontSize: getFontSize(18))),
                                  ),
                                ],
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
              ),
             /* Text("Please Enter Amount",
                    style: AppStyle.textStylePoppinsRegular
                        .copyWith(
                        color: ColorConstant.lightText,
                        fontWeight: FontWeight.w400,
                        fontSize: getFontSize(20))),*/
              Text(
                "Please Enter Amount",
                style: AppStyle.textStyleSFPRO.copyWith(
                    color: ColorConstant.skyE8,
                    fontWeight: FontWeight.bold,
                    fontSize: getFontSize(20)),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => Text(
                    "\$" + amountNumPadController.balance!.value + " " +
                        "AVAILABLE",
                    style: AppStyle.textStyleSFPRO.copyWith(
                        color: ColorConstant.skyE8,
                        fontWeight: FontWeight.w400,
                        fontSize: getFontSize(18)),
                  )),
                ],
              ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: getVerticalSize(70),
            child: Obx(()
                => TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
                  ],
                  controller: amountNumPadController.amountController,
                  maxLines: 1,
                  onChanged: (value) {
                    if (value == _userPrefix) {
                      amountNumPadController.amountController.text = "";
                      return;
                    }
                    value.startsWith(_userPrefix)
                        ? amountNumPadController.amountController.text = value
                        : amountNumPadController.amountController.text =
                            _userPrefix + value;
                    amountNumPadController.amountController.selection =
                        TextSelection.fromPosition(TextPosition(
                            offset: amountNumPadController
                                .amountController.text.length));
                  },

                  focusNode: AlwaysDisabledFocusNode(),
                  style: AppStyle.textStyleSFPRO.copyWith(
                      color: amountNumPadController.isAmountAvailable.value
                          ? ColorConstant.skyE8
                          : ColorConstant.grey77,
                      fontWeight: FontWeight.w400,
                      fontSize: getFontSize(60)),
                  decoration: InputDecoration(
                      prefix: Text(
                        "\$",
                        style: AppStyle.textStyleSFPRO.copyWith(
                            color:
                            amountNumPadController.isAmountAvailable.value
                                ? ColorConstant.skyE8
                                : ColorConstant.grey77,
                            fontWeight: FontWeight.w400,
                            fontSize: getFontSize(60)),
                      ),
                    errorStyle: TextStyle(height: 0),
                    hintText: "  \$ 0",
                    hintStyle: AppStyle.textStyleSFPRO.copyWith(
                        color: ColorConstant.skyE8,
                        fontWeight: FontWeight.w400,
                        fontSize: getFontSize(60)),
                    border: InputBorder.none

                  ),
                  cursorColor: ColorConstant.primaryAppTextF1,
                ),
              )),
              Column(
                children: [
                  KeyPad(
                    pinController: amountNumPadController.amountController,
                    onChange: (String pin) {
                      amountNumPadController.amountController.text =
                          _userPrefix + pin;
                     },
                    onNext: () {

                      if (amountNumPadController.isAmountAvailable.value) {
                        if (amountNumPadController.amountController.text ==
                            "" && amountNumPadController.amountController.text=='0') {
                          UIUtils.showSnakBar(
                              bodyText: "Please Enter Amount",
                              headerText: StringConstants.ERROR);
                        } else {
                          amountNumPadController.goNextScreen();
                        }
                      }
                    },
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
