import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:secure_cash_app/App%20Configurations/color_constants.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_textField.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import '../../Custom Widgets/app_AppBar .dart';
import '../LinkCardAddCardScreen/link_card_add_card_screen.dart';
import '../profileScreen/widget/profile_op_widget.dart';
import '../widget/select_mode_widget.dart';
import 'controller/cc_card_detail_controller.dart';


class CCCardDetailScreen extends StatelessWidget {
  var ccCardDetailController = Get.find<CCCardDetailController>();

  @override
  Widget build(BuildContext context) {
    // PrefUtils.setString(StringConstants.IS_KYC_DONE,"1");
    return Scaffold(

        body: SingleChildScrollView(
            child: Container(
                height: size.height,
                color: ColorConstant.buttonGreen.withOpacity(0.3),
                child: Stack(
                  children: [
                    SafeArea(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Column( crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getHorizontalSize(20)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
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
                                          Icons.arrow_back_ios_new_outlined,
                                          size: 22,),
                                      ),
                                    ),
                                    Text(
                                      "Add a Card",
                                      style: AppStyle.DmSansFont.copyWith(
                                          color: ColorConstant.primaryBlack,
                                          fontWeight: FontWeight.w700,
                                          fontSize: getFontSize(20)),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              12),
                                          border: Border.all(
                                              color: Colors.transparent)),
                                      padding: EdgeInsets.all(10),
                                      child: Icon(
                                        Icons.arrow_back_ios_new_outlined,
                                        color: Colors.transparent,),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: getVerticalSize(20),),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                child: Text(
                                  "Fill in the fields below or use camera \nphone to scan card",
                                  style: AppStyle.textStyleDMSANS.copyWith(
                                      color: ColorConstant.primaryBlack,
                                      fontWeight:FontWeight.w400,
                                      fontSize:getFontSize(22)),
                                ),
                              ),


                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: getVerticalSize(200)),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: ColorConstant.primaryWhite,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(32),
                                    topRight: Radius.circular(32),
                                  )
                              ),child:Column(
                              children: [
                                SizedBox(height: getVerticalSize(20),),
                                Container(
                                  height: getVerticalSize(7),
                                  width: getHorizontalSize(60),
                                  decoration: BoxDecoration(
                                      color: ColorConstant.greyBD,
                                      borderRadius: BorderRadius.circular(50)
                                  ),
                                ),
                                SizedBox(height: getVerticalSize(20),),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AppTextField(fontSize: 18,
                                        controller: ccCardDetailController.nameController,
                                        hintText: 'Cardholder Name',),
                                      SizedBox(height: getVerticalSize(20)),
                                      /*    Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width/1.5,
                                            child: AppTextField(fontSize: 18,
                                              keyBordType: TextInputType.number,
                                              onChanged: (text){
                                                ccCardDetailController.checkCardImage(text);
                                              },
                                              inputFormatters: [
                                                  CardFormatter(sample:'0000 0000 0000 0000',separator:' '),
                                              ],
                                              controller: ccCardDetailController.cardNumberController,
                                              hintText: 'Card Number',),
                                          ),
                                          Obx(()=>
                                          ccCardDetailController.cardTypeImage.value.isNotEmpty?Container(
                                               color:ccCardDetailController.cardTypeImage.value=='asset/icons/Visa_image.png'?
                                               Colors.black:Colors.transparent,
                                              height: getVerticalSize(30),
                                              width: getHorizontalSize(45),
                                              child: Image.asset(ccCardDetailController.cardTypeImage.value)):Container(width: 10,height: 10,),
                                          )
                                        ],
                                      ),*/

                                      AppTextField(fontSize: 18,
                                          keyBordType: TextInputType.number,
                                          onChanged: (text){
                                            //ccCardDetailController.checkCardImage(text);
                                          },
                                          inputFormatters: [
                                            CardFormatter(sample:'0000 0000 0000 0000',separator:' '),
                                          ],
                                          controller: ccCardDetailController.cardNumberController,
                                          hintText: 'Card Number',
                                          //suffixImage: ccCardDetailController.cardTypeImage.value,
                                        ),

                                      SizedBox(height: getVerticalSize(20),),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: AppTextField(
                                                fontSize: 18,
                                                keyBordType:TextInputType.datetime,
                                                inputFormatters: [
                                                  CardFormatter(sample:'00/00',separator:'/')
                                                ],
                                                controller:
                                                ccCardDetailController.expDateController,
                                                hintText: 'Expiry Date',suffixImage: "asset/icons/ic_expiry_date.png"),
                                          ),
                                          SizedBox(width: getHorizontalSize(20),),
                                          Expanded(
                                            child: AppTextField(fontSize: 18,
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(3),
                                                ],
                                                controller: ccCardDetailController.cvvController,

                                                keyBordType: TextInputType.number,
                                                hintText: '3-digit CVV',suffixImage: "asset/icons/ic_cvv.png"),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: getVerticalSize(20),),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(left:  getHorizontalSize(20)),
                                  child: Row(
                                    children: [
                                      Icon(Icons.lock, color: ColorConstant.primaryBlack,size: getVerticalSize(20),),
                                      Text(
                                        " Secured with 256-bit encryption",
                                        style: AppStyle.textStyleDMSANS.copyWith(
                                            color: ColorConstant.primaryBlack,
                                            fontWeight: FontWeight.w400,
                                            fontSize: getFontSize(18)),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: getVerticalSize(24),),
                                SelectModeWidget(
                                  onTap: (){
                                    FocusManager.instance.primaryFocus?.unfocus();
                                    ccCardDetailController.onClickOfAddCardButton(context);
                                    // Get.toNamed(AppRoutes.topAddCardFillScreen);
                                  },
                                  verticalPadding: 20,
                                  iconV: 45,
                                  iconW: 45,
                                  fontWeight: FontWeight.w700,
                                  color: ColorConstant.buttonGreen.withOpacity(0.1),
                                  title: 'Scan your card',
                                  icon: 'asset/icons/im_scan_card.png',
                                ),

                                SizedBox(height: 50,),

                                /* SelectModeWidget(
                                  onTap: (){
                                    // ccCardDetailController.onClickOfAddCardButton(context);
                                    Get.toNamed(AppRoutes.myLinkedBankListScreen);
                                  },
                                  verticalPadding: 20,
                                  iconV: 45,
                                  iconW: 45,
                                  fontWeight: FontWeight.w700,
                                  color: ColorConstant.buttonGreen.withOpacity(0.1),
                                  title: 'continue',
                                  icon: 'asset/icons/im_scan_card.png',
                                ),*/
                              ],
                            ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ))));
  }
}

