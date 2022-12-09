import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../Custom Widgets/app_textField.dart';
import '../EnterPersonalDetails/nam_pad.dart';
import 'controller/kyc_step1_screen_controller.dart';

class KycStep1Screen extends StatelessWidget {
  var kycStep1Controller = Get.find<KycStep1ScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor,
        body: SingleChildScrollView(
            child: Container(
                height: size.height,
                child: Stack(
                  children: [
                    SafeArea(
                      child: Stack(
                        children: [
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: getVerticalSize(10),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            border: Border.all(
                                                color:
                                                ColorConstant.backBorder)),
                                        padding: EdgeInsets.all(6),
                                        child: Icon(
                                          Icons.arrow_back_ios_new_outlined,size: 22,),
                                      ),
                                    ),
                                    Text(
                                      "Complete KYC Details",
                                      style: AppStyle.DmSansFont.copyWith(
                                          color: ColorConstant.darkBlue,
                                          fontWeight: FontWeight.w700,
                                          fontSize: getFontSize(20)),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                          border: Border.all(color: Colors.transparent)),
                                      padding: EdgeInsets.all(10),
                                      child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.transparent,),
                                    ),                      ],
                                ),

                                SizedBox(
                                  height: getVerticalSize(40),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Your Details",
                                      style: AppStyle.DmSansFont.copyWith(
                                          color: ColorConstant.naturalBlack,
                                          fontWeight: FontWeight.w700,
                                          fontSize: getFontSize(28)),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                        if(kycStep1Controller.readOnly.value==true){
                                          kycStep1Controller.readOnly.value=false;
                                        }else{
                                          kycStep1Controller.readOnly.value=true;
                                        }

                                      },
                                      child: Obx(()=>
                                          Container(
                                          height: getHorizontalSize(40),
                                          decoration: BoxDecoration(
                                            color: ColorConstant.primaryLightGreen,
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Padding(
                                            padding:  EdgeInsets.only(left: getHorizontalSize(10),right: getHorizontalSize(10)),
                                            child:kycStep1Controller.readOnly.value?Row(
                                              children: [
                                                Icon(Icons.edit,size: 14,color: Colors.white,),
                                                SizedBox(width: getHorizontalSize(6),),
                                                Text(
                                                  "Edit",
                                                  style: AppStyle.textStyleDMSANS.copyWith(
                                                      color: ColorConstant.primaryWhite,
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: getFontSize(18)),
                                                ),
                                              ],
                                            ):Icon(Icons.close,size: 20,color: Colors.white,),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: getVerticalSize(54),
                                ),
                                Obx(()=>
                                   SizedBox(
                                      child: AppTextField(
                                        controller: kycStep1Controller.firstNameController,
                                        keyBordType: TextInputType.text,
                                        hintText: "First Name",
                                        readOnly: kycStep1Controller.readOnly.value,

                                      )),
                                ),
                                SizedBox(
                                  height: getVerticalSize(26),
                                ),
                                Obx(()=> SizedBox(
                                      child: AppTextField(
                                        controller: kycStep1Controller.lastNameController,
                                        keyBordType: TextInputType.text,
                                        hintText: "Last Name",
                                        readOnly: kycStep1Controller.readOnly.value,
                                      )),
                                ),
                                SizedBox(
                                  height: getVerticalSize(26),
                                ),
                                Obx(()=> SizedBox(
                                      child: AppTextField(
                                        controller: kycStep1Controller.emailController,
                                        keyBordType: TextInputType.emailAddress,
                                        hintText: "Email",
                                        readOnly: kycStep1Controller.readOnly.value,
                                      )),
                                ),
                               /* SizedBox(
                                  height: getVerticalSize(26),
                                ),
                                Obx(()=> SizedBox(
                                      child: AppTextField(
                                        controller: kycStep1Controller.phoneNumberController,
                                        keyBordType: TextInputType.number,
                                        hintText: "Phone Number",
                                        maxLength: 10,
                                        readOnly: kycStep1Controller.readOnly.value,
                                      )),
                                ),*/
                                SizedBox(
                                  height: getVerticalSize(26),
                                ),
                                SizedBox(
                                      child: TextFormField(
                                        readOnly: true,
                                        onTap: (){
                                          kycStep1Controller.readOnly.value?"":kycStep1Controller.selectBirthDate(context);
                                        },
                                        style: TextStyle(color:ColorConstant.grey8F),
                                        decoration: InputDecoration(
                                          hintText: 'Date Of Birth',
                                          hintStyle: AppStyle.textStyleDMSANS
                                              .copyWith(color: ColorConstant.grey8F,
                                              fontWeight: FontWeight.w400,fontSize: getFontSize(20)),
                                          suffixIcon:Icon( Icons.calendar_month,color: ColorConstant.grey8F,),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: ColorConstant.grey8F.withOpacity(0.5),width: 1),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: ColorConstant.grey8F.withOpacity(0.5),width: 1),
                                          ),
                                        ),
                                        controller:
                                        kycStep1Controller.dobController,
                                      ),
                                ),
                                SizedBox(
                                  height: getVerticalSize(26),
                                ),
                                Obx(()=> SizedBox(
                                      child: AppTextField(
                                        controller: kycStep1Controller.ssnController,
                                        keyBordType: TextInputType.number,
                                        hintText: "SSN",
                                        maxLength: 9,
                                        readOnly: kycStep1Controller.readOnly.value,
                                      )),
                                ),
                                SizedBox(
                                  height: getVerticalSize(16),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Obx(()
                                    => IconButton(onPressed: (){
                                      kycStep1Controller.isAgreeCheckBox();
                                    },
                                        padding: EdgeInsets.zero,
                                        constraints: BoxConstraints(),
                                        icon: Icon(kycStep1Controller.isAgree.value
                                            ?Icons.check_box:Icons.check_box_outline_blank,
                                          color: ColorConstant.grey8F,)),
                                    ),
                                    Text(
                                      "These are certified details",
                                      style: AppStyle.textStyleDMSANS.copyWith(
                                          color: ColorConstant.naturalGrey,
                                          fontWeight: FontWeight.w500,
                                          fontSize: getFontSize(20)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: getVerticalSize(26),
                                ),
                                Spacer(),
                                AppElevatedButton(
                                    buttonName: 'Continue',
                                    textColor: ColorConstant.primaryWhite,
                                    onPressed: () {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      kycStep1Controller.onClickOfNextButton(context);
                                    }),
                                SizedBox(
                                  height: getVerticalSize(36),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))));
  }
}