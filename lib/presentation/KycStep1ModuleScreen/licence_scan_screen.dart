import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_secure_app/presentation/KycStep1ModuleScreen/controller/kyc_step1_screen_controller.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/utils/HelperFiles/ui_utils.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../utils/ConstantsFiles/string_constants.dart';
import 'selfie_screen.dart';


class LicenceScanScreen extends StatefulWidget {
  const LicenceScanScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LicenceScanScreenState();
}

class _LicenceScanScreenState extends State<LicenceScanScreen> {
  Barcode? result;
  QRViewController? controller;
  int? counter=0;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'BarCode');
  var kycStep1Controller = Get.find<KycStep1ScreenController>();
  var fname = "";
  var lname = "";
  var dobData = "";
  var dob = "";
  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.

  @override
  void initState() {
    super.initState();
    scanBarcodeNormal();
    //cameraStart();
  }

  Future<void> cameraStart() async {
    Future.delayed(Duration(milliseconds: 100), () {
      controller?.resumeCamera();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(child: CircularProgressIndicator(),),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = MediaQuery.of(context).size.width/1.2;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,

      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutHeight:MediaQuery.of(context).size.width/2.25 ,
          cutOutWidth: MediaQuery.of(context).size.width/1.1,
          ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        kycStep1Controller.qrCodeResult.value=scanData.code.toString();
        print(scanData.code.toString());
        if(kycStep1Controller.qrCodeResult.value.isNotEmpty && counter==0){
          counter=1;
          const start1 = "DCS";
          const end1 = "DDE";
          const start2 = "DAC";
          const end2 = "DDF";
          final startIndex1 = kycStep1Controller.qrCodeResult.value.indexOf(start1);
          final startIndex2 = kycStep1Controller.qrCodeResult.value.indexOf(start2);
          final endIndex1 = kycStep1Controller.qrCodeResult.value.indexOf(end1, startIndex1 + start1.length);
          final endIndex2 = kycStep1Controller.qrCodeResult.value.indexOf(end2, startIndex2 + start2.length);
          lname = kycStep1Controller.qrCodeResult.value.substring(startIndex1 + start1.length, endIndex1);
          fname = kycStep1Controller.qrCodeResult.value.substring(startIndex2 + start2.length, endIndex2);
          if(fname.isNotEmpty && lname.isNotEmpty){
           // scanDataa(fname,lname,controller);
          }
        }
      });
    });
  }
  void scanDataa(String? fName, String? lName) {
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
      UIUtils.showSnakBar(
          bodyText: "Birth Date is Not match With Driving Licence Birth Date",
          headerText: StringConstants.ERROR);
      Get.offAllNamed(AppRoutes.kycStep1DataScreen);
    } else {
      UIUtils.showSnakBar(headerText: "Success",bodyText: "Driving Licence Scan Successfully");
      //controller.stopCamera();
      Future.delayed(Duration(milliseconds: 2000), () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SelfieScreen()),
        );
      });

    }
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#4CD080", 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      //_scanBarcode = barcodeScanRes;
      kycStep1Controller.qrCodeResult.value=barcodeScanRes.toString();
      print(barcodeScanRes.toString());
      if(kycStep1Controller.qrCodeResult.value.isNotEmpty && counter==0){
        counter=1;
        const start1 = "DCS";
        const end1 = "DDE";
        const start2 = "DAC";
        const end2 = "DDF";
        const start3 = "DBB";
        const end3 = "DBA";
        final startIndex1 = kycStep1Controller.qrCodeResult.value.indexOf(start1);
        final startIndex2 = kycStep1Controller.qrCodeResult.value.indexOf(start2);
        final startIndex3 = kycStep1Controller.qrCodeResult.value.indexOf(start3);
        final endIndex1 = kycStep1Controller.qrCodeResult.value.indexOf(end1, startIndex1 + start1.length);
        final endIndex2 = kycStep1Controller.qrCodeResult.value.indexOf(end2, startIndex2 + start2.length);
        final endIndex3 = kycStep1Controller.qrCodeResult.value.indexOf(end3, startIndex3 + start3.length);
        lname = kycStep1Controller.qrCodeResult.value.substring(startIndex1 + start1.length, endIndex1);
        fname = kycStep1Controller.qrCodeResult.value.substring(startIndex2 + start2.length, endIndex2);
        dobData = kycStep1Controller.qrCodeResult.value.substring(startIndex3 + start3.length, endIndex3);
        if(fname.isNotEmpty && lname.isNotEmpty){
          scanDataa(fname,lname);
        }}
    });
  }

}
