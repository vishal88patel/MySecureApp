import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../Custom Widgets/app_textField.dart';
import '../../theme/app_style.dart';
import '../../utils/HelperFiles/math_utils.dart';
import '../ChangePassword/change_password.dart';
import 'controller/privacy_details_screen_controller.dart';

class PrivacyDetailsScreen extends StatelessWidget {
  var personalDetailsController = Get.find<PrivacyDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.primaryWhite,
      body: SingleChildScrollView(
        child: Container(
          height: size.height*1.05,
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
                height: getVerticalSize(20),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: getHorizontalSize(20), right: getHorizontalSize(20)),
                child: Column(
                  children: [
                    SizedBox(
                      height: getVerticalSize(20),
                    ),
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
                      height: getVerticalSize(30),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Cashtag",
                          style: AppStyle.DmSansFont.copyWith(
                              color: ColorConstant.naturalGrey3,
                              fontWeight: FontWeight.w400,
                              fontSize: getFontSize(20)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            width: 14,
                            child: TextFormField(
                              controller:
                              personalDetailsController.dollerController,
                              readOnly: true,
                              style: AppStyle.DmSansFont.copyWith(
                                  color: ColorConstant.grey8F,
                                  fontWeight: FontWeight.w400,
                                  fontSize: getFontSize(20)),
                              decoration: InputDecoration(
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
                            )),
                        Expanded(
                            child: Obx(
                                  () => TextFormField(
                                readOnly: personalDetailsController.readOnly.value,
                                maxLength: 20,
                                keyboardType: TextInputType.text,
                                style: TextStyle(
                                  color: ColorConstant.grey8F,
                                ),
                                decoration: InputDecoration(

                                  counterText: "",
                                  hintText: 'Cash Tag',
                                  hintStyle: AppStyle.DmSansFont.copyWith(
                                      color: ColorConstant.grey8F,
                                      fontWeight: FontWeight.w400,
                                      fontSize: getFontSize(20)),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorConstant.grey8F.withOpacity(0.5)),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorConstant.grey8F.withOpacity(0.5)),
                                  ),
                                ),
                                // var date = parts.sublist(1).join(':').trim(); // date: "'2019:04:01'"
                                controller: personalDetailsController.tagController,
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: getVerticalSize(25),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Phone Number",
                          style: AppStyle.DmSansFont.copyWith(
                              color: ColorConstant.naturalGrey3,
                              fontWeight: FontWeight.w400,
                              fontSize: getFontSize(20)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            width: 18,
                            child: TextFormField(
                              controller:
                                  personalDetailsController.plusOneController,
                              readOnly: true,
                              style: AppStyle.DmSansFont.copyWith(
                                  color: ColorConstant.grey8F,
                                  fontWeight: FontWeight.w400,
                                  fontSize: getFontSize(20)),
                              decoration: InputDecoration(
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
                            )),
                        Expanded(
                            child: Obx(
                          () => TextFormField(
                            readOnly: personalDetailsController.readOnly.value,
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              color: ColorConstant.grey8F,
                            ),
                            decoration: InputDecoration(
                              counterText: "",
                              hintText: 'Phone Number',
                              hintStyle: AppStyle.DmSansFont.copyWith(
                                  color: ColorConstant.grey8F,
                                  fontWeight: FontWeight.w400,
                                  fontSize: getFontSize(20)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorConstant.grey8F.withOpacity(0.5)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorConstant.grey8F.withOpacity(0.5)),
                              ),
                            ),
                            // var date = parts.sublist(1).join(':').trim(); // date: "'2019:04:01'"
                            controller: personalDetailsController.phoneController,
                          ),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: getVerticalSize(25),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: AppStyle.DmSansFont.copyWith(
                              color: ColorConstant.naturalGrey3,
                              fontWeight: FontWeight.w400,
                              fontSize: getFontSize(20)),
                        ),
                      ],
                    ),
                    SizedBox(
                        child: AppTextField(
                      controller: personalDetailsController.emailController,
                      keyBordType: TextInputType.emailAddress,
                      hintText: "Email",
                      readOnly: true,
                    )),
                    SizedBox(
                      height: getVerticalSize(25),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "SSN",
                          style: AppStyle.DmSansFont.copyWith(
                              color: ColorConstant.naturalGrey3,
                              fontWeight: FontWeight.w400,
                              fontSize: getFontSize(20)),
                        ),
                      ],
                    ),
                    AppTextField(
                      controller: personalDetailsController.ssnController,
                      keyBordType: TextInputType.number,
                      hintText: "Social Security Number",
                      maxLength: 9,
                      readOnly: true,
                    ),
                    SizedBox(
                      height: getVerticalSize(25),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Pin",
                          style: AppStyle.DmSansFont.copyWith(
                              color: ColorConstant.naturalGrey3,
                              fontWeight: FontWeight.w400,
                              fontSize: getFontSize(20)),
                        ),
                      ],
                    ),
                    Obx(
                          () => AppTextField(
                        hintText: 'Pin',
                            readOnly: personalDetailsController.readOnly.value,
                        maxLength: 4,
                        keyBordType: TextInputType.number,
                        controller:
                        personalDetailsController.pinController,
                        isObsecure:
                        personalDetailsController.createPaasIsObsecure.value,
                        suffixIcon: IconButton(
                          icon: Icon(personalDetailsController
                              .createPaasIsObsecure.value
                              ? Icons.visibility_off
                              : Icons.visibility
                            // Icons.visibility_off,
                          ),
                          color: ColorConstant.grey8F,
                          iconSize: getSize(20),
                          onPressed: () {
                            print("oooooooooo");
                            personalDetailsController.onTapOfCreatePassObsecure(
                                personalDetailsController
                                    .createPaasIsObsecure.value);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getVerticalSize(40),
              ),
              Padding(
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
                          personalDetailsController.onTapUpdateButton(context);

                          // personalDetailsController.UpdateProfileApi();
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
