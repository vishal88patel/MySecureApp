import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_AppBar .dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../Custom Widgets/app_textField.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_style.dart';
import '../../utils/ConstantsFiles/string_constants.dart';
import '../../utils/HelperFiles/common_utils.dart';
import '../../utils/HelperFiles/math_utils.dart';
import '../../utils/HelperFiles/ui_utils.dart';
import '../ChangePassword/change_password.dart';
import 'controller/privacy_details_screen_controller.dart';

class PrivacyDetailsScreen extends StatelessWidget {
  var personalDetailsController = Get.find<PrivacyDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.primaryWhite,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getVerticalSize(52),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: ColorConstant.backBorder)),
                      padding: EdgeInsets.all(6),
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 22,
                      ),
                    ),
                  ),
                  Text(
                    "Privacy Details",
                    style: AppStyle.DmSansFont.copyWith(
                        color: ColorConstant.primaryBlack,
                        fontWeight: FontWeight.w700,
                        fontSize: getFontSize(20)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.transparent)),
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getVerticalSize(40),
            ),
            SizedBox(
              height: getVerticalSize(20),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: getHorizontalSize(20), right: getHorizontalSize(20)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Details",
                        style: AppStyle.DmSansFont.copyWith(
                            color: ColorConstant.naturalBlack,
                            fontWeight: FontWeight.w700,
                            fontSize: getFontSize(24)),
                      ),
                      InkWell(
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (personalDetailsController.readOnly.value ==
                              true) {
                            personalDetailsController.readOnly.value = false;
                          } else {
                            personalDetailsController.readOnly.value = true;
                          }
                        },
                        child: Obx(
                          () => Container(
                            height: getHorizontalSize(40),
                            decoration: BoxDecoration(
                              color: ColorConstant.primaryLightGreen,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: getHorizontalSize(10),
                                  right: getHorizontalSize(10)),
                              child: personalDetailsController.readOnly.value
                                  ? Row(
                                      children: [
                                        Icon(
                                          Icons.edit,
                                          size: 14,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: getHorizontalSize(6),
                                        ),
                                        Text(
                                          "Edit",
                                          style: AppStyle.textStyleDMSANS
                                              .copyWith(
                                                  color: ColorConstant
                                                      .primaryWhite,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: getFontSize(18)),
                                        ),
                                      ],
                                    )
                                  : Icon(
                                      Icons.close,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: getVerticalSize(10),
                  ),
                  Obx(
                    () => SizedBox(
                        child: AppTextField(
                      controller: personalDetailsController.tagController,
                      keyBordType: TextInputType.text,
                      hintText: "Cashtag",
                      readOnly: personalDetailsController.readOnly.value,
                    )),
                  ),
                  SizedBox(
                    height: getVerticalSize(20),
                  ),
                  Obx(
                    () => SizedBox(
                        child: AppTextField(
                      controller: personalDetailsController.phoneController,
                      keyBordType: TextInputType.text,
                      hintText: "phone",
                      readOnly: personalDetailsController.readOnly.value,
                    )),
                  ),
                  SizedBox(
                    height: getVerticalSize(20),
                  ),
                  Obx(
                    () => SizedBox(
                        child: AppTextField(
                      controller: personalDetailsController.emailController,
                      keyBordType: TextInputType.emailAddress,
                      hintText: "Email",
                      readOnly: personalDetailsController.readOnly.value,
                    )),
                  ),
                  SizedBox(
                    height: getVerticalSize(20),
                  ),
                  AppTextField(
                    controller: personalDetailsController.ssnController,
                    keyBordType: TextInputType.number,
                    hintText: "Social Security Number",
                    maxLength: 9,
                    readOnly: true,
                  ),
                  SizedBox(
                    height: getVerticalSize(20),
                  ),
                  Obx(
                        () => SizedBox(
                        child: AppTextField(
                          controller: personalDetailsController.pinController,
                          keyBordType: TextInputType.emailAddress,
                          hintText: "Pin",
                          readOnly: personalDetailsController.readOnly.value,
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getVerticalSize(36),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getHorizontalSize(20), vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                Get.to(ChangePasswordScreen());
              },
              child: Text(
                "Change password",
                style: AppStyle.DmSansFont.copyWith(
                    color: ColorConstant.primaryDarkGreen,
                    fontWeight: FontWeight.w500,
                    fontSize: getFontSize(18)),
              ),
            ),
            AppElevatedButton(
                buttonName: 'Update',
                textColor: ColorConstant.primaryWhite,
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  Get.back();
                  UIUtils.showSnakBar(
                      bodyText:
                          "This Api in maintenance and will be working soon!!",
                      headerText: StringConstants.ERROR);
                }),
          ],
        ),
      ),
    );
  }
}
