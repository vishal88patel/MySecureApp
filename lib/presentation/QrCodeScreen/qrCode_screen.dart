import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_secure_app/App%20Configurations/image_constants.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/main_custom_background.dart';
import '../../theme/app_style.dart';
import '../../utils/HelperFiles/math_utils.dart';
import 'controller/qrCode_screen_controller.dart';

class QrCodeScreen extends StatelessWidget {
  var qrController = Get.find<QrCodeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.primaryBlack,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getHorizontalSize(25.0),
                    vertical: getVerticalSize(26)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap:(){
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: ColorConstant.primaryWhite,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: getHorizontalSize(25.0)),
                      child: Text("My QrCode",
                          style: AppStyle.textStylePoppinsRegular
                              .copyWith(
                              color: ColorConstant.primaryWhite,
                              fontWeight: FontWeight.w600,
                              fontSize: getFontSize(20))),
                    ),
                    Container()
                  ],
                ),
              ),
              Spacer(),
              Container(
                color: Colors.white,
                child: QrImage(
                  data: qrController.uuid.value,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ),
              Spacer(),
            ],
          ),
        ));

  }
}
