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

import '../../Custom Widgets/app_textField.dart';
import 'controller/uplod_document_screen_controller.dart';

class UploadDocumentScreen1 extends StatelessWidget {
  var documentController = Get.find<UploadDocumentScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
              height: size.height,
            child: MainCutomBackGround(
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
                    Row(
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
                              padding:  EdgeInsets.only(top: getVerticalSize(8)),
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
                                  color: ColorConstant.lightText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: getFontSize(16)),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(top: getVerticalSize(8)),
                              child: Container(
                                height: 6,
                                width: MediaQuery.of(context).size.width / 2.4,
                                decoration: BoxDecoration(
                                    color: ColorConstant.lightText,
                                    borderRadius: BorderRadius.circular(100)
                                  //more than 50% of width makes circle
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getVerticalSize(28),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: getHorizontalSize(10)),
                      child: Text(
                        "Enter Your Details",
                        style: AppStyle.textStylePoppinsRegular.copyWith(
                            color: ColorConstant.primaryWhite,
                            fontWeight: FontWeight.w500,
                            fontSize: getFontSize(24)),
                      ),
                    ),
                    SizedBox(
                      height: getVerticalSize(20),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left:getHorizontalSize(10),right: getHorizontalSize(10)),
                      child: AppTextField(
                          hintText: 'First Name',
                          controller: documentController
                              .firstNameController),
                    ),
                    SizedBox(
                      height: getVerticalSize(20),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left:getHorizontalSize(10),right: getHorizontalSize(10)),
                      child: AppTextField(
                          hintText: 'Last Name',
                          controller: documentController
                              .lastNameController),
                    ),
                    SizedBox(
                      height: getVerticalSize(20),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left:getHorizontalSize(10),right: getHorizontalSize(10)),
                      child: AppTextField(
                        keyBordType: TextInputType.number,
                          hintText: 'Mobile Number',
                          controller: documentController
                              .mobileController),
                    ),
                    SizedBox(
                      height: getVerticalSize(20),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left:getHorizontalSize(10),right: getHorizontalSize(10)),
                      child: AppTextField(
                          hintText: 'Email',
                          controller: documentController
                              .emailController),
                    ),
                    SizedBox(
                      height: getVerticalSize(20),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left:getHorizontalSize(10),right: getHorizontalSize(10)),
                      child:TextFormField(
                        readOnly: true,
                        onTap: (){
                          documentController.selectBirthDate(context);
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Date Of Birth',
                          hintStyle: AppStyle.textStylePoppinsRegular
                              .copyWith(color: ColorConstant.primaryAppTextF1,
                              fontWeight: FontWeight.w400,fontSize: getFontSize(16)),
                          suffixIcon:Icon( Icons.calendar_month,color: ColorConstant.primaryAppTextF1,),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: ColorConstant.primaryAppTextF1),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: ColorConstant.primaryAppTextF1),
                          ),
                        ),
                        controller:
                        documentController.dobController,
                      ),
                    ),
                    SizedBox(
                      height: getVerticalSize(20),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left:getHorizontalSize(10),right: getHorizontalSize(10)),
                      child: AppTextField(
                          keyBordType: TextInputType.number,
                          hintText: 'SSN',
                          controller: documentController
                              .ssnController),
                    ),
                    SizedBox(
                      height: getVerticalSize(26),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: getHorizontalSize(10),right: getHorizontalSize(10)),
                      child: Obx(()=>
                         Row(
                          children: [
                            Text(
                              "KYC Status",
                              style: AppStyle.textStylePoppinsRegular.copyWith(
                                  color: ColorConstant.primaryWhite,
                                  fontWeight: FontWeight.w500,
                                  fontSize: getFontSize(20)),
                            ),
                            documentController.isVerified=="1"?Padding(
                              padding: EdgeInsets.only(left: getHorizontalSize(10)),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'asset/verified.png',
                                    color: ColorConstant.lightGreen,
                                    height: getVerticalSize(24),
                                    width: getHorizontalSize(24),
                                  ),
                                  Text(
                                    " Verified",
                                    style: AppStyle.textStylePoppinsRegular.copyWith(
                                        color: ColorConstant.lightGreen,
                                        fontWeight: FontWeight.w500,
                                        fontSize: getFontSize(18)),
                                  ),
                                ],
                              ),
                            ):Padding(
                              padding: EdgeInsets.only(left: getHorizontalSize(10)),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'asset/not_verify.png',
                                    height: getVerticalSize(24),
                                    width: getHorizontalSize(24),
                                  ),
                                  Text(
                                    " Not Verified",
                                    style: AppStyle.textStylePoppinsRegular.copyWith(
                                        color: ColorConstant.appProgressBarColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: getFontSize(18)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    AppElevatedButton(
                      buttonName: 'Next',
                      onPressed: () {
                        documentController.onClickOfNextButton();
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
    )),
          ),
        ));
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
