import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_AppBar .dart';
import '../../theme/app_style.dart';
import '../../utils/HelperFiles/math_utils.dart';
import 'controller/qrCode_screen_controller.dart';

class QrCodeScreen extends StatelessWidget {
  var qrController = Get.find<QrCodeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.primaryDarkGreen,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20),vertical: getHorizontalSize(20)),
                child: Row(
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
                                ColorConstant.primaryWhite)),
                        padding: EdgeInsets.all(6),
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,size: 16,color: ColorConstant.primaryWhite,),
                      ),
                    ),
                    Text(
                      "QR Code",
                      style: AppStyle.DmSansFont.copyWith(
                          color: ColorConstant.primaryWhite,
                          fontWeight: FontWeight.w700,
                          fontSize: getFontSize(24)),
                    ),
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.transparent)),
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.transparent,),
                    ),                      ],
                ),
              ),
              SizedBox(height: getVerticalSize(50),),

              Obx(()=>
                  Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                      Text(qrController.userName.value.toTitleCase(),
                          style: AppStyle.textStyleDMSANS
                              .copyWith(
                              color:
                              ColorConstant.primaryWhite,
                              fontWeight: FontWeight.w500,
                              fontSize: getFontSize(30))),
                    ],
                  ),
              ),
              SizedBox(height: getVerticalSize(80),),
              Obx(()=>
               Container(
                  color: Colors.white,
                  child: QrImage(
                    data: qrController.uuid.value,
                    version: QrVersions.auto,
                    size: 200.0,
                    embeddedImage: AssetImage('assets/app_icon.png'),
                    embeddedImageStyle: QrEmbeddedImageStyle(
                      size: Size(80, 80),
                    ),
                  ),
                ),
              ),
              SizedBox(height: getVerticalSize(50),),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('UPI ID : ',
                      style: AppStyle.textStyleDMSANS
                          .copyWith(
                          color:
                          ColorConstant.primaryWhite,
                          fontWeight: FontWeight.w500,
                          fontSize: getFontSize(20))),
                  Obx(()=>
                     Text(qrController.upiId.value+"@mysecure",
                        style: AppStyle.textStyleDMSANS
                            .copyWith(
                            color:
                            ColorConstant.primaryWhite,
                            fontWeight: FontWeight.w500,
                            fontSize: getFontSize(20))),
                  ),
                ],
              ),

              SizedBox(height: getVerticalSize(50),),
              Text('Scan this code to pay me',
                  style: AppStyle.textStyleDMSANS
                      .copyWith(
                      color:
                      ColorConstant.primaryWhite,
                      fontWeight: FontWeight.w500,
                      fontSize: getFontSize(20))),

              Spacer(),

            ],
          ),
        ));

  }
}
