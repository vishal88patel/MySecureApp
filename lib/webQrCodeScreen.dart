import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';

class WebQrCodeScreen extends StatefulWidget {
  const WebQrCodeScreen({Key? key}) : super(key: key);

  @override
  State<WebQrCodeScreen> createState() => _WebQrCodeScreenState();
}

class _WebQrCodeScreenState extends State<WebQrCodeScreen> {
  String barcode = 'Tap  to scan';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
    child: Column(
    mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          child: const Text('Scan Barcode'),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    AiBarcodeScanner(
                      //    validateText: 'https://', // link to be validated
                      //   validateType: ValidateType.startsWith,
                      onScan: (String value) {
                        debugPrint(value);
                        setState(() {
                          barcode = value;
                        });
                      },
                    ),
              ),
            );
          },
        ),
        Text(barcode),
      ],
    ),)
    ,
    );
  }
}
