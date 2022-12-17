import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_AppBar .dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../Custom Widgets/app_textField.dart';
import '../../theme/app_style.dart';
import '../../utils/ConstantsFiles/string_constants.dart';
import '../../utils/HelperFiles/math_utils.dart';
import '../../utils/HelperFiles/ui_utils.dart';
import 'controller/personal_details_screen_controller.dart';

class PersonalDetailsScreen extends StatelessWidget {
  var personalDetailsController = Get.find<PersonalDetailsScreenController>();

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
                padding:
                    EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
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
                      "Personal Details",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('asset/icons/credit_card.png',height: getVerticalSize(230),),
                      Positioned(
                        top: getVerticalSize(20),
                        child: SizedBox(
                          width: size.width,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getHorizontalSize(50),
                                vertical: getVerticalSize(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text('Balance',
                                            style: AppStyle.DmSansFont
                                                .copyWith(
                                                color: ColorConstant
                                                    .primaryWhite,
                                                fontWeight:
                                                FontWeight.w500,
                                                fontSize:
                                                getFontSize(14))),
                                        Obx(()=>Text(
                                            "\$"+""+personalDetailsController
                                                .balance.value,
                                            style: AppStyle
                                                .DmSansFont
                                                .copyWith(
                                                color: ColorConstant
                                                    .primaryWhite,
                                                letterSpacing: 0.55,
                                                fontWeight:
                                                FontWeight.w500,
                                                fontSize:
                                                getFontSize(20))),
                                        ),
                                      ],
                                    ),
                                    Image.asset(
                                      'asset/icons/Visa_image.png',
                                      height: getVerticalSize(35.34),
                                      width: getHorizontalSize(50.1),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: getVerticalSize(20),
                                ),
                                Obx(()=>
                                   Text(
                                      personalDetailsController
                                          .cardNumber.value!=""?personalDetailsController.cardNumber.value.toString().replaceRange(0, 12, '*' * 12):"",
                                      style: AppStyle.DmSansFont.copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w500,
                                          fontSize: getFontSize(25))),
                                ),
                                SizedBox(
                                  height: getVerticalSize(40),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Card Holder Name',
                                            style: AppStyle.DmSansFont
                                                .copyWith(
                                                    color: ColorConstant
                                                        .primaryWhite,
                                                    fontWeight:
                                                        FontWeight.w500,
                                                    fontSize:
                                                        getFontSize(14))),
                                        Obx(()=> Text(
                                              personalDetailsController
                                                  .cardName
                                                  .toString(),
                                              style: AppStyle.DmSansFont
                                                  .copyWith(
                                                      color: ColorConstant
                                                          .primaryWhite,
                                                      letterSpacing: 0.55,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize:
                                                          getFontSize(20))),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: getHorizontalSize(70),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text('Expiry Date',
                                            style: AppStyle.DmSansFont
                                                .copyWith(
                                                    color: ColorConstant
                                                        .primaryWhite,
                                                    fontWeight:
                                                        FontWeight.w500,
                                                    fontSize:
                                                        getFontSize(14))),
                                        Obx(()=>Text(
                                              personalDetailsController
                                                  .cardDate.value,
                                              style: AppStyle
                                                      .DmSansFont
                                                  .copyWith(
                                                      color: ColorConstant
                                                          .primaryWhite,
                                                      letterSpacing: 0.55,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize:
                                                          getFontSize(16))),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: getVerticalSize(20),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: getHorizontalSize(20),
                    right: getHorizontalSize(20)),
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
                              personalDetailsController.readOnly.value =
                                  false;
                            } else {
                              personalDetailsController.readOnly.value =
                                  true;
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
                                child: personalDetailsController
                                        .readOnly.value
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
                                                    fontWeight:
                                                        FontWeight.w500,
                                                    fontSize:
                                                        getFontSize(18)),
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
                        controller:
                            personalDetailsController.firstNameController,
                        keyBordType: TextInputType.text,
                        hintText: "First Name",
                        readOnly: personalDetailsController.readOnly.value,
                      )),
                    ),
                    SizedBox(
                      height: getVerticalSize(20),
                    ),
                    Obx(
                      () => SizedBox(
                          child: AppTextField(
                        controller:
                            personalDetailsController.lastNameController,
                        keyBordType: TextInputType.text,
                        hintText: "Last Name",
                        readOnly: personalDetailsController.readOnly.value,
                      )),
                    ),
                    SizedBox(
                      height: getVerticalSize(20),
                    ),
                    Obx(
                      () => SizedBox(
                          child: AppTextField(
                        controller:
                            personalDetailsController.emailController,
                        keyBordType: TextInputType.emailAddress,
                        hintText: "Email",
                        readOnly: personalDetailsController.readOnly.value,
                      )),
                    ),
                    SizedBox(
                      height: getVerticalSize(20),
                    ),
                    SizedBox(
                      child: TextFormField(
                        readOnly: true,
                        onTap: () {
                          personalDetailsController.readOnly.value
                              ? ""
                              : personalDetailsController
                                  .selectBirthDate(context);
                        },
                        style: TextStyle(color: ColorConstant.grey8F),
                        decoration: InputDecoration(
                          hintText: 'Date Of Birth',
                          hintStyle: AppStyle.textStyleDMSANS.copyWith(
                              color: ColorConstant.grey8F,
                              fontWeight: FontWeight.w400,
                              fontSize: getFontSize(20)),
                          suffixIcon: Icon(
                            Icons.calendar_month,
                            color: ColorConstant.grey8F,
                          ),
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
                        controller: personalDetailsController.dobController,
                      ),
                    ),
                    SizedBox(
                      height: getVerticalSize(20),
                    ),
                    Obx(
                      () => SizedBox(
                          child: AppTextField(
                        controller: personalDetailsController.ssnController,
                        keyBordType: TextInputType.number,
                        hintText: "SSN",
                        maxLength: 9,
                        readOnly: personalDetailsController.readOnly.value,
                      )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                child: AppElevatedButton(
                    buttonName: 'Update',
                    textColor: ColorConstant.primaryWhite,
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      UIUtils.showSnakBar(
                          bodyText:
                              "This Api in maintenance and will be working soon!!",
                          headerText: StringConstants.ERROR);
                    }),
              ),
              SizedBox(
                height: getVerticalSize(36),
              ),
            ],
          ),
        ));
  }
}
