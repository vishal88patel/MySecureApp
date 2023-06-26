import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobile_vision_2/flutter_mobile_vision_2.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:secure_cash_app/presentation/KycStep1ModuleScreen/controller/kyc_step1_screen_controller.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/utils/HelperFiles/ui_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../theme/app_style.dart';
import '../../utils/ConstantsFiles/string_constants.dart';
import '../../utils/HelperFiles/math_utils.dart';
import 'selfie_screen.dart';

class LicenceScanScreen extends StatefulWidget {
  const LicenceScanScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LicenceScanScreenState();
}

class _LicenceScanScreenState extends State<LicenceScanScreen> {
  Barcode? result;
  int counter = 0;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'BarCode');
  var kycStep1Controller = Get.find<KycStep1ScreenController>();
  var fname = "";
  var lname = "";
  var dobData = "";
  var doex = "";

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.

  @override
  void initState() {
    super.initState();
    scanPDF417();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: WillPopScope(
        onWillPop: () => showBackDialog(),
        child: Container(
          child: Center(
            child: CircularProgressIndicator(
                color: ColorConstant.primaryDarkGreen),
          ),
        ),
      ),
    );
  }

  Future<bool> showBackDialog() async {
    return await Get.dialog(
      Padding(
        padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(40)),
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: Wrap(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: ColorConstant.primaryWhite,
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 15, bottom: 20),
                  constraints: const BoxConstraints(minWidth: 200),
                  child: Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            "Are you sure,\n you want to cancel this process?",
                            textAlign: TextAlign.center,
                            style: AppStyle.DmSansFont.copyWith(
                                fontSize: 18, color: ColorConstant.darkBlue),
                          )),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: AppElevatedButton(
                              buttonName: 'NO',
                              radius: 5,
                              buttonColor: ColorConstant.primaryDarkGreen,
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: AppElevatedButton(
                              buttonName: 'YES',
                              buttonColor: ColorConstant.primaryDarkGreen,
                              radius: 5,
                              onPressed: () {
                                Get.back();
                                Get.back();
                                Get.back();
                                Get.back();
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }

  void scanDataa(String? fName, String? lName, String dobData,String doex) {
    print("FNAME=>>>"+fName.toString());
    print("LNAME=>>>"+lName.toString());
    print("DOB=>>>"+dobData.toString());
    print("DOA=>>>"+doex.toString());

    DateTime today = DateTime.now();
    String dateToday = today.toString().substring(0,10);
    String dateExp = doex.substring(4,8)+"-"+doex.substring(0,2)+"-"+doex.substring(2,4);
    DateTime dt1 = DateTime.parse(dateToday);
    DateTime dt2 = DateTime.parse(dateExp);


    if (fName?.toLowerCase().trim() !=
        kycStep1Controller.firstNameController.text.toLowerCase().trim()) {
      UIUtils.showSnakBar(
          bodyText: "First Name is Not match With Driving Licence First Name",
          headerText: StringConstants.ERROR);
      Get.offAllNamed(AppRoutes.kycStep1DataScreen);
    } else if (lName?.toLowerCase().trim() !=
        kycStep1Controller.lastNameController.text.toLowerCase().trim()) {
      UIUtils.showSnakBar(
          bodyText: "Last Name is Not match With Driving Licence Last Name",
          headerText: StringConstants.ERROR);
      Get.offAllNamed(AppRoutes.kycStep1DataScreen);
    } else if (dobData.toLowerCase().trim().toString() !=
        kycStep1Controller.dobController.text.replaceAll("/", "").toString()) {
      print("DOBDATA" +
          dobData.toString() +
          ",,," +
          kycStep1Controller.dobController.text.replaceAll("/", "").toString());
      UIUtils.showSnakBar(
          bodyText: "Birth Date is Not match With Driving Licence Birth Date",
          headerText: StringConstants.ERROR);
      Get.offAllNamed(AppRoutes.kycStep1DataScreen);
    } else if (dt1.isAfter(dt2)) {
      UIUtils.showSnakBar(
          bodyText: "Your Card Has Been Expired",
          headerText: StringConstants.ERROR);
      Get.offAllNamed(AppRoutes.kycStep1DataScreen);
    } else {
      UIUtils.showSnakBar(
          headerText: "Success", bodyText: "Driving Licence Scan Successfully");
      Future.delayed(Duration(milliseconds: 200), () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SelfieScreen(
                    image: 1,
                  )),
        );
      });
    }
  }

  Future<void> scanPDF417() async {
    String barcodeScanRes;
    try {
      final List<Barcode> barcodes = await FlutterMobileVision.scan(
        formats: Barcode.PDF417,
        autoFocus: true,
        flash: false,
        multiple: false,
        waitTap: false,
      );
      if (!mounted) return;
      if (barcodes.length > 0) {
        setState(() {
          barcodeScanRes = barcodes[0].displayValue;
          if (!mounted) return;
          kycStep1Controller.qrCodeResult.value = barcodeScanRes.toString();
          print( kycStep1Controller.qrCodeResult.value);
          print(barcodeScanRes.toString());
          if (kycStep1Controller.qrCodeResult.value.isNotEmpty &&
              counter == 0 &&
              kycStep1Controller.qrCodeResult.value.toString().contains("DCS") &&
              kycStep1Controller.qrCodeResult.value.toString().contains("DDE")) {
            print("SCANDATA=>>>>>>>>"+counter.toString());
            LineSplitter ls = new LineSplitter();
            List<String> lines = ls.convert(kycStep1Controller.qrCodeResult.value);
            for (var i = 0; i < lines.length; i++) {
              if(lines[i].startsWith("DCS")){
                lname=lines[i].substring(3).toLowerCase().trim();
              }
              if(lines[i].startsWith("DAC")){
                fname=lines[i].substring(3).toLowerCase().trim();
              }if(lines[i].startsWith("DBB")){
                dobData=lines[i].substring(3).toLowerCase().trim();
              }
              if(lines[i].startsWith("DBA")){
                doex=lines[i].substring(3).toLowerCase().trim();
              }

            }
            if(doex.toString()=="none"){
              UIUtils.showSnakBar(
                  bodyText: "Your Card Has Been Expired",
                  headerText: StringConstants.ERROR);
              Get.offAllNamed(AppRoutes.kycStep1DataScreen);
              return;
            }
            counter = 1;
            if (fname.isNotEmpty && lname.isNotEmpty &&  lname.isNotEmpty &&  doex.isNotEmpty) {
              scanDataa(fname, lname, dobData,doex);
            }else{
              UIUtils.showSnakBar(
                  bodyText: "Invalid qrcode, Please scan again!!", headerText: StringConstants.ERROR);
              Get.offAllNamed(AppRoutes.kycStep1DataScreen);
            }
          }
          else {
            UIUtils.showSnakBar(
                bodyText: "Invalid qrcode, Please scan again!!", headerText: StringConstants.ERROR);
            Get.offAllNamed(AppRoutes.kycStep1DataScreen);
          }
        });
      }
    } catch (e) {
      Get.offAllNamed(AppRoutes.kycStep1DataScreen);
      return;
    }
  }

}
// @
// 
// DCSROBERTS
// DDEN
// DACASHLEY
// DDFN
// DADNICOLE
// DDGN
// DCAE
// DCBA
// DCDNONE
// DBD10282020
// DBB11041996
// DBA11042025
// DBC2
// DAU066 in
// DAYBLU
// DAG1133 ACACIA CLUB RD # 24
// DAIHOLLISTER
// DAJMO
// DAK656720000
// DCF201083020023
// DCGUSA
// DAW110
// DCK20303P0283350040101
// DDAF
// DDB01272020

