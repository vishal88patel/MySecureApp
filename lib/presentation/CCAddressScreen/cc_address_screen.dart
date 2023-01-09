import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/App%20Configurations/color_constants.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_textField.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import 'controller/cc_address_controller.dart';

class CCAddressScreen extends StatelessWidget {
  var ccAddressController = Get.find<CCAddressController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.primaryWhite,
        body: SingleChildScrollView(
            child: Container(
                height: size.height,
                child: Stack(
                  children: [
                    SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getHorizontalSize(20.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [  SizedBox(height: 26,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: ColorConstant.backBorder)),
                                    padding: EdgeInsets.all(6),
                                    child: Icon(
                                      Icons.arrow_back_ios_new_outlined,
                                      size: 22,
                                    ),
                                  ),
                                ),
                                Text(
                                  " ",
                                  style: AppStyle.DmSansFont.copyWith(
                                      color: ColorConstant.primaryBlack,
                                      fontWeight: FontWeight.w700,
                                      fontSize: getFontSize(20)),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: Colors.transparent)),
                                  padding: EdgeInsets.all(10),
                                  child: Icon(
                                    Icons.arrow_back_ios_new_outlined,
                                    color: Colors.transparent,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getVerticalSize(30),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: size.width / 1.2,
                                  child: Text(
                                    "Where should we send your Cash Card ?",
                                    style: AppStyle.DmSansFont.copyWith(
                                        color: ColorConstant.darkBlue,
                                        fontWeight: FontWeight.w700,
                                        fontSize: getFontSize(22)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getVerticalSize(28),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Select an Address",
                                  style: AppStyle.DmSansFont.copyWith(
                                      color: ColorConstant.darkBlue,
                                      fontWeight: FontWeight.w700,
                                      fontSize: getFontSize(20)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getVerticalSize(20),
                            ),
                            SizedBox(
                                child: AppTextField(
                              controller: ccAddressController.addressController,
                              keyBordType: TextInputType.emailAddress,
                              hintText: "+  Add Address",
                              readOnly: false,
                            )),
                            SizedBox(
                              height: getVerticalSize(36),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Saved addresses",
                                  style: AppStyle.DmSansFont.copyWith(
                                      color: ColorConstant.darkBlue,
                                      fontWeight: FontWeight.w700,
                                      fontSize: getFontSize(18)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getVerticalSize(20),
                            ),
                            InkWell(
                              onTap: () {
                                ccAddressController.addressController.text =
                                    ccAddressController.address1.value +
                                        "," +
                                        ccAddressController.address2.value +
                                        "," +
                                        ccAddressController.city.value +
                                        "," +
                                        ccAddressController.state.value;
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ColorConstant.naturalGrey4,
                                        width: 0.5)),

                                width: size.width,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: getHorizontalSize(12),
                                      top: getHorizontalSize(12),
                                      bottom: getHorizontalSize(12),
                                      right: getHorizontalSize(12)),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            "asset/icons/ic_homee.svg",
                                            height: getVerticalSize(24),
                                          ),
                                          SizedBox(
                                            width: getVerticalSize(4),
                                          ),
                                          Text(
                                            "Home",
                                            style: AppStyle.DmSansFont.copyWith(
                                                color: ColorConstant.darkBlue,
                                                fontWeight: FontWeight.w500,
                                                fontSize: getFontSize(18)),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: getVerticalSize(8),
                                      ),
                                      Row(
                                        children: [
                                          Obx(
                                            () => Container(
                                              width:size.width/1.2,
                                              child: Text(
                                                ccAddressController.address1.value +
                                                    "," +
                                                    ccAddressController
                                                        .address2.value +
                                                    "," +
                                                    ccAddressController
                                                        .city.value +
                                                    "," +
                                                    ccAddressController
                                                        .state.value,
                                                style:
                                                    AppStyle.DmSansFont.copyWith(
                                                        color: ColorConstant
                                                            .darkBlue,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            getFontSize(18)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            AppElevatedButton(
                                buttonName: 'Next',
                                radius: 12,
                                onPressed: () {
                                  ccAddressController.onNext();

                                  // Get.to(AmountRadialScreen());
                                }),
                            SizedBox(
                              height: getVerticalSize(36),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ))));
  }
}
