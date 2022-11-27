import 'dart:ffi';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_AppBar .dart';
import '../../theme/app_style.dart';
import 'controller/notification_screen_controller.dart';

class NotificationScreen extends StatelessWidget {
  var notificationController = Get.find<NotificationScreenController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.primaryDarkGreen,
        body: Column(
          children: [
            SizedBox(
              height: getVerticalSize(16),
            ),
            AppAppBar(
              title:"Notification",
              icon1: "asset/icons/ic_back.svg",
              icon2: "asset/icons/ic_setting.svg",
              onPressedIcon1: (){
                Get.back();
              },
              onPressedIcon2: (){},
            ),
            Expanded(
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 0),
                color: ColorConstant.primaryWhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36),
                      topRight: Radius.circular(36)),
                ),
                child: Container(
                  width:MediaQuery.of(context).size.width,
                  child:ListView.builder(
                      shrinkWrap: true,
                      itemCount: 15,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder:
                          (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {

                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: getHorizontalSize(20),right: getHorizontalSize(20),top:getVerticalSize(12),bottom: getVerticalSize(12) ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "asset/icons/ic_row_notification.svg",
                                  fit: BoxFit.fill,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left:getHorizontalSize(18)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Notification write here",
                                        style: AppStyle.textStyleDMSANS.copyWith(
                                            color: ColorConstant.naturalBlack,
                                            fontWeight: FontWeight.w500,
                                            fontSize: getFontSize(20)),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: getVerticalSize(4),),
                                      Text(
                                        "10:00 AM",
                                        style: AppStyle.textStyleDMSANS.copyWith(
                                            color: ColorConstant.naturalGrey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: getFontSize(16)),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(right:getHorizontalSize(10)),
                                  child: Text(
                                    "Info",
                                    style: AppStyle.textStyleDMSANS.copyWith(
                                        color: ColorConstant.primaryLightGreen,
                                        fontWeight: FontWeight.w500,
                                        fontSize: getFontSize(16)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      })
                ),
              ),
            ),
          ],
        ));
  }
}
