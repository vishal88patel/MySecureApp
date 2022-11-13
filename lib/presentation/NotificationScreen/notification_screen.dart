import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/Custom%20Widgets/support_widget.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import 'controller/notification_screen_controller.dart';

class NotificationScreen extends StatelessWidget {
  var notiController = Get.find<NotificationScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MainCutomBackGround(
            child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getHorizontalSize(20.0), vertical: getVerticalSize(26)),
      child: SafeArea(
        child: Stack(
          children: [
            Row(
              children: [
                Icon(
                  Icons.arrow_back,
                  color: ColorConstant.primaryWhite,
                ),
                SizedBox(
                  width: getHorizontalSize(15),
                ),
                Text(
                  "Notifications",
                  style: AppStyle.textStylePoppinsRegular.copyWith(
                      color: ColorConstant.primaryWhite,
                      fontWeight: FontWeight.w500,
                      fontSize: getFontSize(16)),
                ),
              ],
            ),
            Obx(
              ()=> notiController.showNotiFiBadge.value
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: getVerticalSize(54),
                        ),
                        SupportWidget(
                            name: 'Please Complete Your Kyc First',
                            icon: 'asset/icons/person_icon.png',
                            onTap: () {
                              Get.toNamed(AppRoutes.uploadDocument1);
                            }),
                      ],
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: SvgPicture.asset(
                              "asset/icons/no_notification.svg",
                              color: Colors.white,
                              height: 40,width:40 ,
                            ),
                          ),
                          SizedBox(height: 12,),
                          Text("No Notifications Found",
                              style: AppStyle.textStylePoppinsRegular
                                  .copyWith(color: ColorConstant.primaryWhite,
                                  fontWeight: FontWeight.w500,fontSize: getFontSize(16))),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    )));
  }
}
