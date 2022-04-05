import 'package:dqs_mobileapp/pages/DQS_scan.dart';
import 'package:flutter/material.dart';

import 'package:dqs_mobileapp/pages/DQS_show_qrcode.dart';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DQS_create_qrcode extends StatefulWidget {
  const DQS_create_qrcode({Key? key}) : super(key: key);

  @override
  State<DQS_create_qrcode> createState() => _DQS_create_qrcodeState();
}

class _DQS_create_qrcodeState extends State<DQS_create_qrcode> {
  TextEditingController url = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Stack(
                children: <Widget>[
                  // Stroked text as border.
                  Text(
                    'ร้านกล้วยหอมจอมเทียน',
                    style: TextStyle(
                      fontSize: 45,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 6
                        ..color = Colors.grey[900]!,
                    ),
                  ),
                  // Solid text as fill.
                  Text(
                    'ร้านกล้วยหอมจอมเทียน',
                    style: TextStyle(
                      fontSize: 45,
                      color: Colors.yellow[700],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 30,
              ),
              const Text(
                'โปรแกรมคำนวนราคากล้วยที่ใช้งานง่ายที่สุดในโลก',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Text(
                'เพียงระบุจำนวนกล้วย และราคา จากนั้นกดปุ่มคำนวณเพื่อหาราคาที่คุณต้องจ่าย',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
        )
      ],
    );
  }
}

Future<void> setURL(textURL) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString('url', textURL);
}
