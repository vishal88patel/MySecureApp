import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../Custom Widgets/app_textField.dart';
import '../CameraView.dart';
import '../QrView.dart';
import 'controller/uplod_document_screen_controller.dart';

class UploadDocumentScreen2 extends StatelessWidget {
  var documentController = Get.find<UploadDocumentScreenController>();


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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: ColorConstant.primaryWhite,
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(27),
                ),
                Padding(
                  padding: EdgeInsets.only(left: getHorizontalSize(10)),
                  child: Text(
                    "Complete KYC Details",
                    style: AppStyle.textStylePoppinsRegular.copyWith(
                        color: ColorConstant.primaryWhite,
                        fontWeight: FontWeight.w500,
                        fontSize: getFontSize(32)),
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(27),
                ),
             /*   Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Personal Details",
                          style: AppStyle.textStylePoppinsRegular.copyWith(
                              color: ColorConstant.lightGreen,
                              fontWeight: FontWeight.w500,
                              fontSize: getFontSize(16)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: getVerticalSize(8)),
                          child: Container(
                            height: 6,
                            width: MediaQuery.of(context).size.width / 2.4,
                            decoration: BoxDecoration(
                                color: ColorConstant.lightGreen,
                                borderRadius: BorderRadius.circular(100)
                                //more than 50% of width makes circle
                                ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Id Proof",
                          style: AppStyle.textStylePoppinsRegular.copyWith(
                              color: ColorConstant.lightGreen,
                              fontWeight: FontWeight.w500,
                              fontSize: getFontSize(16)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: getVerticalSize(8)),
                          child: Container(
                            height: 6,
                            width: MediaQuery.of(context).size.width / 2.4,
                            decoration: BoxDecoration(
                                color: ColorConstant.lightGreen,
                                borderRadius: BorderRadius.circular(100)
                                //more than 50% of width makes circle
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),*/
                SizedBox(
                  height: getVerticalSize(28),
                ),
                Padding(
                  padding: EdgeInsets.only(left: getHorizontalSize(10)),
                  child: Text(
                    "Upload Driving Licence",
                    style: AppStyle.textStylePoppinsRegular.copyWith(
                        color: ColorConstant.primaryWhite,
                        fontWeight: FontWeight.w500,
                        fontSize: getFontSize(24)),
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(22),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: getVerticalSize(10), right: getVerticalSize(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: (){
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => const CameraScreen(image: 2,title: 'Scan the front of your\ndriver''s license or state ID',)),
                              // );
                            },
                            /*onTap: () async {
                              try {
                                final SelectedImage = await ImagePicker()
                                    .pickImage(source: ImageSource.camera);
                                if (SelectedImage == null) return;
                                final imageTemporary = File(SelectedImage.path);
                                documentController.netImage2.value =
                                    imageTemporary.path;

                              } on PlatformException catch (e) {
                                print('Failed to pick image:$e');
                              }
                            },*/
                            child: Obx(()=>
                               DottedBorder(
                                  color: documentController.netImage1.value.isEmpty &&
                                      documentController.netImage2.value.isEmpty &&
                                      documentController.netImage3.value.isEmpty
                                   ?ColorConstant.lightGreen:ColorConstant.primaryWhite,
                                  strokeWidth: 1,
                                  borderType: BorderType.Rect,
                                  radius: Radius.circular(100),
                                  child: documentController
                                          .netImage2.value.isNotEmpty
                                      ? Container(
                                          height: getVerticalSize(100),
                                          width: size.width / 2.7,
                                          child: Image.file(
                                            File(documentController
                                                .netImage2.value),
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : Container(
                                          height: getVerticalSize(100),
                                          width: size.width / 2.7,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'asset/camera.png',
                                                color:
                                                    Colors.white.withOpacity(0.5),
                                                height: getVerticalSize(50),
                                                width: getHorizontalSize(50),
                                              ),
                                            ],
                                          ),
                                        )),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: getVerticalSize(10)),
                            child: Text(
                              "Front",
                              style: AppStyle.textStylePoppinsRegular.copyWith(
                                  color: ColorConstant.primaryWhite,
                                  fontWeight: FontWeight.w500,
                                  fontSize: getFontSize(20)),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: (){
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => const CameraScreen(image: 3,title: 'Scan the back of your\ndriver''s license or state ID',)),
                              // );
                            },
                            /*onTap: () async {
                              try {
                                final SelectedImage = await ImagePicker()
                                    .pickImage(source: ImageSource.camera);
                                if (SelectedImage == null) return;
                                final imageTemporary = File(SelectedImage.path);
                                documentController.netImage3.value =
                                    imageTemporary.path;
                              } on PlatformException catch (e) {
                                print('Failed to pick image:$e');
                              }
                            },*/
                            child: Obx(()=>
                              DottedBorder(
                                  color: documentController.netImage1.value.isEmpty &&
                                      documentController.netImage2.value.isNotEmpty &&
                                      documentController.netImage3.value.isEmpty
                                      ?ColorConstant.lightGreen:ColorConstant.primaryWhite,
                                  strokeWidth: 1,
                                  borderType: BorderType.Rect,
                                  radius: Radius.circular(100),
                                  child: documentController
                                          .netImage3.value.isNotEmpty
                                      ? Container(
                                          height: getVerticalSize(100),
                                          width: size.width / 2.7,
                                          child: Image.file(
                                            File(documentController
                                                .netImage3.value),
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : Container(
                                          height: getVerticalSize(100),
                                          width: size.width / 2.7,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'asset/camera.png',
                                                color:
                                                    Colors.white.withOpacity(0.5),
                                                height: getVerticalSize(50),
                                                width: getHorizontalSize(50),
                                              ),
                                            ],
                                          ),
                                        )),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: getVerticalSize(10)),
                            child: Text(
                              "Back",
                              style: AppStyle.textStylePoppinsRegular.copyWith(
                                  color: ColorConstant.primaryWhite,
                                  fontWeight: FontWeight.w500,
                                  fontSize: getFontSize(20)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(24),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: getVerticalSize(20), right: getVerticalSize(20)),
                  child: Obx(()=>
                   AppElevatedButton(

                      buttonName: documentController.qrCodeResult.isEmpty?'Scan your Driving Licence':'Scan Completed',
                      buttonColor: documentController.qrCodeResult.isEmpty&&documentController.netImage1.value.isEmpty &&
                          documentController.netImage2.value.isNotEmpty &&
                          documentController.netImage3.value.isNotEmpty?
                      ColorConstant.lightGreen:ColorConstant.lightText,
                      onPressed: () {
                        //scanQR();
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const QRViewExample()),
                        // );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(26),
                ),
                Padding(
                  padding: EdgeInsets.only(left: getVerticalSize(10)),
                  child: Text(
                    "E-KYC Profile Selfie",
                    style: AppStyle.textStylePoppinsRegular.copyWith(
                        color: ColorConstant.primaryWhite,
                        fontWeight: FontWeight.w500,
                        fontSize: getFontSize(24)),
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(22),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: getVerticalSize(20), right: getVerticalSize(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: (){
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const CameraScreen(image: 1,title: 'E-KYC Profile Selfie')),
                          // );
                        },
                       /* onTap: () async {
                          try {
                            final SelectedImage = await ImagePicker()
                                .pickImage(source: ImageSource.camera);
                            if (SelectedImage == null) return;
                            final imageTemporary = File(SelectedImage.path);
                            documentController.netImage1.value =
                                imageTemporary.path;
                          } on PlatformException catch (e) {
                            print('Failed to pick image:$e');
                          }
                        },*/
                        child: Obx(()=> DottedBorder(
                            color: documentController.netImage1.value.isEmpty &&
                                documentController.netImage2.value.isNotEmpty &&
                                documentController.netImage3.value.isNotEmpty &&
                                documentController.qrCodeResult.isNotEmpty
                                ?ColorConstant.lightGreen:ColorConstant.primaryWhite,
                              strokeWidth: 1,
                              borderType: BorderType.Rect,
                              radius: Radius.circular(100),
                              child: documentController.netImage1.value.isNotEmpty
                                  ? Container(
                                      height: getVerticalSize(100),
                                      width: getVerticalSize(100),
                                      child: Image.file(
                                        File(documentController.netImage1.value),
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Container(
                                      height: getVerticalSize(100),
                                      width: getVerticalSize(100),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'asset/camera.png',
                                            color: Colors.white.withOpacity(0.5),
                                            height: getVerticalSize(50),
                                            width: getHorizontalSize(50),
                                          ),
                                        ],
                                      ),
                                    )),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                AppElevatedButton(
                  buttonName: 'Submit',
                  onPressed: () {
                    //documentController.onClickOfSubmitButton();
                  },
                ),
                SizedBox(
                  height: getVerticalSize(36),
                ),
              ],
            ),
          ],
        ),
      ),
    )));
  }
}
