import 'package:dqs_mobileapp/pages/DQS_login.dart';
import 'package:dqs_mobileapp/pages/DQS_scan.dart';
import 'package:dqs_mobileapp/states/authen.dart';
import 'package:flutter/material.dart';
import 'package:dqs_mobileapp/pages/DQS_create_qrcode.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(16, 5, 117, 35)),
      home: DQS_scanqrcode(),
    );
  }
}
