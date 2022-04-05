import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DQS_show_qrcode extends StatefulWidget {
  final String value_url;
  const DQS_show_qrcode({Key? key, this.value_url = ''}) : super(key: key);

  
  @override
  State<DQS_show_qrcode> createState() => _DQS_show_qrcodeState();
}

class _DQS_show_qrcodeState extends State<DQS_show_qrcode> {
  Widget build(BuildContext context) {
    final String titleString = "Next Page";
    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 5, 117, 35),
      body: Center(
        child: Column(children: [
           SizedBox(height: 30),
          Text(
            'คิวอาร์โค้ดของคุณ',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
                fontSize: 29),
          ),
           SizedBox(height: 30),
          QrImage(
            // แสดง qrcode
            data: '${widget.value_url}',
            version: QrVersions.auto,
            size: 300,
          //  embeddedImage: AssetImage('assets/images/logo.png'), เพิ่มโลโก้เอา path มาใส่
            backgroundColor: Colors.white,
          ),
          SizedBox(height: 40),
           SizedBox(height: 40),
                            ElevatedButton(
                             onPressed: () {
                               
                             },
                              child: Text("ดาวน์โหลดคิวอาร์โค้ด"),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.orange),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.fromLTRB(50, 20, 50, 20)),
                                  textStyle: MaterialStateProperty.all(
                                      TextStyle(fontSize: 16))),
                            ),
        ]),
        
      ),
    );
  }
 
}

