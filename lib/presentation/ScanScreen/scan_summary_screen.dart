import 'dart:ffi';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_secure_app/presentation/ScanScreen/scan_password_screen.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_AppBar .dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../Custom Widgets/app_textField.dart';
import '../../theme/app_style.dart';
import '../../utils/HelperFiles/ui_utils.dart';
import 'controller/scan_screen_controller.dart';

class ScanSummaryScreen extends StatelessWidget {
  var scanController = Get.find<ScanScreenController>();

  var items = [
    'Cash Card',
    'Bank',
    'Credit Card',
    'Wallet',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.primaryDarkGreen,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(
                  height: getVerticalSize(26),
                ),
                AppAppBar(
                  title: "Summary Transaction",
                  icon1: "asset/icons/ic_back.svg",
                  icon2: "asset/icons/ic_help.svg",
                  onPressedIcon1: () {
                    Get.back();
                  },
                  onPressedIcon2: () {},
                ),
                SizedBox(
                  height: getVerticalSize(40),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: ColorConstant.primaryWhite,
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                      ),
                      child: Obx(
                        () => ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            scanController.image.value,
                            height: getVerticalSize(80),
                            width: getVerticalSize(80),
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getVerticalSize(20),
                    ),
                    Obx(
                      () => Text(
                        scanController.name.value,
                        style: AppStyle.textStyleDMSANS.copyWith(
                            color: ColorConstant.primaryWhite,
                            fontWeight: FontWeight.w700,
                            fontSize: getFontSize(28)),
                      ),
                    ),
                    SizedBox(
                      height: getVerticalSize(12),
                    ),
                    Obx(
                      () => Text(
                        scanController.date.value,
                        style: AppStyle.textStyleDMSANS.copyWith(
                            color: ColorConstant.brandYellow,
                            fontWeight: FontWeight.w500,
                            fontSize: getFontSize(18)),
                      ),
                    ),
                    SizedBox(
                      height: getVerticalSize(44),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "\$",
                          style: AppStyle.textStyleDMSANS.copyWith(
                              color: ColorConstant.brandYellow,
                              fontWeight: FontWeight.w500,
                              fontSize: getFontSize(40)),
                        ),
                        SizedBox(width: getHorizontalSize(2)),
                        SizedBox(
                          width: getHorizontalSize(250),
                          child: TextFormField(
                            controller: scanController.amountController,
                            readOnly: false,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                color: ColorConstant.primaryWhite,
                                fontSize: getFontSize(40)),
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              hintText: "Enter Amount",
                              hintStyle: AppStyle.DmSansFont.copyWith(
                                  color: ColorConstant.grey8F,
                                  fontWeight: FontWeight.w400,
                                  fontSize: getFontSize(40)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        ColorConstant.grey8F.withOpacity(0.5),
                                    width: 1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        ColorConstant.grey8F.withOpacity(0.5),
                                    width: 1),
                              ),
                            ),
                            cursorColor: ColorConstant.grey8F,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getVerticalSize(24),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: getHorizontalSize(20),
                          right: getHorizontalSize(20)),
                      child: Container(
                        height: getVerticalSize(80),
                        decoration: BoxDecoration(
                          color: ColorConstant.thirdDarkGreen,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: getHorizontalSize(25),
                              right: getHorizontalSize(25)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  "asset/icons/ic_i_icon.svg",
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                      "Payment fee \$2 has been applied",
                                      style: AppStyle.textStyleDMSANS.copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w500,
                                          fontSize: getFontSize(18))),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  color: ColorConstant.primaryWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: getHorizontalSize(20),
                          right: getHorizontalSize(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 18,
                          ),
                          Text(
                            "Choose Method",
                            style: AppStyle.textStyleDMSANS.copyWith(
                                color: ColorConstant.naturalBlack,
                                fontWeight: FontWeight.w700,
                                fontSize: getFontSize(22)),
                          ),
                          SizedBox(
                            height: getVerticalSize(20),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: ColorConstant.thirdDarkGreen,
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Container(
                                child: CustomDropdown(
                                  hintText: 'Select Payment Method',
                                  items: items,
                                  controller: scanController.jobRoleCtrl,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: getVerticalSize(26),
                          ),
                          AppElevatedButton(
                            buttonName: "Proceed to Pay",
                            textColor: Colors.white,
                            buttonColor: ColorConstant.primaryLightGreen,
                            radius: 16,
                            onPressed: () {
scanController.processToPay();
                            },
                          ),
                          SizedBox(
                            height: getVerticalSize(32),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
