import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/account_detail_list_widget.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/presentation/CardDetailListScreen/controller/card_detail_list_screen_controller.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import 'controller/account_detail_list_screen_controller.dart';

class AccountDetailListScreen extends StatelessWidget {
  var accountDetailListController = Get.find<AccountDetailListScreenController>();
  Future<bool> _willPopCallback() async {
    Get.offAllNamed(AppRoutes.dashBoardScreen,arguments: {"bottomTabCount":0});
    return Future.value(true);
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _willPopCallback(),
      child: Scaffold(
          body: Stack(
            children: [
              MainCutomBackGround(
                  child: Padding(padding: EdgeInsets.only(
                      left: getHorizontalSize(20.0),
                      right: getHorizontalSize(20.0),
                      top:getVerticalSize( 26)),
                    child: SafeArea(
                      child: Stack(
                        children: [
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row( mainAxisAlignment : MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.arrow_back, color: ColorConstant.primaryWhite,),
                                  InkWell(
                                    onTap: (){
                                      Get.toNamed(AppRoutes.cardDetailListScreen);
                                    },
                                    child: Image.asset('asset/icons/notification_icon.png',
                                      height: getVerticalSize(20),width: getHorizontalSize(16),),
                                  )
                                ],
                              ),
                              SizedBox(height: getVerticalSize(25),),
                              Stack(alignment: Alignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset('asset/account_backgraund_image.png',
                                    fit: BoxFit.cover,),
                                  ),
                                  Positioned(
                                    top: getVerticalSize(25),
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(25)),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text('\$ 12.345',
                                                      style: AppStyle.textStylePoppinsRegular
                                                          .copyWith(
                                                          fontWeight: FontWeight.w500,fontSize: getFontSize(22))),
                                                  SizedBox(width: getHorizontalSize(5),),
                                                  Icon(Icons.visibility,size: getSize(13),)
                                                ],
                                              ),
                                              Text('Balance',
                                                  style: AppStyle.textStylePoppinsRegular
                                                      .copyWith(
                                                      fontWeight: FontWeight.w400,fontSize: getFontSize(10))),
                                            ],
                                          ),
                                          SizedBox(height: getVerticalSize(25),),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Text('88 **** ****',
                                                      style: AppStyle.textStylePoppinsRegular
                                                          .copyWith(
                                                          fontWeight: FontWeight.w500,fontSize: getFontSize(22))),
                                                  Text('Account Number',
                                                      style: AppStyle.textStylePoppinsRegular
                                                          .copyWith(
                                                          fontWeight: FontWeight.w400,fontSize: getFontSize(10))),
                                                ],
                                              ),
                                              SizedBox(width: getHorizontalSize(70),),
                                              Column(
                                                children: [
                                                  Text('014 251 339',
                                                      style: AppStyle.textStylePoppinsRegular
                                                          .copyWith(
                                                          fontWeight: FontWeight.w500,fontSize: getFontSize(22))),
                                                  Text('Routing',
                                                      style: AppStyle.textStylePoppinsRegular
                                                          .copyWith(
                                                          fontWeight: FontWeight.w400,fontSize: getFontSize(10))),
                                                ],
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(height: getVerticalSize(25),),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Transactions',
                                      style: AppStyle.textStylePoppinsRegular
                                          .copyWith(color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w700,fontSize: getFontSize(15))),
                                 Image.asset('asset/icons/Filter_icon.png',
                                 height: getVerticalSize(25),width:getHorizontalSize(25),)
                                ],
                              ),
                              SizedBox(height: getVerticalSize(15),),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: 15,
                                  physics:const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (BuildContext context,int index) {
                                    return Padding(
                                      padding:  EdgeInsets.symmetric(vertical: getVerticalSize(6.5)),
                                      child: AccountDetailListWidget(
                                          name: 'Your Bank Name ',
                                          price: '-\$5.00',
                                          time: '2:45 PM  | Oct  13  2019',
                                          image: 'asset/icons/Apple_icon.png'),
                                    );
                                  }
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ) ),
            ],
          )),
    );
  }
}
