import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class DQS_scanqrcode extends StatefulWidget {
  const DQS_scanqrcode({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DQS_scanqrcodeState();
}

class _DQS_scanqrcodeState extends State<DQS_scanqrcode> {
   final GlobalKey qrKey = GlobalKey();
  late QRViewController controller;
  Barcode? result;
//in order to get hot reload to work.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                QRView(
                  key: qrKey,
                  onQRViewCreated: onQRViewCreated,
                  overlay: QrScannerOverlayShape(
//customizing scan area
                    borderWidth: 10,
                    borderColor: Colors.red,
                    borderLength: 20,
                    borderRadius: 10,
                    cutOutSize: MediaQuery.of(context).size.width * 0.8,
                  ),
                ),
                Positioned(
                  left: 0.0,
                  right: 0.0,
                  bottom: 0.0,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.flip_camera_ios,
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              await controller.flipCamera();
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.flash_on,
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              await controller.toggleFlash();
                            })
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(8.0),
              width: double.infinity,
              color: Colors.white,
              child: Center(
                child: result != null
                    ? Column(
                        children: [
                          Text('Code: ${result!.code}'),
                          SizedBox(
                            height: 8.0,
                          ),
                        
                        ],
                      )
                    : Text('Scan Code'),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void onQRViewCreated(QRViewController p1) 
{
//called when View gets created. 
    this.controller = p1;
    controller.scannedDataStream.listen((scanevent) {
      setState(() {
//UI gets created with new QR code.
        result = scanevent;
      });
    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
