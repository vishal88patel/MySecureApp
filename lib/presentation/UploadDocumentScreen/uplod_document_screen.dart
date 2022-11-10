import 'dart:io';

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

import 'controller/uplod_document_screen_controller.dart';

class UploadDocumentScreen extends StatelessWidget {
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
                Icon(
                  Icons.arrow_back,
                  color: ColorConstant.primaryWhite,
                ),
                SizedBox(
                  height: getVerticalSize(27),
                ),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      // height: getVerticalSize(30.8),width: getHorizontalSize(30.8),
                      color: ColorConstant.skyE8,
                      child: Padding(
                        padding: const EdgeInsets.all(1.8),
                        child: Obx(
                          () => ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child:
                                  documentController.netImage1.toString() == ""
                                      ? Image.asset(
                                          'asset/account_backgraund_image.png',
                                          fit: BoxFit.cover,
                                          height: getVerticalSize(73),
                                          width: getHorizontalSize(73),
                                        )
                                      : Image.file(
                                          File(documentController.netImage1
                                              .toString()),
                                          height: getVerticalSize(73),
                                          width: getHorizontalSize(73),
                                          fit: BoxFit.cover,
                                        )),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(15),
                ),
                Center(
                  child: Obx(
                    () => Text(
                      documentController.userName.value,
                      style: AppStyle.textStylePoppinsRegular.copyWith(
                          color: ColorConstant.primaryWhite,
                          fontWeight: FontWeight.w600,
                          fontSize: getFontSize(24)),
                    ),
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(34),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                  child: GestureDetector(
                    onTap: () {
                      // showChoiceDialog(context, documentController.profileImage,documentController.netImage1.toString());
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                "Pick Image From".tr,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: "Font2"),
                              ),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: [
                                    ListTile(
                                      onTap: () async {
                                        try {
                                          final SelectedImage =
                                              await ImagePicker().pickImage(
                                                  source: ImageSource.gallery);
                                          if (SelectedImage == null) return;
                                          final imageTemporary =
                                              File(SelectedImage.path);
                                          documentController.netImage1.value = imageTemporary.path;
                                          //uploadPic(File(image.path));
                                          // path = SelectedImage.path.toString();
                                          // print(path.toString());
                                        } on PlatformException catch (e) {
                                          print('Failed to pick image:$e');
                                        }
                                        Navigator.pop(context);
                                      },
                                      title: Text("Gallery".tr),
                                    ),
                                    ListTile(
                                      onTap: () async {
                                        try {
                                          final SelectedImage =
                                              await ImagePicker().pickImage(source: ImageSource.camera);
                                          if (SelectedImage == null) return;
                                          final imageTemporary = File(SelectedImage.path);
                                          documentController.netImage1.value = imageTemporary.path;
                                          // path = SelectedImage.path.toString();
                                          // print(path.toString());
                                          //uploadPic(File(image.path));
                                        } on PlatformException catch (e) {
                                          print('Failed to pick image:$e');
                                        }
                                        Navigator.pop(context);
                                      },
                                      title: Text("Camera".tr),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Obx(
                        ()=> DottedBorder(
                          color: ColorConstant.primaryWhite,
                          strokeWidth: 1,
                          borderType: BorderType.Rect,
                          radius: Radius.circular(100),
                          child:  documentController.netImage1.value.isNotEmpty?Container(
                            height: getVerticalSize(115),
                            width: size.width,
                            child: Image.file(File(documentController.netImage1.value),fit: BoxFit.cover,),
                          ):Container(
                            height: getVerticalSize(115),
                            width: size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'asset/add_photo_image.png',
                                  height: getVerticalSize(30),
                                  width: getHorizontalSize(30),
                                ),
                                SizedBox(
                                  height: getVerticalSize(10),
                                ),
                                Text(
                                  "Upload your Photo ",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w500,
                                          fontSize: getFontSize(18)),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(20),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                "Pick Image From".tr,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: "Font2"),
                              ),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: [
                                    ListTile(
                                      onTap: () async {
                                        try {
                                          final SelectedImage =
                                          await ImagePicker().pickImage(
                                              source: ImageSource.gallery);
                                          if (SelectedImage == null) return;
                                          final imageTemporary =
                                          File(SelectedImage.path);
                                          documentController.netImage2.value = imageTemporary.path;
                                          //uploadPic(File(image.path));
                                          // path = SelectedImage.path.toString();
                                          // print(path.toString());
                                        } on PlatformException catch (e) {
                                          print('Failed to pick image:$e');
                                        }
                                        Navigator.pop(context);
                                      },
                                      title: Text("Gallery".tr),
                                    ),
                                    ListTile(
                                      onTap: () async {
                                        try {
                                          final SelectedImage =
                                              await ImagePicker().pickImage(source: ImageSource.camera);
                                          if (SelectedImage == null) return;
                                          final imageTemporary = File(SelectedImage.path);
                                          documentController.netImage2.value = imageTemporary.path;
                                          // path = SelectedImage.path.toString();
                                          // print(path.toString());
                                          //uploadPic(File(image.path));
                                        } on PlatformException catch (e) {
                                          print('Failed to pick image:$e');
                                        }
                                        Navigator.pop(context);
                                      },
                                      title: Text("Camera".tr),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Obx(
                        ()=> DottedBorder(
                          color: ColorConstant.primaryWhite,
                          strokeWidth: 1,
                          borderType: BorderType.Rect,
                          radius: Radius.circular(100),
                          child: documentController.netImage2.value.isNotEmpty?Container(
                            height: getVerticalSize(115),
                            width: size.width,
                            child: Image.file(File(documentController.netImage2.value),fit: BoxFit.cover,),
                          ):Container(
                            height: getVerticalSize(115),
                            width: size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'asset/licences_image.png',
                                  height: getVerticalSize(30),
                                  width: getHorizontalSize(30),
                                ),
                                SizedBox(
                                  height: getVerticalSize(10),
                                ),
                                Text(
                                  "Upload your Driving Licence(Front)",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w500,
                                          fontSize: getFontSize(18)),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(20),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                "Pick Image From".tr,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: "Font2"),
                              ),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: [
                                    ListTile(
                                      onTap: () async {
                                        try {
                                          final SelectedImage =
                                          await ImagePicker().pickImage(
                                              source: ImageSource.gallery);
                                          if (SelectedImage == null) return;
                                          final imageTemporary =
                                          File(SelectedImage.path);
                                          documentController.netImage3.value = imageTemporary.path;
                                          //uploadPic(File(image.path));
                                          // path = SelectedImage.path.toString();
                                          // print(path.toString());
                                        } on PlatformException catch (e) {
                                          print('Failed to pick image:$e');
                                        }
                                        Navigator.pop(context);
                                      },
                                      title: Text("Gallery".tr),
                                    ),
                                    ListTile(
                                      onTap: () async {
                                        try {
                                          final SelectedImage =
                                              await ImagePicker().pickImage(source: ImageSource.camera);
                                          if (SelectedImage == null) return;
                                          final imageTemporary = File(SelectedImage.path);
                                          documentController.netImage3.value = imageTemporary.path;
                                          // path = SelectedImage.path.toString();
                                          // print(path.toString());
                                          //uploadPic(File(image.path));
                                        } on PlatformException catch (e) {
                                          print('Failed to pick image:$e');
                                        }
                                        Navigator.pop(context);
                                      },
                                      title: Text("Camera".tr),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Obx(
                        ()=> DottedBorder(
                          color: ColorConstant.primaryWhite,
                          strokeWidth: 1,
                          borderType: BorderType.Rect,
                          radius: Radius.circular(100),
                          child: documentController.netImage3.value.isNotEmpty?Container(
                            height: getVerticalSize(115),
                            width: size.width,
                            child: Image.file(File(documentController.netImage3.value),fit: BoxFit.cover,),
                          ):Container(
                            height: getVerticalSize(115),
                            width: size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'asset/licences_image.png',
                                  height: getVerticalSize(30),
                                  width: getHorizontalSize(30),
                                ),
                                SizedBox(
                                  height: getVerticalSize(10),
                                ),
                                Text(
                                  "Upload your Driving Licence(Back)",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w500,
                                          fontSize: getFontSize(18)),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(20),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                  child: GestureDetector(
                    onTap: () {
                      scanQR();
                    },
                    child: DottedBorder(
                        color: ColorConstant.primaryWhite,
                        strokeWidth: 1,
                        borderType: BorderType.Rect,
                        radius: Radius.circular(100),
                        child: Container(
                          height: getVerticalSize(80),
                          width: size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asset/add_photo_image.png',
                                height: getVerticalSize(30),
                                width: getHorizontalSize(30),
                              ),
                              SizedBox(
                                height: getVerticalSize(10),
                              ),
                              Obx(
                                ()=>documentController.qrCodeResult.value.isNotEmpty && documentController.qrCodeResult.value!="-1"?Text(
                                  "Scan Done ",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(
                                      color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w500,
                                      fontSize: getFontSize(18)),
                                ): Text(
                                  "Scan your Driving Licence ",
                                  style: AppStyle.textStylePoppinsRegular
                                      .copyWith(
                                          color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w500,
                                          fontSize: getFontSize(18)),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                Spacer(),
                AppElevatedButton(
                  buttonName: 'Upload Documents',
                  onPressed: () {
                    documentController.onClickOfSubmitButton();
                  },
                ),
                SizedBox(
                  height: getVerticalSize(36),
                ),
                Center(
                    child: Container(
                  height: getVerticalSize(4),
                  width: getHorizontalSize(106),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: ColorConstant.primaryAppTextF1),
                ))
              ],
            ),
          ],
        ),
      ),
    )));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#000000', 'Cancel', false, ScanMode.DEFAULT);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    documentController.qrCodeResult.value = barcodeScanRes;
    print("qrCodeResult:" + documentController.qrCodeResult.value);
  }

  Future pickImageGallery(File? image, String path) async {
    try {
      final SelectedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (SelectedImage == null) return;
      final imageTemporary = File(SelectedImage.path);
      image = imageTemporary;
      //uploadPic(File(image.path));
      path = SelectedImage.path.toString();
      print(path.toString());
    } on PlatformException catch (e) {
      print('Failed to pick image:$e');
    }
  }

  Future pickImageCamera(File? image, String path) async {
    try {
      final SelectedImage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (SelectedImage == null) return;
      final imageTemporary = File(SelectedImage.path);
      image = imageTemporary;
      path = SelectedImage.path.toString();
      print(path.toString());
      //uploadPic(File(image.path));
    } on PlatformException catch (e) {
      print('Failed to pick image:$e');
    }
  }

  Future<void> showChoiceDialog(
      BuildContext context, File? image, String path) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Pick Image From".tr,
              style: TextStyle(
                  color: Colors.black, fontSize: 18, fontFamily: "Font2"),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ListTile(
                    onTap: () {
                      pickImageGallery(image, path);
                      Navigator.pop(context);
                    },
                    title: Text("Gallery".tr),
                  ),
                  ListTile(
                    onTap: () {
                      pickImageCamera(image, path);
                      Navigator.pop(context);
                    },
                    title: Text("Camera".tr),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
