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
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../utils/ConstantsFiles/string_constants.dart';
import '../../utils/HelperFiles/math_utils.dart';
import '../../utils/HelperFiles/pref_utils.dart';
import 'controller/top_my_card_screen_controller.dart';

class TopMyCardScreen extends StatelessWidget {
  var topAddCard1ScreenController = Get.find<TopMyCardScreenController>();

  @override
  Widget build(BuildContext context) {
    // PrefUtils.setString(StringConstants.IS_KYC_DONE,"1");
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                height: size.height,
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: getVerticalSize(26),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getHorizontalSize(20)),
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
                                  "My Card",
                                  style: AppStyle.DmSansFont.copyWith(
                                      color: ColorConstant.naturalBlack,
                                      fontWeight: FontWeight.w700,
                                      fontSize: getFontSize(24)),
                                ),
                                Text(
                                  "See all",
                                  style: AppStyle.textStyleDMSANS.copyWith(
                                      color: ColorConstant.primaryLightGreen,
                                      fontWeight: FontWeight.w500,
                                      fontSize: getFontSize(18)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: getVerticalSize(32),
                          ),
                          Stack(
                            children: [
                              Image.asset(
                                "asset/icons/bg_card_design.png",
                                height: getVerticalSize(300),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getHorizontalSize(50)),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: getVerticalSize(60),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              "asset/icons/ic_chip_new.png",
                                              fit: BoxFit.fill,
                                              height: getVerticalSize(36),
                                            ),
                                            SizedBox(
                                              height: getVerticalSize(12),
                                            ),
                                            Text(
                                              "0000 0000 0000 0000",
                                              style:
                                                  AppStyle.DmSansFont.copyWith(
                                                      color: ColorConstant
                                                          .primaryWhite,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize:
                                                          getFontSize(26)),
                                            ),
                                            Text(
                                              "0000",
                                              style:
                                                  AppStyle.DmSansFont.copyWith(
                                                      color: ColorConstant
                                                          .primaryWhite,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize:
                                                          getFontSize(14)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: getVerticalSize(30),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "VALID \nTHRU",
                                          style: AppStyle.DmSansFont.copyWith(
                                              color: ColorConstant.primaryWhite,
                                              fontWeight: FontWeight.w400,
                                              fontSize: getFontSize(10)),
                                        ),
                                        SizedBox(
                                          width: getHorizontalSize(6),
                                        ),
                                        Text(
                                          "07/24",
                                          style: AppStyle.DmSansFont.copyWith(
                                              color: ColorConstant.primaryWhite,
                                              fontWeight: FontWeight.w400,
                                              fontSize: getFontSize(18)),
                                        ),
                                        SizedBox(
                                          width: getHorizontalSize(12),
                                        ),
                                        SvgPicture.asset(
                                          "asset/icons/ic_master_card.svg",
                                          fit: BoxFit.fill,
                                          height: getVerticalSize(42),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: getHorizontalSize(6),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getHorizontalSize(28)),
                            child: GestureDetector(
                              onTap: (){
                                Get.toNamed(AppRoutes.topAddCard1Screen);
                              },
                              child: Image.asset(
                                "asset/icons/bg_add_card.png",
                                height: getVerticalSize(300),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: getHorizontalSize(50),
                          ),
                          
                          Padding(
                            padding: EdgeInsets.only(left: getHorizontalSize(20),right: getHorizontalSize(20)),
                            child: AppElevatedButton(
                                buttonName: 'Continue',
                                textColor: ColorConstant.primaryWhite,
                                onPressed: () {
                                  Get.toNamed(AppRoutes.topAddCard1Screen);
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ))));
  }
}
