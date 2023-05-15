import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:secure_cash_app/App%20Configurations/image_constants.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_AppBar%20.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_textField.dart';
import 'package:secure_cash_app/presentation/widget/select_mode_widget.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:flutter/services.dart';
import '../../App Configurations/color_constants.dart';
import '../../utils/ConstantsFiles/string_constants.dart';
import '../../utils/HelperFiles/math_utils.dart';
import '../../utils/HelperFiles/pref_utils.dart';
import 'controller/link_card_add_card_screen_controller.dart';

class LinkCardAddCardScreen extends StatelessWidget {
  var topAddCard1ScreenController = Get.find<LinkCardAddCardController>();

  @override
  Widget build(BuildContext context) {
    // PrefUtils.setString(StringConstants.IS_KYC_DONE,"1");
    return Scaffold(

        body:SingleChildScrollView(
            child: Container(
                color: ColorConstant.buttonGreen.withOpacity(0.3),
                height: size.height,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: getVerticalSize(20)),
                      child: SafeArea(
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: getHorizontalSize(20)),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                            size: 22,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Add a card",
                                        style: AppStyle.DmSansFont.copyWith(
                                            color: ColorConstant.primaryBlack,
                                            fontWeight: FontWeight.w700,
                                            fontSize: getFontSize(20)),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            border: Border.all(
                                                color: Colors.transparent)),
                                        padding: EdgeInsets.all(10),
                                        child: SizedBox(),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: getVerticalSize(150),
                                ),
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: ColorConstant.primaryWhite,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(32),
                                          topRight: Radius.circular(32),
                                        )),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: getVerticalSize(100),
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.only(left: getHorizontalSize(18)),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Fill in the fields below or use camera \nphone to scan card",
                                                style: AppStyle.textStyleDMSANS.copyWith(
                                                    color: ColorConstant.primaryBlack,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: getFontSize(22)),
                                              ),
                                            ],
                                          ),
                                        ),



                                        SizedBox(height: getVerticalSize(20),),
                                        Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              AppTextField(fontSize: 18,
                                                controller: topAddCard1ScreenController.nameController,
                                                hintText: 'Cardholder Name',),
                                              SizedBox(height: getVerticalSize(20),),
                                              /*    Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width/1.5,
                                            child: AppTextField(fontSize: 18,
                                              keyBordType: TextInputType.number,
                                              onChanged: (text){
                                                topAddCard1ScreenController.checkCardImage(text);
                                              },
                                              inputFormatters: [
                                                  CardFormatter(sample:'0000 0000 0000 0000',separator:' '),
                                              ],
                                              controller: topAddCard1ScreenController.cardNumberController,
                                              hintText: 'Card Number',),
                                          ),
                                          Obx(()=>
                                          topAddCard1ScreenController.cardTypeImage.value.isNotEmpty?Container(
                                               color:topAddCard1ScreenController.cardTypeImage.value=='asset/icons/Visa_image.png'?
                                               Colors.black:Colors.transparent,
                                              height: getVerticalSize(30),
                                              width: getHorizontalSize(45),
                                              child: Image.asset(topAddCard1ScreenController.cardTypeImage.value)):Container(width: 10,height: 10,),
                                          )
                                        ],
                                      ),*/
                                              Obx(
                                                    ()=> AppTextField(fontSize: 18,
                                                  keyBordType: TextInputType.number,
                                                  onChanged: (text){
                                                    topAddCard1ScreenController.checkCardImage(text);
                                                  },
                                                  inputFormatters: [
                                                    CardFormatter(sample:'0000 0000 0000 0000',separator:' '),
                                                  ],
                                                  controller: topAddCard1ScreenController.cardNumberController,
                                                  hintText: 'Card Number',
                                                  suffixImage: topAddCard1ScreenController.cardTypeImage.value,
                                                ),
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
                                                        topAddCard1ScreenController.expDateController,
                                                        hintText: 'Expiry Date',suffixImage: "asset/icons/ic_expiry_date.png"),
                                                  ),
                                                  SizedBox(width: getHorizontalSize(20),),
                                                  Expanded(
                                                    child: AppTextField(fontSize: 18,
                                                        inputFormatters: [
                                                          LengthLimitingTextInputFormatter(3),
                                                        ],
                                                        controller: topAddCard1ScreenController.cvvController,

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
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                            topAddCard1ScreenController.onClickOfAddCardButton(context);
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

                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            Positioned(
                              right: 10,
                              top: getVerticalSize(60),
                              child: Center(
                                  child: ClipRRect(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                    child: Image.asset(
                                      'asset/icons/email_image.jpg',
                                      height: getVerticalSize(220),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )))


    );
  }
}


class CardFormatter extends TextInputFormatter {
  final String sample;
  final String separator;

  CardFormatter({
    required this.sample,
    required this.separator,
  });

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 0) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > sample.length) return oldValue;
        if (newValue.text.length < sample.length &&
            sample[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text:
            '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}