import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DQS_show_qrcode extends StatefulWidget {
  final String value_url ;
  const DQS_show_qrcode({ Key? key, this.value_url = ''}) : super(key: key);
  

  @override
  State<DQS_show_qrcode> createState() => _DQS_show_qrcodeState();
}

class _DQS_show_qrcodeState extends State<DQS_show_qrcode> {

  
  Widget build(BuildContext context) {
    final String titleString = "Next Page";
    return ListView(
      children: [
        QrImage(
          // แสดง qrcode
          data: '${widget.value_url}',
          version: QrVersions.auto,
          size: 200,
          backgroundColor: Colors.white,
        ),
        
      ],
    );
  }

  
}