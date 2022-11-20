import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_secure_app/App%20Configurations/image_constants.dart';
import 'package:my_secure_app/presentation/QrView2.dart';
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
              SizedBox(height: getVerticalSize(50),),

              Text('UserName ',
                  style: AppStyle.textStylePoppinsRegular
                      .copyWith(
                      color:
                      ColorConstant.primaryWhite,
                      fontWeight: FontWeight.w500,
                      fontSize: getFontSize(30))),
              SizedBox(height: getVerticalSize(100),),

              Container(
                color: Colors.white,
                child: QrImage(
                  data: qrController.uuid.value,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ),

              SizedBox(height: getVerticalSize(50),),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('UPI ID : ',
                      style: AppStyle.textStylePoppinsRegular
                          .copyWith(
                          color:
                          ColorConstant.primaryWhite,
                          fontWeight: FontWeight.w500,
                          fontSize: getFontSize(20))),
                  Text('abcefg111@okAxis',
                      style: AppStyle.textStylePoppinsRegular
                          .copyWith(
                          color:
                          ColorConstant.primaryWhite,
                          fontWeight: FontWeight.w500,
                          fontSize: getFontSize(20))),
                ],
              ),

              SizedBox(height: getVerticalSize(50),),
              Text('Scan this code to pay me',
                  style: AppStyle.textStylePoppinsRegular
                      .copyWith(
                      color:
                      ColorConstant.primaryWhite,
                      fontWeight: FontWeight.w500,
                      fontSize: getFontSize(20))),
              
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(40),vertical: getHorizontalSize(10)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QRViewExample2()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorConstant.blue26,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: getVerticalSize(22)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Open Scanner',
                              style: AppStyle.textStylePoppinsRegular
                                  .copyWith(
                                  color:
                                  ColorConstant.primaryWhite,
                                  fontWeight: FontWeight.w500,
                                  fontSize: getFontSize(20))),
                          SizedBox(
                            width: getHorizontalSize(12),
                          ),
                          DottedBorder(
                              color: ColorConstant.skyE8,
                              strokeWidth: 1,
                              borderType: BorderType.Circle,
                              radius: Radius.circular(100),
                              child: Container(
                                height: getVerticalSize(26),
                                width: getHorizontalSize(26),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Image.asset(
                                      'asset/scan_image.png'),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));

  }
}
