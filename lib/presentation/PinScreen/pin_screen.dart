import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_secure_app/App%20Configurations/image_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/key_pad_pin.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/key_pad.dart';
import 'controller/pin_screen_controller.dart';

class PinScreen extends StatelessWidget {
  var pinScreenController = Get.find<PinScreenController>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.primaryBlack,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getHorizontalSize(25.0),
                    vertical: getVerticalSize(26)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap:(){
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: ColorConstant.primaryWhite,
                      ),
                    ),
                    InkWell(
                      // onTap: (){ Get.toNamed(AppRoutes.cardDetailScreen);
                      // },
                      child: Image.asset(
                        'asset/icons/notification_icon.png',
                        height: getVerticalSize(20),
                        width: getHorizontalSize(16),
                      ),
                    )
                  ],
                ),
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
                                  pinScreenController.profile_pic.value,
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
                                        () => Text(pinScreenController.name.value,
                                        style: AppStyle.textStylePoppinsRegular
                                            .copyWith(
                                            color: ColorConstant.primaryWhite,
                                            fontWeight: FontWeight.w600,
                                            fontSize: getFontSize(18))),
                                  ),
                                  Obx(
                                        () => Text(pinScreenController.email.value,
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

              SizedBox(height: getVerticalSize(20),),
              Obx(
                    () => Text(pinScreenController.isPin.value==0?"Please Set Your Pin":"Please Enter Your Pin",
                    style: AppStyle.textStylePoppinsRegular
                        .copyWith(
                        color: ColorConstant.lightText,
                        fontWeight: FontWeight.w400,
                        fontSize: getFontSize(20))),
              ),
              SizedBox(height: getVerticalSize(20),),
              Container(
                width: MediaQuery.of(context).size.width/2,
                child: PinCodeTextField(
                  keyboardType: TextInputType.number,
                  length: 4,
                  textStyle: TextStyle(color: ColorConstant.skyE8),
                  obscureText: true,
                  animationType: AnimationType.fade,
                  cursorColor: ColorConstant.blue26,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.circle,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: getVerticalSize(35),
                    fieldWidth: getHorizontalSize(35),
                    activeFillColor: ColorConstant.skyE8,
                    disabledColor: ColorConstant.primaryWhite,
                    errorBorderColor: ColorConstant.primaryWhite,
                    activeColor: ColorConstant.skyE8,
                    selectedColor: ColorConstant.skyE8,
                    inactiveColor: ColorConstant.primaryWhite,
                    inactiveFillColor: ColorConstant.primaryWhite,
                    selectedFillColor: ColorConstant.skyE8,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  controller: pinScreenController.pinController,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {},
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    return true;
                  },
                  appContext: context,
                ),
              ),
              SizedBox(height: getVerticalSize(100),),
              Column(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                        color: ColorConstant.darkBlue,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade500.withOpacity(0.3),
                            spreadRadius: 0.1,
                            blurRadius: 10,
                            offset:
                                Offset(-1, -4), // changes position of shadow
                          ),
                        ],
                      ),
                      child: KeyPadPin(
                        pinController: pinScreenController.pinController,
                        onChange: (String pin) {

                        },
                        onNext: () {
                          Get.toNamed(AppRoutes.bankDetailScreen);
                        },
                      )),
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
