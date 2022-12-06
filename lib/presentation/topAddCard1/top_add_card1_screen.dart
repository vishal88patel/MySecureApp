import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_secure_app/App%20Configurations/image_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_AppBar%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/presentation/widget/select_mode_widget.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:flutter/services.dart';
import '../../App Configurations/color_constants.dart';
import '../../utils/ConstantsFiles/string_constants.dart';
import '../../utils/HelperFiles/math_utils.dart';
import '../../utils/HelperFiles/pref_utils.dart';
import 'controller/top_add_card1_screen_controller.dart';

class TopAddCard1Screen extends StatelessWidget {
  var topAddCard1ScreenController = Get.find<TopAddCard1Controller>();

  @override
  Widget build(BuildContext context) {
    // PrefUtils.setString(StringConstants.IS_KYC_DONE,"1");
    return Scaffold(

        body: SingleChildScrollView(
            child: Container(
                height: size.height,
                child: Stack(
                  children: [
                    Image.asset('asset/icons/background_image.png',
                        fit: BoxFit.cover,width: double.infinity),
                    SafeArea(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Column( crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              AppAppBar(
                                title: "Add New Card",
                                icon1: "asset/icons/ic_back.svg",
                                icon2: "asset/icons/ic_notification.svg",
                                onPressedIcon1: () {
                                  Get.back();
                                },
                                onPressedIcon2: () {
                                  Get.toNamed(AppRoutes.notificationScreen);
                                },
                              ),

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                child: Text(
                                  "Fill in the fields below or use camera \nphone to scan card",
                                  style: AppStyle.textStyleDMSANS.copyWith(
                                      color: ColorConstant.naturalGrey,
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
                                          controller: topAddCard1ScreenController.nameController,
                                          hintText: 'Cardholder Name',),
                                      SizedBox(height: getVerticalSize(20),),
                                      Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width/1.5,
                                            child: AppTextField(fontSize: 18,
                                              keyBordType: TextInputType.number,
                                              onChanged: (text){
                                                topAddCard1ScreenController.checkCardImage(text);

                                              },
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(16),
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
                                              hintText: 'Expiry Date',),
                                          ),
                                          SizedBox(width: getHorizontalSize(10),),
                                          Expanded(
                                            child: AppTextField(fontSize: 18,
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(3),
                                              ],
                                              controller: topAddCard1ScreenController.cvvController,

                                              keyBordType: TextInputType.number,
                                              hintText: '3-digit CVV',),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: getVerticalSize(20),),
                                    ],
                                  ),
                                ),
                                SelectModeWidget(
                                  onTap: (){
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

                                SelectModeWidget(
                                  onTap: (){
                                    // topAddCard1ScreenController.onClickOfAddCardButton(context);
                                    Get.toNamed(AppRoutes.myLinkedBankListScreen);
                                  },
                                  verticalPadding: 20,
                                  iconV: 45,
                                  iconW: 45,
                                  fontWeight: FontWeight.w700,
                                  color: ColorConstant.buttonGreen.withOpacity(0.1),
                                  title: 'continue',
                                  icon: 'asset/icons/im_scan_card.png',
                                ),
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