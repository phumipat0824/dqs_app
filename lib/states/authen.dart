import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DQS_show_qrcode extends StatefulWidget {
  //const DQS_show_qrcode({ Key? key }) : super(key: key);

  @override
  State<DQS_show_qrcode> createState() => _DQS_show_qrcodeState();
}

class _DQS_show_qrcodeState extends State<DQS_show_qrcode> {
  String? txtURL = '';

  @override
  void initState() {
    super.initState();
    getURL();
  }

  Widget build(BuildContext context) {
    return ListView(
      children: [
        QrImage(
          // แสดง qrcode
          data: '${txtURL}',
          version: QrVersions.auto,
          size: 200,
          backgroundColor: Colors.white,
        ),
         Text('Welcome .....Name : ${txtURL} ')
      ],
    );
  }

  void getURL() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      txtURL = pref.getString('url');
    });
  }
}