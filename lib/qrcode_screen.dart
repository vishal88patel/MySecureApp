import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:secure_cash_app/presentation/KycStep1ModuleScreen/controller/kyc_step1_screen_controller.dart';
import 'package:secure_cash_app/presentation/KycStep1ModuleScreen/selfie_screen.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/utils/ConstantsFiles/string_constants.dart';
import 'package:secure_cash_app/utils/HelperFiles/ui_utils.dart';


class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _animationStopped = false;
  String scanText = "Scan";
  bool scanning = false;

  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'BarCode');


  int? counter=0;
  var kycStep1Controller = Get.find<KycStep1ScreenController>();
  var fname = "";
  var lname = "";
  var dobData = "";
  var dob = "";

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.

  @override
  void initState() {
    _animationController =
        AnimationController(duration: new Duration(seconds: 1), vsync: this);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animateScanAnimation(true);
      } else if (status == AnimationStatus.dismissed) {
        animateScanAnimation(false);
      }
    });
    if (!scanning) {
      animateScanAnimation(false);
      setState(() {
        _animationStopped = false;
        scanning = true;
        scanText = "Stop";
      });
    } else {
      setState(() {
        _animationStopped = true;
        scanning = false;
        scanText = "Scan";
      });
    }
    startCamrera();
    super.initState();
  }

  startCamrera() {
    Future.delayed(Duration(milliseconds: 200), () {
      controller!.resumeCamera();
    });
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              child: Stack(
            alignment: Alignment.center,
            children: [
              _buildQrView(context),
            ],
          )),
        ],
      ),
    );
  }

  void animateScanAnimation(bool reverse) {
    if (reverse) {
      _animationController.reverse(from: 1.0);
    } else {
      _animationController.forward(from: 0.0);
    }
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
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
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      UIUtils.showSnakBar(headerText: "scavbjbjb");
      setState(() {
        result = scanData;
        if (result != null) {
          UIUtils.showSnakBar(headerText: "scavbjbjb");
          setState(() {
            //_scanBarcode = barcodeScanRes;
            kycStep1Controller.qrCodeResult.value=scanData.toString();
            print(scanData.toString());
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
                scanDataa(fname,lname,dobData);
              }}
          });
        }
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    controller?.dispose();
    super.dispose();
  }

  void scanDataa(String? fName, String? lName,String dobData) {
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
      print("DOBDATA"+dobData.toString()+",,,"+kycStep1Controller.dobController.text.replaceAll("/", "").toString());
      UIUtils.showSnakBar(
          bodyText: "Birth Date is Not match With Driving Licence Birth Date",
          headerText: StringConstants.ERROR);
      Get.offAllNamed(AppRoutes.kycStep1DataScreen);
    } else {
      UIUtils.showSnakBar(headerText: "Success",bodyText: "Driving Licence Scan Successfully");
      Future.delayed(Duration(milliseconds: 200), () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SelfieScreen(image: 1,)),
        );
      });

    }
  }
}
