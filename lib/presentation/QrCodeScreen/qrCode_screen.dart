import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_AppBar .dart';
import '../../routes/app_routes.dart';
import '../../theme/app_style.dart';
import '../../utils/HelperFiles/math_utils.dart';
import 'controller/qrCode_screen_controller.dart';

class QrCodeScreen extends StatelessWidget {
  var qrController = Get.find<QrCodeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.primaryWhite,
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
                                ColorConstant.naturalGrey2)),
                        padding: EdgeInsets.all(6),
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,size: 20,color: ColorConstant.naturalGrey4,),
                      ),
                    ),

                    Text(
                      "My QR Code",
                      style: AppStyle.DmSansFont.copyWith(
                          color: ColorConstant.naturalBlack,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          qrController.image.value,
                          height: getVerticalSize(100),
                          width: getVerticalSize(100),
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                    null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: getHorizontalSize(14),),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:MainAxisAlignment.start,
                            children: [
                              Text(qrController.userName.value.toTitleCase(),
                                  style: AppStyle.textStyleDMSANS
                                      .copyWith(
                                      color:
                                      ColorConstant.naturalBlack,
                                      fontWeight: FontWeight.w500,
                                      fontSize: getFontSize(26))),
                              SizedBox(width: getHorizontalSize(4),),
                              Image.asset(
                                'asset/icons/verified.png',
                                color: ColorConstant.primaryLightGreen,
                                height: getVerticalSize(24),
                                width: getHorizontalSize(24),
                              ),
                            ],
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Obx(()=>
                                  Text(qrController.cashtag.value,
                                      style: AppStyle.textStyleDMSANS
                                          .copyWith(
                                          color:
                                          ColorConstant.naturalBlack,
                                          fontWeight: FontWeight.w500,
                                          fontSize: getFontSize(22))),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
              ),
              SizedBox(height: getVerticalSize(50),),
              Stack(
                children: [
                  Center(
                    child: SvgPicture.asset(
                      "asset/icons/ic_qr_border.svg",
                      height: getVerticalSize(300),
                      width: getVerticalSize(300),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: getVerticalSize(40)),
                      child: Obx(()=>
                          QrImage(
                            data: qrController.uuid.value,
                            version: QrVersions.auto,
                            size: getVerticalSize(220),
                            embeddedImage: AssetImage('assets/app_icon.png'),
                            embeddedImageStyle: QrEmbeddedImageStyle(
                              size: Size(80, 80),
                            ),
                          ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: getVerticalSize(36 ),),
              Text('Scan this code to pay me',
                  style: AppStyle.textStyleDMSANS
                      .copyWith(
                      color:
                      ColorConstant.naturalBlack,
                      fontWeight: FontWeight.w500,
                      fontSize: getFontSize(22))),

              Spacer(),
              Padding(
                padding: EdgeInsets.only(left: getVerticalSize(30),right: getVerticalSize(30)),
                child: InkWell(
                  onTap: (){
                    Get.offAllNamed(AppRoutes.dashBoardScreen,
                        arguments: {"bottomTabCount": 2});
                  },
                  child: Container(
                    height: getVerticalSize(66),
                    decoration: BoxDecoration(
                      color: ColorConstant.primaryLightGreen,
                        borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "asset/icons/ic_scan_qr.svg",
                          height: getVerticalSize(24),
                          width: getVerticalSize(24),
                          fit: BoxFit.fill,
                        ),
                        SizedBox(width: getVerticalSize(12)),
                        Text('Scan QR Code',
                            style: AppStyle.textStyleDMSANS
                                .copyWith(
                                color:
                                ColorConstant.primaryWhite,
                                fontWeight: FontWeight.w500,
                                fontSize: getFontSize(22))),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: getVerticalSize(60),)
            ],
          ),
        ));

  }
}
